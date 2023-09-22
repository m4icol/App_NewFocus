import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';
import 'package:newfocus_v2/src/widgets/days_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatelessWidget {
  final String? displayName;

  const DashBoard({Key? key, this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingWidget(
                  displayName: user?.displayName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
