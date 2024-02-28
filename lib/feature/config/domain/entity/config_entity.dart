import 'dart:io';

import 'package:equatable/equatable.dart';
import '../../../../core/const/config.dart';

class Config extends Equatable {
  final bool maintenanceMode;
  final int minAndroidVersion;
  final int minIosVersion;
  final String androidAppUrl;
  final String iosAppUrl;

  const Config({
    required this.maintenanceMode,
    required this.minAndroidVersion,
    required this.minIosVersion,
    required this.androidAppUrl,
    required this.iosAppUrl,
  });

  factory Config.empty() => const Config(
        maintenanceMode: false,
        minAndroidVersion: 0,
        minIosVersion: 0,
        androidAppUrl: '',
        iosAppUrl: '',
      );

  bool get isEmpty => this == Config.empty();

  bool get updateMode {
    if (Platform.isAndroid) return minAndroidVersion > MyConfig.appVersion;
    if (Platform.isIOS) return minIosVersion > MyConfig.appVersion;
    return false;
  }

  @override
  List<Object?> get props => [maintenanceMode, minAndroidVersion, minIosVersion, androidAppUrl, iosAppUrl];
}
