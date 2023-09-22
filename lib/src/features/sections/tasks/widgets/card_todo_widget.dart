import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/sections/tasks/provider/service_provider.dart';

class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(
      data: (todoData) {
        Color categoryColor = Colors.white;
        final getCategory = todoData[getIndex].category;

        switch (getCategory) {
          case 'Casual':
            categoryColor = Pallete.categoryColor1;
            break;

          case 'Salud':
            categoryColor = Pallete.categoryColor2;
            break;

          case 'Estudio':
            categoryColor = Pallete.categoryColor3;
            break;
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.5,
              color: Pallete.borderColor1,
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: 20,
                height: 112,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 6, top: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          todoData[getIndex].titleTask,
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              decoration: todoData[getIndex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        subtitle: Text(
                          todoData[getIndex].descriptionTask,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 13,
                              decoration: todoData[getIndex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: Transform.scale(
                          scale: 1.25,
                          child: Checkbox(
                            activeColor: Pallete.borderColor1,
                            shape: const CircleBorder(),
                            value: todoData[getIndex].isDone,
                            onChanged: (value) async {
                              if (value == true) {
                                ref
                                    .read(serviceProvider)
                                    .updateTask(todoData[getIndex].docID, true);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Theme.of(context)
                                                .brightness ==
                                            Brightness.light
                                        ? const Color.fromARGB(
                                            255, 247, 236, 252)
                                        : const Color.fromRGBO(28, 28, 31, 1),
                                    content: Text(
                                      'La tarea se eliminará en 5 segundos.',
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );

                                await Future.delayed(
                                    const Duration(seconds: 4));

                                ref
                                    .read(serviceProvider)
                                    .deleteTask(todoData[getIndex].docID);
                              } else {
                                ref.read(serviceProvider).updateTask(
                                    todoData[getIndex].docID, false);
                              }
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -6),
                        child: Container(
                          child: Column(
                            children: [
                              const Divider(
                                height: 15,
                                thickness: 1.5,
                                color: Pallete.borderColor,
                              ),
                              Row(
                                children: [
                                  Text(
                                    todoData[getIndex].dateTask,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    todoData[getIndex].timeTask,
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, StackTrace) => Center(
        child: Text(
          StackTrace.toString(),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
