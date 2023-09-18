import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: CustomAppBarProfile(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user != null)
              // Muestra la foto de perfil si está disponible.
              user.photoURL != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: 50,
                    )
                  : SizedBox(), // Si no hay foto, muestra un espacio vacío.

            const SizedBox(height: 40),

            Text(
              'Nombre',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              user?.displayName ?? "Desconocido",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 10),

            Text(
              'Email',
              style: Theme.of(context).textTheme.titleSmall,
            ),

            Text(
              user?.email ?? "Desconocido",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 50),
            const SignOutButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
