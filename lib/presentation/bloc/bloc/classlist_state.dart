part of 'classlist_bloc.dart';

@immutable
abstract class ClasslistState {}

class ClasslistInitial extends ClasslistState {}

class ClasslistDisplaySuccess extends ClasslistState {
  final List<Classlist> classlists;

  ClasslistDisplaySuccess(this.classlists);
}

class ClasslistFilteredDisplaySuccess extends ClasslistState {
  final List<ClasslistFiltered> filteredClasslists;

  ClasslistFilteredDisplaySuccess(this.filteredClasslists);
}

class ClasslistUploadSuccess extends ClasslistState {}

class ClasslistLoading extends ClasslistState {}

class ClasslistUploadFailure extends ClasslistState {
  final String error;

  ClasslistUploadFailure({required this.error});
}
