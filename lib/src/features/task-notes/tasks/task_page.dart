import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/models/showModal_task.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/provider/service_provider.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/category_task.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/card_todo_widget.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class TaskPage extends ConsumerWidget {
  TaskPage({Key? key, this.displayName}) : super(key: key);

  final String? displayName;
  User? user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
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
                  CustomOutlinedButtonSmall(
                    text: '+ Agregar',
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.light
                                ? const Color.fromARGB(255, 247, 236, 252)
                                : const Color.fromRGBO(28, 28, 31, 1),
                        builder: (context) => CreateTaskShowModal(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CategoryTask(),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: todoData.value?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CardTodoListWidget(
                    getIndex: index,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
