import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_outlined),
                labelText: 'Correo electronico',
                hintText: 'Correo electronico',
                prefixIconColor: Pallete.customColor1,
                floatingLabelStyle:
                    const TextStyle(color: Pallete.customColor1),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Pallete.customColor1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                focusedBorder: const OutlineInputBorder(
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
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(
                  'Contraseña Olvidada?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Pallete.customColor1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const LoginButtonConfirm()
          ],
        ),
      ),
    );
  }
}
