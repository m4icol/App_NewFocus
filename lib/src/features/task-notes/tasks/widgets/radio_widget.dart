import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/src/constants/colors.dart';
import 'package:newfocus_v2/src/features/task-notes/tasks/provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.categoryColor,
    required this.titleRadio,
    required this.valueInput,
    required this.onChangeValue,
  });

  final Color categoryColor;
  final String titleRadio;
  final int valueInput;
  final VoidCallback onChangeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
          activeColor: categoryColor,
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
          value: valueInput,
          groupValue: radio,
          onChanged: (value) => onChangeValue(),
        ),
      ),
    );
  }
}
