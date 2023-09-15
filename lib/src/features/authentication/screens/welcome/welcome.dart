import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/img/login_balls.png',
            ),
            const Image(
              image: AssetImage(
                tWelcomeScreenImage,
              ),
              height: 260,
              fit: BoxFit.cover,
            ),
            const Image(
              image: AssetImage(
                tWelcomeScreenText,
              ),
              height: 20,
              fit: BoxFit.cover,
            ),
            const Text(
              'Comienza a darle un \nNuevo Enfoque a tu vida',
              style: TextStyle(
                fontSize: 21,
                height: 1.3,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 1),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 39),
              child: const Column(
                children: [
                  LoginButton(),
                  SizedBox(height: 25),
                  SingUpButton(),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Transform.rotate(
                angle: 3.14159265359,
                child: Image.asset(
                  'assets/img/login_balls.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
