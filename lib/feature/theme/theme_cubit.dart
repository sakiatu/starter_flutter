import 'package:bloc/bloc.dart';

import '../../core/database/local_db.dart';

class ThemeCubit extends Cubit<bool> {
  final LocalDb _localDb;

  ThemeCubit(this._localDb) : super(_localDb.darkMode);

  void toggleTheme() {
    final dark = !state;
    _localDb.saveDarkMode(dark);
    emit(dark);
  }
}
