import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/models/todo_modal.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('newfocusApp');

  void addNewTask(TodoModal modal) {
    todoCollection.add(modal.toMap());
  }

  void updateTask(String? docID, bool valueUpdate) {
    todoCollection.doc(docID).update({'isDone': valueUpdate});
  }

  void deleteTask(String? docID) {
    todoCollection.doc(docID).delete();
  }
}
