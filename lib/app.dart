import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/feature/theme/theme_cubit.dart';
import 'init.dart';

import 'core/const/string.dart';
import 'core/const/theme.dart';
import 'core/router/router.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
        create: (context) => getIt<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit, bool>(
            builder: (context, dark) =>
                MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: MyString.appName,
                    theme: MyTheme.get(dark: dark),
                    routerConfig: MyRouter.config)),
      );
}
