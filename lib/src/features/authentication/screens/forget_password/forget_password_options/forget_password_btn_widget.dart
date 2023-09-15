import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class ForgetPasswordBtn extends StatelessWidget {
  const ForgetPasswordBtn({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Pallete.customColor1,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 40, color: Pallete.borderColor),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Pallete.borderColor),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Pallete.borderColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
