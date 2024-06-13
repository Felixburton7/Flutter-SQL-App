part of 'classlist_bloc.dart';

@immutable
abstract class ClasslistEvent {}

class ClasslistFetchData extends ClasslistEvent {}

class ClasslistFetchFilteredData extends ClasslistEvent {}

class ClasslistUploadData extends ClasslistEvent {
  final Classlist classlist;

  ClasslistUploadData(this.classlist);
}
