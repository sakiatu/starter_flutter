import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starter/const/string.dart';

class Result {
  final QueryResult _result;

  Map<String, dynamic> get data => _result.data ?? {};

  String get error {
    if (!hasError) return MyString.noError;
    if (kDebugMode) return '${_result.exception}';
    return _result.exception?.linkException != null ? MyString.errorConnection : MyString.error;
  }

  bool get loading => _result.isLoading;

  bool get hasError => _result.hasException;

  bool get networkError => _result.hasException && network;

  bool get cacheError => _result.hasException && cache;

  bool get cache => _result.source == QueryResultSource.cache;

  bool get network => _result.source == QueryResultSource.network;

  String get source => cache
      ? MyString.sourceCache
      : network
          ? MyString.sourceNetwork
          : MyString.sourceUnknown;

  Result(this._result);
}
