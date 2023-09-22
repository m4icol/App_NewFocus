import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/sections/notes/note_editor.dart';
import 'package:newfocus_v2/src/features/sections/notes/notes_card.dart';
import 'package:newfocus_v2/src/features/sections/notes/notes_reader.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';
import 'package:newfocus_v2/src/widgets/days_header.dart';

class NotesPage extends StatelessWidget {
  NotesPage({Key? key, this.displayName});

  final String? displayName;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingWidget(
                displayName: user?.displayName,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tus notas',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NoteEditorScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("notes")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final note = snapshot.data!.docs[index];
                          return noteCard(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NoteReaderScreen(note),
                                  ),
                                );
                              },
                              note,
                              () {
                                FirebaseFirestore.instance
                                    .collection("notes")
                                    .doc(note.id)
                                    .delete();
                              });
                        },
                      );
                    }
                    return Text('No hay notas');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void deleteNoteAndNavigateBack(
    BuildContext context, QueryDocumentSnapshot doc) {
  FirebaseFirestore.instance.collection("notes").doc(doc.id).delete();
  Navigator.popUntil(
      context, ModalRoute.withName('/notes')); // Vuelve a NotesPage
}
