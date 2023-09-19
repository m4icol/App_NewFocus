import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/provider/service_provider.dart';

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
          height: 120,
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: IconButton(
                            icon: Icon(CupertinoIcons.delete),
                            onPressed: () => ref
                                .read(serviceProvider)
                                .deleteTask(todoData[getIndex].docID)),
                        title: Text(
                          todoData[getIndex].titleTask,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              decoration: todoData[getIndex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        subtitle: Text(
                          todoData[getIndex].descriptionTask,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13.5,
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
                            onChanged: (value) => ref
                                .read(serviceProvider)
                                .updateTask(todoData[getIndex].docID, value!),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -6),
                        child: Container(
                          child: Column(
                            children: [
                              const Divider(
                                thickness: 1.5,
                                color: Pallete.borderColor,
                              ),
                              Row(
                                children: [
                                  Text(todoData[getIndex].dateTask),
                                  SizedBox(width: 10),
                                  Text(todoData[getIndex].timeTask)
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
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
