import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/config_entity.dart';
import '../../domain/param/get_config_param.dart';
import '../../domain/usecase/get_config_usecase.dart';

part 'config_event.dart';

part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc({
    required GetConfigUseCase getConfigUseCase,
  })  : _getConfigUseCase = getConfigUseCase,
        super(ConfigLoading()) {
    on<ConfigGet>(_onConfigGet);
  }

  final GetConfigUseCase _getConfigUseCase;

  Future<FutureOr<void>> _onConfigGet(ConfigGet event, Emitter<ConfigState> emit) async {
    final res = await _getConfigUseCase(GetConfig());
    res.fold((l) => emit(ConfigError(l.toString())), (r) {
      if(r.updateMode) emit(ConfigUpdateMode());
      else if(r.maintenanceMode) emit(ConfigMaintenanceMode());
      else emit(ConfigNoMode());
    });
  }
}
