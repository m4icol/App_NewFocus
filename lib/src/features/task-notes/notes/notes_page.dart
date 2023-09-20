import 'package:flutter/material.dart';
import 'package:newfocus_v2/main.dart';
import 'package:newfocus_v2/objectbox.g.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

import 'model_notes.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Box<Note>? notesBox; // Usa el modelo de NotesModel
  Stream<List<Note>>? fetchAllNotes;

  @override
  void initState() {
    super.initState();
    notesBox = objectBox.store.box<Note>(); // Usa el box de NotesModel
    print(notesBox!.count());
    setState(() {
      fetchAllNotes = notesBox!
          .query()
          .watch(triggerImmediately: true)
          .map((event) => event.find());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Notes',
                      style: TextStyle(
                        color: Pallete.text,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(width: 126),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.borderColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          // const NotesCreatorScreen(), // Usa la pantalla de creación de notas
                          //   ),
                          // );
                        },
                        icon: const Icon(Icons.add),
                        color: Pallete.customColor1,
                        iconSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              StreamBuilder<List<Note>>(
                // Usa el modelo de NotesModel
                stream: fetchAllNotes!,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final notes = snapshot.data ?? [];

                    if (notes.isEmpty) {
                      return const Center(
                        child: Text(
                          'No hay notas. ¡Crea una nueva!', // Cambia el mensaje
                          style: TextStyle(
                            color: Pallete.text,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        //NoteWidget(
                        //notes[index]); // Usa el widget para mostrar notas
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
