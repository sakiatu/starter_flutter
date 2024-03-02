part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent {}

class ConfigGet extends ConfigEvent {}

class ConfigUpdateButtonClick extends ConfigEvent {
  final String appUrl;

  ConfigUpdateButtonClick(this.appUrl);
}
