part of 'config_bloc.dart';

@immutable
abstract class ConfigState {}

class ConfigLoading extends ConfigState {}
class ConfigUpdateMode extends ConfigState {
  final String appUrl;
  ConfigUpdateMode(this.appUrl);
}
class ConfigMaintenanceMode extends ConfigState {}
class ConfigNoMode extends ConfigState {}

class ConfigError extends ConfigState {
  final String message;
  ConfigError(this.message);
}
