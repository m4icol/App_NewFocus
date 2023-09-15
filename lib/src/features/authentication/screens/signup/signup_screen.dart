import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/authentication/screens/signup/widget_signup/signup_footer.dart';
import 'package:newfocus_v2/src/features/authentication/screens/signup/widget_signup/signup_form.dart';
import 'package:newfocus_v2/src/widgets/form_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                // Section 1

                FormHeader(),

                // End
                // Section 2

                SignUpForm(),

                // End
                // Section 2

                SignUpFooter()

                // End
              ],
            ),
          ),
        ),
      ),
    );
  }
}
