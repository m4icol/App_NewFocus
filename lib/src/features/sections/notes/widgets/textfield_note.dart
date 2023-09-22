import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:newfocus_v2/src/constants/colors.dart';

class TextFieldWidgetNotes extends StatefulWidget {
  final int maxLines;
  final String hintText;
  final TextEditingController txtController;

  const TextFieldWidgetNotes({
    Key? key,
    required this.maxLines,
    required this.hintText,
    required this.txtController,
  });

  @override
  State<TextFieldWidgetNotes> createState() => _TextFieldWidgetNotesState();
}

class _TextFieldWidgetNotesState extends State<TextFieldWidgetNotes> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.txtController,
      maxLines: widget.maxLines,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: widget.hintText,
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
    );
  }
}
