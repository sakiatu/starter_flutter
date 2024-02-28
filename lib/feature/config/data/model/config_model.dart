import 'package:equatable/equatable.dart';

class ConfigModel extends Equatable {
  final String key;
  final String? value;

  const ConfigModel({
    required this.key,
    required this.value,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        key: json['key'],
        value: json['value'],
      );

  @override
  List<Object?> get props => [];
}
