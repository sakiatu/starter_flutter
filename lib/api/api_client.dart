import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../helper/local_db.dart';
import './model_result.dart';

class ApiClient extends GetxService {
  final String _baseUrl;
  final LocalDb _localDb;
  final FirebaseAuth _auth;

  ApiClient(this._baseUrl, this._localDb, this._auth);

  //Query
  Future<Result> query(
      {required String query, Map<String, dynamic> variables = const {}, bool fromCache = false}) async {
    if (_tokenExpired) await _updateToken();
    return Result(await _client.query(QueryOptions(
        document: gql(query),
        variables: variables,
        fetchPolicy: fromCache ? FetchPolicy.cacheOnly : FetchPolicy.networkOnly)));
  }

  Future<void> queryCacheNetwork(
      {required String query,
      Map<String, dynamic> variables = const {},
      required void Function(Result res) snap}) async {
    snap(await this.query(query: query, variables: variables, fromCache: true));
    snap(await this.query(query: query, variables: variables));
  }

  //Mutation
  Future<Result> mutation({required String query, Map<String, dynamic> variables = const {}}) async {
    if (_tokenExpired) await _updateToken();
    return Result(await _client.mutate(MutationOptions(document: gql(query), variables: variables)));
  }

  //Subscription
  StreamSubscription subscription(
      {required String query, Map<String, dynamic> variables = const {}, required void Function(Result) snap}) {
    if (_tokenExpired) _updateToken();
    return _wsClient
        .subscribe(
            SubscriptionOptions(document: gql(query), variables: variables, fetchPolicy: FetchPolicy.cacheAndNetwork))
        .listen((result) => snap(Result(result)));
  }

  //Helpers
  GraphQLClient get _client =>
      GraphQLClient(cache: GraphQLCache(store: HiveStore()), link: HttpLink(_baseUrl, defaultHeaders: _headers));

  GraphQLClient get _wsClient => GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: WebSocketLink(_baseUrl.replaceFirst('http', 'ws'),
          config: SocketClientConfig(
              initialPayload: () => {'headers': _headers},
              autoReconnect: true,
              inactivityTimeout: const Duration(seconds: 30))));

  Map<String, String> get _headers => {
        'content-type': 'application/json; charset=UTF-8',
        if (_authToken == null) 'x-hasura-role': 'guest',
        if (_authToken != null) ...{'x-hasura-role': 'teacher', 'Authorization': 'Bearer $_authToken'}
      };

  String? get _authToken => _localDb.token;

  String get userId => '${_localDb.userId}';

  Future<void> _updateToken() async {
    await _localDb.saveToken(await _auth.currentUser?.getIdToken(true));
  }

  bool get _tokenExpired => _authToken != null && JwtDecoder.isExpired(_authToken!);
}
