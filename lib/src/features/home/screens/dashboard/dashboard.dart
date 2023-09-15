import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/home/screens/dashboard/widgets/category_dashboard.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey <User>',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Como va tu día?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                SizedBox(height: 20),

                // Category
                CategoryDashBoard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
