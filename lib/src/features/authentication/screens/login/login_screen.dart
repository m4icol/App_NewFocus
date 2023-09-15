import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/authentication/screens/login/widgets_login/login_footer.dart';
import 'package:newfocus_v2/src/features/authentication/screens/login/widgets_login/login_form.dart';
import 'package:newfocus_v2/src/widgets/form_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1

                FormHeader(),

                // End
                // Section 2

                LoginForm(),

                // End
                // Section 3

                LoginFooter()

                // End
              ],
            ),
          ),
        ),
      ),
    );
  }
}
