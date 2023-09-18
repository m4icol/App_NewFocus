import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    super.key,
    required this.categoryColor,
    required this.titleRadio,
  });

  final Color categoryColor;
  final String titleRadio;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: Offset(-15, 0),
            child: Text(
              titleRadio,
              style: TextStyle(
                  color: categoryColor,
                  fontSize: 12.4,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            ),
          ),
          value: 1,
          groupValue: 0,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
