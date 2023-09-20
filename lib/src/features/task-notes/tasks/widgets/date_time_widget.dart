import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key,
    required this.titleText,
    required this.valueText,
    required this.icon,
    required this.onTap,
  });

  final String titleText;
  final String valueText;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Material(
              child: Ink(
                child: InkWell(
                  onTap: () => onTap(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? const Color.fromARGB(255, 247, 236, 252)
                          : const Color.fromRGBO(28, 28, 31, 1),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
