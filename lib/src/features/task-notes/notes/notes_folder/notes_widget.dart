import 'package:flutter/material.dart';
import 'package:newfocus_v2/main.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/model.dart';

class NoteWidget extends StatefulWidget {
  final NotesModel note;

  const NoteWidget(this.note, {Key? key}) : super(key: key);

  @override
  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  final notesBox = objectBox.store.box<NotesModel>();

  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Pallete.backgroundColor,
          title: const Text(
            '¿Estás seguro?',
            style: TextStyle(
              color: Pallete.text,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          content: Text(
            '¿Quieres eliminar la nota "${widget.note.title}"?',
            style: const TextStyle(
              color: Pallete.text,
              fontWeight: FontWeight.w400,
              fontSize: 14.6,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Pallete.appBarNew,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 147, 107, 170),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  color: Pallete.appBarFocus,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 147, 107, 170),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                notesBox.remove(widget.note.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
        top: 15,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.borderColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.note.title,
                  style: const TextStyle(
                    color: Pallete.text,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showDeleteConfirmationDialog();
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Pallete.customColor1,
                ),
              ),
            ],
          ),
          const Divider(
            color: Pallete.borderColor,
            thickness: 2,
            height: 20,
          ),
          const SizedBox(height: 8),
          Text(
            widget.note.description,
            style: const TextStyle(
              color: Pallete.text,
              fontSize: 14.6,
            ),
          ),
        ],
      ),
    );
  }
}
