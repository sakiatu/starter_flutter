import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'feature/theme/controller_theme.dart';

import 'const/string.dart';
import 'const/theme.dart';
import 'feature/home/page_home.dart';
import 'firebase_options.dart';
import 'helper/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        builder: (controller) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: MyString.appName,
              themeMode: controller.darkMode.value ? ThemeMode.dark : ThemeMode.light,
              theme: MyTheme.lightTheme,
              darkTheme: MyTheme.darkTheme,
              home: const HomePage(),
              // home: FirebaseAuth.instance.currentUser != null ? const Homepage() : const PhonePage(),
            ));
  }
}
