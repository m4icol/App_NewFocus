import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/image_strings.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(tWelcomeScreenImage),
          height: 160,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            SizedBox(width: 15),
            Image(
              image: AssetImage(
                tWelcomeScreenText,
              ),
              height: 18,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}
