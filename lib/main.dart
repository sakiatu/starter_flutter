import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:starter/component/error.dart';
import 'package:starter/component/loader.dart';
import 'package:starter/feature/auth/page_auth.dart';
import 'package:starter/feature/config/controller_config.dart';
import 'package:starter/feature/update/page_update.dart';

import 'const/string.dart';
import 'const/theme.dart';
import 'feature/auth/controller_auth.dart';
import 'feature/home/page_home.dart';
import 'feature/maintenance/page_maintenance.dart';
import 'feature/theme/controller_theme.dart';
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
        builder: (theme) => GetBuilder<ConfigController>(
            builder: (config) => GetBuilder<AuthController>(
                builder: (auth) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: MyString.appName,
                    theme: MyTheme.get(theme.darkMode.value),
                    home: _getHome(config, auth)))));
  }

  Widget _getHome(ConfigController config, AuthController auth) {
    if (config.loading.value) return const LoaderPage();
    if (config.error.value != null) return ErrorPage(action: config.loadData);
    if (config.updateMode.value) return UpdatePage(config.appLink);
    if (config.maintenanceMode.value) return const MaintenancePage();
    if (auth.authenticated.value) return HomePage();

    // return const AuthPage();
    return HomePage();
  }
}
