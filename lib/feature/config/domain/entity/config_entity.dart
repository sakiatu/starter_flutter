import 'dart:io';

import 'package:equatable/equatable.dart';

class Config extends Equatable {
  final bool maintenanceMode;
  final bool updateMode;
  final String appUrl;

  const Config({
    required this.maintenanceMode,
    required this.updateMode,
    required this.appUrl,
  });

  factory Config.empty() => const Config(
        maintenanceMode: false,
        updateMode: false,
        appUrl: '',
      );

  bool get isEmpty => this == Config.empty();

  @override
  List<Object?> get props => [maintenanceMode, updateMode, appUrl];
}
