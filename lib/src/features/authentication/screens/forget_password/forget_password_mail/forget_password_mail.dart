import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';
import 'package:newfocus_v2/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45),
                const Image(image: AssetImage(tForgetPasswordImage)),
                const SizedBox(height: 40),
                Text(
                  'Recuperar \nContraseña',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ingresa en que correo deseas que te \nllegue el codigo de verificación',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline_outlined),
                    labelText: 'Correo electronico',
                    hintText: 'Correo electronico',
                    prefixIconColor: Pallete.customColor1,
                    floatingLabelStyle:
                        const TextStyle(color: Pallete.customColor1),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Pallete.customColor1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomOutlinedButton(
                  text: 'Siguiente',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OTPScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
