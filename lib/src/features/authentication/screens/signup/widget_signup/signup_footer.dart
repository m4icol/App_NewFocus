import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';
import 'package:newfocus_v2/src/features/authentication/screens/login/login_screen.dart';

class SignUpFooter extends StatelessWidget {
  SignUpFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          'OR',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {
              signInWithGoogle();
            },
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
                builder: (context) => LoginScreen(),
              ));
            },
            child: Text.rich(
              TextSpan(
                text: 'Ya tienes una cuenta?',
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: ' Inicia sesión',
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

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
  }
}
