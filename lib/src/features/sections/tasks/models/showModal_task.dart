import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/sections/tasks/models/todo_modal.dart';
import 'package:newfocus_v2/src/features/sections/tasks/provider/date_time_provider.dart';
import 'package:newfocus_v2/src/features/sections/tasks/provider/radio_provider.dart';
import 'package:newfocus_v2/src/features/sections/tasks/provider/service_provider.dart';
import 'package:newfocus_v2/src/features/sections/tasks/widgets/date_time_widget.dart';
import 'package:newfocus_v2/src/features/sections/tasks/widgets/radio_widget.dart';
import 'package:newfocus_v2/src/features/sections/tasks/widgets/textfield_widget.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';

class CreateTaskShowModal extends ConsumerWidget {
  CreateTaskShowModal({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Titulo de la Tarea',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          TextFieldWidget(
            maxLines: 1,
            hintText: 'Agregar título',
            txtController: titleController,
          ),
          const SizedBox(height: 20),
          Text(
            'Descripcion de la Tarea',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          TextFieldWidget(
            maxLines: 2,
            hintText: 'Agregar descripción',
            txtController: descriptionController,
          ),
          const SizedBox(height: 18),
          Text(
            'Categoría',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                  categoryColor: Pallete.categoryColor1,
                  titleRadio: 'Casual',
                  valueInput: 1,
                  onChangeValue: () => ref.read(radioProvider.notifier).update(
                        (state) => 1,
                      ),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categoryColor: Pallete.categoryColor2,
                  titleRadio: 'Salud',
                  valueInput: 2,
                  onChangeValue: () => ref.read(radioProvider.notifier).update(
                        (state) => 2,
                      ),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categoryColor: Pallete.categoryColor3,
                  titleRadio: 'Estudio',
                  valueInput: 3,
                  onChangeValue: () => ref.read(radioProvider.notifier).update(
                        (state) => 3,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Fecha',
                valueText: dateProv,
                icon: CupertinoIcons.calendar,
                onTap: () async {
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  );

                  if (getValue != null) {
                    final format =
                        DateFormat('dd/MM/yyyy'); // Cambia el formato aquí
                    ref.read(dateProvider.notifier).update(
                          (state) => format.format(getValue),
                        );
                  }
                },
              ),
              SizedBox(width: 20),
              DateTimeWidget(
                titleText: 'Hora',
                valueText: ref.watch(timeProvider),
                icon: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (getTime != null) {
                    ref.read(timeProvider.notifier).update(
                          (state) => getTime.format(context),
                        );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButtonBorder(
                  text: 'Cancelar',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomOutlinedButton(
                  text: 'Agregar',
                  onPressed: () {
                    final getRadioValue = ref.read(radioProvider);
                    String category = '';

                    switch (getRadioValue) {
                      case 1:
                        category = 'Casual';
                        break;
                      case 2:
                        category = 'Salud';
                        break;
                      case 3:
                        category = 'Estudio';
                        break;
                    }

                    ref.read(serviceProvider).addNewTask(
                          TodoModal(
                            titleTask: titleController.text,
                            descriptionTask: descriptionController.text,
                            category: category,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                            isDone: false,
                          ),
                        );

                    titleController.clear();
                    descriptionController.clear();
                    ref.read(radioProvider.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
