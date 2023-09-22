import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/sections/header/calendar.dart';

class GreetingWidget extends StatelessWidget {
  final String? displayName;
  final User? user = FirebaseAuth.instance.currentUser;
  final VoidCallback? onTap;

  GreetingWidget({Key? key, this.displayName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CalendarPage(),
          ),
        );
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey, ${user?.displayName ?? "Desconocido"}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Cómo va tu día?',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Divider(
              height: 30,
              thickness: 2,
              color: Pallete.borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
