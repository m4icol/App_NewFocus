import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/date_time_widget.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/radio_widget.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';

class CreateTaskShowModal extends StatelessWidget {
  const CreateTaskShowModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const Row(
            children: [
              Expanded(
                child: RadioWidget(
                  categoryColor: Pallete.categoryColor1,
                  titleRadio: 'Casual',
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categoryColor: Pallete.categoryColor2,
                  titleRadio: 'Salud',
                ),
              ),
              Expanded(
                child: RadioWidget(
                  categoryColor: Pallete.categoryColor3,
                  titleRadio: 'Estudio',
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Fecha',
                valueText: 'dd/mm/yy',
                icon: CupertinoIcons.calendar,
              ),
              SizedBox(width: 20),
              DateTimeWidget(
                titleText: 'Hora',
                valueText: 'hh : mm',
                icon: CupertinoIcons.clock,
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
