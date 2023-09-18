import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfocus_v2/src/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatelessWidget {
  final String? displayName;

  const DashBoard({Key? key, this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    void showBottomSheetOnce(BuildContext context) async {
      final prefs = await SharedPreferences.getInstance();
      final bool hasShownBottomSheet =
          prefs.getBool('hasShownBottomSheet') ?? false;

      if (hasShownBottomSheet) {
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

        // Marca el modal como mostrado
        await prefs.setBool('hasShownBottomSheet', true);
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheetOnce(context);
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
        backgroundColor: const Color.fromARGB(255, 204, 185, 241),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
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
          const SizedBox(height: 10.0),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
