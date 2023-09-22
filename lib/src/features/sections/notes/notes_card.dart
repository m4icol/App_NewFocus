import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

Widget noteCard(
    Function()? onTap, QueryDocumentSnapshot doc, Function() onDelete) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(top: 15, left: 17, bottom: 15, right: 18),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: Pallete.borderColor1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            doc["note_content"],
            style: const TextStyle(
              fontSize: 14,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
