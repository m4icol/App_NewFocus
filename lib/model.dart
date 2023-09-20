import 'package:objectbox/objectbox.dart';

@Entity()
class NotesModel {
  int id;
  String title;
  String description;

  NotesModel({this.id = 0, required this.title, required this.description});
}
