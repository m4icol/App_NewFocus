import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    // Titulo de cada sección
    titleMedium: TextStyle(
        color: Color.fromARGB(255, 28, 28, 28),
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 1.2),

    // Titulo de cada task/note
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 28, 28, 28),
      fontSize: 22,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    ),

    // Textos/Descripciones
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 28, 28, 28),
      fontSize: 14.6,
      fontWeight: FontWeight.w400,
    ),

    bodySmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),

    labelMedium: TextStyle(
      color: Color.fromARGB(255, 28, 28, 28),
      fontSize: 15,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    // Titulo de cada sección
    titleMedium: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 1.2),

    // Titulo de cada task/note
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 22,
      fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,
    ),

    // Textos/Descripciones
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 14.6,
      fontWeight: FontWeight.w400,
    ),

    bodySmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),

    labelMedium: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 15,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

class StylizedText extends TextSpan {
  StylizedText({
    required String firstPart,
    required String secondPart,
    Key? key,
  }) : super(
          children: [
            TextSpan(
              text: firstPart,
              style: const TextStyle(
                color: Pallete.appBarNew,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: secondPart,
              style: const TextStyle(
                color: Pallete.appBarFocus,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        );
}
