import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/feature/config/presentation/view/config_page.dart';
import 'package:starter/feature/theme/theme_cubit.dart';
import '../../core/extension/context.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(context.dark? Icons.dark_mode: Icons.light_mode),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            })
        ],
      ),
      body: Center(
        child: TextButton(child: Text('Config Page'),onPressed:()=> context.to(ConfigView())),
      ),
    );
  }
}
