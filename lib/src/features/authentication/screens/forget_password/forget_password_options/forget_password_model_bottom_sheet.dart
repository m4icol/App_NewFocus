import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:newfocus_v2/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.48,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elige una opción!',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(
                'Selecciona una de la opciones para restablecer su contraseña.',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 30),
            ForgetPasswordBtn(
              btnIcon: Icons.mail_outline_rounded,
              title: 'Correo Electronico',
              subtitle: 'Restableces contraseña',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgetPasswordMailScreen(),
                ));
              },
            ),
            const SizedBox(height: 20),
            ForgetPasswordBtn(
              btnIcon: Icons.mobile_friendly_rounded,
              title: 'Numero Telefonico',
              subtitle: 'Restableces contraseña',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
