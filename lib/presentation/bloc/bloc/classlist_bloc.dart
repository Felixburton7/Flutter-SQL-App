import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_testing_queries/data/datasources/data_from_supabase.dart';
import 'package:supabase_testing_queries/data/models/data_model.dart';

part 'classlist_event.dart';
part 'classlist_state.dart';

class ClasslistBloc extends Bloc<ClasslistEvent, ClasslistState> {
  final DataSourceImpl dataSource;

  ClasslistBloc({required this.dataSource}) : super(ClasslistInitial()) {
    on<ClasslistFetchData>(_onClasslistFetchData);
    on<ClasslistUploadData>(_onClasslistUploadData);
    on<ClasslistFetchFilteredData>(_onClasslistFetchFilteredData);
  }

  void _onClasslistFetchData(
    ClasslistFetchData event,
    Emitter<ClasslistState> emit,
  ) async {
    emit(ClasslistLoading());
    try {
      final classlists = await dataSource.fetchData();
      emit(ClasslistDisplaySuccess(classlists));
    } catch (e) {
      emit(ClasslistUploadFailure(error: 'Error in bloc fetching data'));
    }
  }

  void _onClasslistFetchFilteredData(
    ClasslistFetchFilteredData event,
    Emitter<ClasslistState> emit,
  ) async {
    emit(ClasslistLoading());
    try {
      final filteredClasslists = await dataSource.fetchFilterData();
      emit(ClasslistFilteredDisplaySuccess(filteredClasslists));
    } catch (e) {
      emit(ClasslistUploadFailure(error: 'Error in bloc fetching data'));
    }
  }

  void _onClasslistUploadData(
    ClasslistUploadData event,
    Emitter<ClasslistState> emit,
  ) async {
    emit(ClasslistLoading());
    try {
      await dataSource.createData(event.classlist);
      emit(ClasslistUploadSuccess());
    } catch (e) {
      emit(ClasslistUploadFailure(error: 'Error in bloc uploading data'));
    }
  }
}
