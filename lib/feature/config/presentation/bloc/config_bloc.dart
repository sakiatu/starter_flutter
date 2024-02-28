import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/param/get_config_param.dart';
import '../../domain/usecase/get_config_usecase.dart';

part 'config_event.dart';

part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc({
    required GetConfigUseCase getConfigUseCase,
  })  : _getConfigUseCase = getConfigUseCase,
        super(ConfigInitial()) {
    on<ConfigGetConfig>(_onConfigGetConfig);
  }

  final GetConfigUseCase _getConfigUseCase;

  Future<FutureOr<void>> _onConfigGetConfig(ConfigGetConfig event, Emitter<ConfigState> emit) async {
    await _getConfigUseCase(GetConfig(name:''));
  }
}
