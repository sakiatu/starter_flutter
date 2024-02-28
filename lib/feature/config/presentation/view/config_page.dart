import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'update_page.dart';
import '../../../../init.dart';

import '../bloc/config_bloc.dart';
import 'maintenance_page.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: BlocProvider(
          create: (context) => getIt<ConfigBloc>()..add(ConfigGet()),
          child: BlocBuilder<ConfigBloc, ConfigState>(
            builder: (context, state) {
              return switch (state.runtimeType) {
                ConfigLoading => const CircularProgressIndicator(),
                ConfigUpdateMode => const UpdateView(),
                ConfigMaintenanceMode => const MaintenanceView(),
                _ => const Text('No Mode'),
              };
            },
          ),
        ),
      ));
}
