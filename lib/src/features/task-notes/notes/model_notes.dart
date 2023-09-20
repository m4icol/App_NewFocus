import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  int id;
  String title;
  String content;

  Note(this.id, this.title, this.content);
}
