import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/task-notes/notes/widgets/textfield_note.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/widgets/textfield_widget.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  // Método para mostrar un SnackBar con el mensaje de error.
  void _showErrorSnackBar(String message, BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 18,
          child: Text(
            message,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? const Color.fromRGBO(28, 28, 31, 1)
                  : const Color.fromARGB(255, 247, 236, 252),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? const Color.fromARGB(255, 247, 236, 252)
            : const Color.fromRGBO(28, 28, 31, 1),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Titulo de la Tarea',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            TextFieldWidgetNotes(
              maxLines: 1,
              hintText: 'Titulo de la nota',
              txtController: _titleController,
            ),
            const SizedBox(height: 20),
            Text(
              'Descripción de la nota',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            TextFieldWidgetNotes(
              maxLines: 10,
              hintText: 'Descripción de la nota',
              txtController: _mainController,
            ),
            const SizedBox(height: 40),
            CustomOutlinedButton(
              text: 'Agregar',
              onPressed: () async {
                final title = _titleController.text;
                final content = _mainController.text;

                if (title.isEmpty || content.isEmpty) {
                  _showErrorSnackBar(
                      'El título y la descripción no pueden estar vacíos.',
                      context);
                } else {
                  FirebaseFirestore.instance.collection("notes").add(
                    {
                      "note_title": title,
                      "note_content": content,
                    },
                  ).then((value) {
                    print(value.id);
                    Navigator.pop(context);
                  }).catchError(
                    (error) => print("Error al crear una nueva nota. $error"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
