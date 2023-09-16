import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      title: const Image(
        image: AssetImage(
          tWelcomeScreenText,
        ),
        height: 14,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            await GoogleSignIn().signOut();
            FirebaseAuth.instance.signOut();
          },
          icon: const Icon(Icons.person),
          color: Theme.of(context).iconTheme.color,
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
        ),
      ],
    );
  }
}
