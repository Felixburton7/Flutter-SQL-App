import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/data_model.dart';

class DataSourceImpl {
  final SupabaseClient supabase;

  DataSourceImpl({required this.supabase});

  Future<List<Classlist>> fetchData() async {
    try {
      final response = await supabase.from('classlist').select();
      final data = response as List<dynamic>;
      return data
          .map((item) => Classlist.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  Future<void> createData(Classlist classlist) async {
    try {
      await supabase.from('classlist').insert(classlist.toJson());
    } catch (error) {
      throw Exception('Error creating data: $error');
    }
  }

  Future<List<ClasslistFiltered>> fetchFilterData() async {
    try {
      final response = await supabase.from('classlist').select('name');
      final data = response as List<dynamic>;
      return data
          .map((item) =>
              ClasslistFiltered.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw Exception('Error fetching Name: $error');
    }
  }
}
