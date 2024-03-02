import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../init.dart';
import '../bloc/config_bloc.dart';
import 'maintenance_view.dart';
import 'update_view.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: BlocProvider(
          create: (context) => getIt<ConfigBloc>()..add(ConfigGet()),
          child: BlocBuilder<ConfigBloc, ConfigState>(
            builder: (context, state) {
              if (state is ConfigLoading) {
                return const CircularProgressIndicator();
              } else if (state is ConfigUpdateMode) {
                return UpdateView(
                    onUpdateButtonClick: () => context.read<ConfigBloc>().add(ConfigUpdateButtonClick(state.appUrl)));
              } else if (state is ConfigMaintenanceMode) {
                return const MaintenanceView();
              } else {
                return const Text('No Mode');
              }
            },
          ),
        ),
      ));
}
