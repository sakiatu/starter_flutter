import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starter/api/enum_error.dart';

import '../const/string.dart';

class Result {
  final QueryResult _result;

  Map<String, dynamic> get data => _result.data ?? {};

  ErrorType? get error {
    if (!hasError) return null;
    return _result.exception?.linkException != null ? ErrorType.network : ErrorType.somethingWentWrong;
  }

  bool get loading => _result.isLoading;

  bool get hasError => _result.hasException;

  bool get networkError => _result.hasException && network;

  bool get cacheError => _result.hasException && cache;

  bool get cache => _result.source == QueryResultSource.cache;

  bool get network => _result.source == QueryResultSource.network;

  String get errorMessage => '${_result.exception}';

  String get source => cache
      ? MyString.sourceCache
      : network
          ? MyString.sourceNetwork
          : MyString.sourceUnknown;

  Result(this._result);
}
