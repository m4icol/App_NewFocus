import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/features/home/screens/dashboard/widgets/category_dashboard.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';

class DashBoard extends StatelessWidget {
  final String? displayName;

  const DashBoard({Key? key, this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    // Variable para rastrear si ya se mostró el BottomSheet
    bool isBottomSheetShown = false;

    // Función para mostrar el BottomSheet
    void showBottomSheetOnce() {
      if (!isBottomSheetShown) {
        isBottomSheetShown = true;
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.33,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('¿Cómo te sientes hoy?',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Text(
                    'Elige una de las opciones que se ajuste a tu estado de ánimo.',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 30),
                Row(
                  children: [
                    buildEmojiButton(
                      'assets/img/emojis/Excelente.png',
                      'Excelente',
                      context,
                    ),
                    SizedBox(width: 13),
                    buildEmojiButton(
                      'assets/img/emojis/Bien.png',
                      'Bien',
                      context,
                    ),
                    SizedBox(width: 13),
                    buildEmojiButton(
                      'assets/img/emojis/Meh.png',
                      'Meh',
                      context,
                    ),
                    SizedBox(width: 13),
                    buildEmojiButton(
                      'assets/img/emojis/Mal.png',
                      'Mal',
                      context,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }

    // Llama a la función para mostrar el BottomSheet automáticamente
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showBottomSheetOnce();
    });

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
                  'Hey, ${user?.displayName ?? "Desconocido"}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Cómo va tu día?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                CategoryDashBoard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmojiButton(
      String imageAsset, String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 204, 185, 241),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            width: 32.0,
            height: 32.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
