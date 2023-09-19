import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/models/todo_modal.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/services/todo_service.dart';

final serviceProvider = StateProvider<TodoService>((ref) {
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModal>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('newfocusApp')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TodoModal.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
