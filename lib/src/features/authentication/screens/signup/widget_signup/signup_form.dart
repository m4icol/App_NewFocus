import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';
import 'package:newfocus_v2/src/widgets/navigation_bar.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            TextFormField(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_outlined),
                labelText: 'Nombre de usuario',
                hintText: 'Nombre de usuario',
                prefixIconColor: Pallete.customColor1,
                floatingLabelStyle:
                    const TextStyle(color: Pallete.customColor1),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 2, color: Pallete.customColor1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Correo electronico',
                hintText: 'Correo electronico',
                prefixIconColor: Pallete.customColor1,
                floatingLabelStyle:
                    const TextStyle(color: Pallete.customColor1),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 2, color: Pallete.customColor1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: 'Contraseña',
                hintText: 'Contraseña',
                prefixIconColor: Pallete.customColor1,
                floatingLabelStyle:
                    const TextStyle(color: Pallete.customColor1),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(width: 2, color: Pallete.customColor1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color: Pallete.customColor1,
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomOutlinedButton(
              text: 'Ingresar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationBarWidget()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
