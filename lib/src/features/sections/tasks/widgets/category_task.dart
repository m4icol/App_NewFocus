import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class CategoryTask extends StatelessWidget {
  const CategoryTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color.fromARGB(255, 88, 88, 88),
                  width: 1.2,
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: 150,
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Pallete.categoryColor1,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Casual',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '<Cantidad>',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color.fromARGB(255, 88, 88, 88),
                  width: 1.2,
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: 150,
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Pallete.categoryColor2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Salud',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '<Cantidad>',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color.fromARGB(255, 88, 88, 88),
                  width: 1.2,
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: 150,
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Pallete.categoryColor3),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Estudio',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '<Cantidad>',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
