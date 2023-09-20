import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newfocus_v2/firebase_options.dart';
import 'package:newfocus_v2/objectbox.g.dart';
import 'package:newfocus_v2/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:newfocus_v2/src/utils/theme/theme.dart';
import 'package:objectbox/objectbox.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: OnBoardingScreen(),
      ),
    );
  }
}

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {}

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
