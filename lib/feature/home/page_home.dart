import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/controller_theme.dart';

class HomePage extends GetView<ThemeController> {
  List<Widget> actions(BuildContext context) =>
      [IconButton(icon: const Icon(Icons.light_mode), onPressed: controller.toggleTheme)];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Home'), actions: actions(context)),
      body: ListView(children: [Text('Bismillah')]));
}
