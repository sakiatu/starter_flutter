import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starter/const/string.dart';

class Result {
  final Map<String, dynamic> data;
  final bool hasError;
  final bool cache;
  final bool network;
  final bool cacheError;
  final bool networkError;
  final String? error;

  Result(QueryResult result)
      : data = result.data ?? {},
        hasError = result.hasException,
        cache = result.source == QueryResultSource.cache,
        network = result.source == QueryResultSource.network,
        cacheError = result.hasException && result.source == QueryResultSource.cache,
        networkError = result.hasException && result.source == QueryResultSource.network,
        error = !result.hasException
            ? null
            : kDebugMode
                ? result.exception.toString()
                : result.exception?.linkException is NetworkException
                    ? MyString.errorNetwork
                    : MyString.error;

  @override
  String toString() =>
      '''Result(
          data: $data, 
          hasError: $hasError, 
          cache: $cache, 
          network: $network, 
          cacheError: $cacheError, 
          networkError: $networkError, 
          error: $error
        )''';
}
