import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/provider/date_time_provider.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/provider/radio_provider.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/date_time_widget.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/radio_widget.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:provider/provider.dart';

class CreateTaskShowModal extends ConsumerWidget {
  const CreateTaskShowModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.76,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Nueva Tarea',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const Divider(
            height: 37,
            color: Pallete.borderColor1,
            thickness: 1.5,
          ),
          Text(
            'Titulo de la Tarea',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 1,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'Agregar titulo',
              prefixIconColor: Pallete.customColor1,
              floatingLabelStyle: const TextStyle(color: Pallete.customColor1),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 2, color: Pallete.customColor1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Descripcion de la Tarea',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 4,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'Agregar descripción',
              prefixIconColor: Pallete.customColor1,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Pallete.customColor1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              floatingLabelStyle: const TextStyle(color: Pallete.customColor1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
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
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );

                  if (getValue != null) {
                    final format = DateFormat.yMd();
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
          const Row(
            children: [
              Expanded(
                child: CancelTask(),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CreateTask(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
