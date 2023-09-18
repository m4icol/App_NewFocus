import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/constants/colors.dart';

class CardTodoListWidget extends StatelessWidget {
  const CardTodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.5,
          color: Pallete.customColor1,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Pallete.categoryColor1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Titulo de prueba',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('Descripcion de prueba'),
                    trailing: Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        activeColor: Pallete.categoryColor1,
                        shape: const CircleBorder(),
                        value: true,
                        onChanged: (value) => print(value),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -3),
                    child: Container(
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 1.5,
                            color: Pallete.borderColor,
                          ),
                          Row(
                            children: [
                              Text('Hoy'),
                              SizedBox(width: 10),
                              Text('09:12PM- 11:45PM')
                            ],
                          ),
                        ],
                      ),
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
