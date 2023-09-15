import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';
import 'package:newfocus_v2/src/features/authentication/screens/signup/signup_screen.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'OR',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(tLogoGoogle),
              width: 22,
            ),
            label: const Text(
              'Iniciar sesión con Google',
              style: TextStyle(
                  color: Pallete.customColor1, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ));
            },
            child: Text.rich(
              TextSpan(
                text: 'No tienes una cuenta?',
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: ' Registrate',
                    style: TextStyle(color: Pallete.customColor1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
