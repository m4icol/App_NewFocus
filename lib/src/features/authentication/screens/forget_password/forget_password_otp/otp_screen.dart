import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';
import 'package:newfocus_v2/src/utils/theme/widget_themes/button_theme.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Image(
                image: AssetImage(
                  tWelcomeScreenImage,
                ),
                height: 320,
                fit: BoxFit.cover,
              ),
              const Text(
                'VERIFICACIÓN',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ingresa el codigo de verificacion enviado',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 60),
              OtpTextField(
                numberOfFields: 6,
                fillColor:
                    const Color.fromARGB(255, 138, 112, 175).withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  print('OTP is => $code');
                },
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 60),
              OTPButtom(),
            ],
          ),
        ),
      ),
    );
  }
}
