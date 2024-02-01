import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeExtn on TimeOfDay {
  DateTime get _time => DateTime(0, 0, 0, hour, minute, 0, 0, 0).toLocal();

  String get format12H => _time.format12H;

  String get format24H => _time.format24H;

  String get format12HUtc => _time.format12HUtc;

  String get format24HUtc => _time.format24HUtc;

  TimeOfDay addMinute(int minute) => TimeOfDay.fromDateTime(_time.add(Duration(minutes: minute)));

  int minuteDifference(TimeOfDay initial) => _time.difference(initial._time).inMinutes;
}

extension DateExtn on DateTime {

  String get format12H => DateFormat('hh:mm a').format(this);

  String get format24H => DateFormat('HH:mm:ss').format(this);

  String get format12HUtc => DateFormat('hh:mm a').format(toUtc());

  String get format24HUtc => DateFormat("HH:mm:ss").format(toUtc());

  String get weekdayString => DateFormat('EEE').format(this); // Mon

  String get longWeekdayString => DateFormat('EEEE').format(this); // Monday

  TimeOfDay get timeOfDay => TimeOfDay.fromDateTime(this);

  String get ddMMM => DateFormat('dd MMM').format(this); // 01 Jan

  String get EEEEddMMMM => DateFormat('EEEE, dd MMMM').format(this); // Monday, 01 January

  String get ddMMMy => DateFormat('dd MMM y').format(this); // 01 Jan 2021

  String get toNumberFormat => DateFormat('y-MM-dd').format(this); // 2021-01-01

  String get hhmmMMMdd => DateFormat('hh:mm a, MMM dd').format(this); // 12:00 PM, Jan 01

  Duration get differenceFromNow => DateTime.now().difference(this);

  bool get today => difference(DateTime.now()).inDays == 0;

  bool get yesterday => difference(DateTime.now()).inDays == -1;

  bool get tomorrow => difference(DateTime.now()).inDays == 1;

  bool get past => difference(DateTime.now()).isNegative;

  bool get future => !difference(DateTime.now()).isNegative;

  String get relative {
    return switch (difference(DateTime.now())) {
      Duration(inSeconds: final n, isNegative: true) when n.abs() < 60 => '${n.abs()} seconds ago',
      Duration(inMinutes: final n, isNegative: true) when n.abs() < 60 => '${n.abs()} minutes ago',
      Duration(inHours: final n, isNegative: true) when n.abs() < 24 => '${n.abs()} hours ago',
      Duration(inDays: 0) => 'today',
      Duration(inDays: 1) => 'tomorrow',
      Duration(inDays: -1) => 'yesterday',
      // Duration(inDays: final days, isNegative: true) => '${days.abs()} days ago',
      // Duration(inDays: final days) => '$days days from now',
      _ => DateFormat('dd MMM y').format(this), // 01 Jan 2021
    };
  }
}
