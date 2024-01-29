import 'package:flutter/material.dart';

import 'const/string.dart';
import 'const/theme.dart';
import 'feature/home/page_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await gdi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyString.appName,
      themeMode: ThemeMode.system,
      // themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: const HomePage(),
      // home: FirebaseAuth.instance.currentUser != null ? const Homepage() : const PhonePage(),
    );
  }
}
