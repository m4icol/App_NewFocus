import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/category_task.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:newfocus_v2/src/widgets/card_todo_widget.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class TaskPage extends StatelessWidget {
  final String? displayName;

  TaskPage({Key? key, this.displayName}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey, ${user?.displayName ?? "Desconocido"}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Cómo va tu día?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                  color: Pallete.borderColor,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tus tareas',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          '<Cantidad>',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const NewTask(),
                  ],
                ),
                const SizedBox(height: 20),
                const CategoryTask(),
                const SizedBox(height: 30),
                ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => CardTodoListWidget()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
