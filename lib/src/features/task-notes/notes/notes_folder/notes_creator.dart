import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newfocus_v2/main.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/model.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class NotesCreatorScreen extends StatefulWidget {
  const NotesCreatorScreen({Key? key}) : super(key: key);

  @override
  _NotesCreatorScreenState createState() => _NotesCreatorScreenState();
}

class _NotesCreatorScreenState extends State<NotesCreatorScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Notes Creator',
                style: TextStyle(
                  color: Pallete.text,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(
                    color: Pallete.borderColor,
                    width: 3,
                  ),
                ),
                child: TextField(
                  controller: _titleController,
                  style: const TextStyle(color: Pallete.text),
                  decoration: const InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Pallete.borderColor),
                    hintText: "Title for the note",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(
                    color: Pallete.borderColor,
                    width: 3,
                  ),
                ),
                child: TextField(
                  controller: _descriptionController,
                  style: const TextStyle(color: Pallete.text),
                  maxLines: 5,
                  decoration: const InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Pallete.borderColor),
                    hintText: "Description for the note",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final title = _titleController.text;
                  final description = _descriptionController.text;

                  if (title.isNotEmpty) {
                    final note = NotesModel(
                      title: title,
                      description: description,
                    );

                    final notesBox = objectBox.store.box<NotesModel>();
                    notesBox.put(note);

                    Navigator.of(context).pop(true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Por favor, ingresa un nombre para la tarea.'),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Pallete.customColor1),
                ),
                child: const Text('Save Note'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
