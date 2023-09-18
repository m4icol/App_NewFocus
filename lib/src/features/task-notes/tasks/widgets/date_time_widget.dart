import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.titleText,
    required this.valueText,
    required this.icon,
  });

  final String titleText;
  final String valueText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 9),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1.3,
                  color: Pallete.borderColor1,
                ),
              ),
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 7),
                  Text(
                    valueText,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
