import 'dart:async';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'api_helper.dart';
import 'model_result.dart';

class ApiClient extends GetxService {
  final String _baseUrl;
  final ApiHelper _apiHelper;
  final _authorizedRole = 'user';
  final _unauthorizedRole = 'guest';
  final _cache = GraphQLCache(store: HiveStore());

  String? get userId => _apiHelper.userId;

  ApiClient(this._baseUrl, this._apiHelper);

  ///Query
  Future<Result> query(
      {required String query, Map<String, dynamic> variables = const {}, bool fromCache = false}) async {
    await _apiHelper.refreshToken();
    return Result(await _client(_http).query(QueryOptions(
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

  ///Mutation
  Future<Result> mutation({required String query, Map<String, dynamic> variables = const {}}) async {
    await _apiHelper.refreshToken();
    return Result(await _client(_http).mutate(MutationOptions(document: gql(query), variables: variables)));
  }

  ///Subscription
  StreamSubscription subscription(
      {required String query, Map<String, dynamic> variables = const {}, required void Function(Result) snap}) {
    _apiHelper.refreshToken();
    return _client(_webSocket)
        .subscribe(
            SubscriptionOptions(document: gql(query), variables: variables, fetchPolicy: FetchPolicy.cacheAndNetwork))
        .listen((result) => snap(Result(result)));
  }

  ///Client
  GraphQLClient _client(Link link) => GraphQLClient(cache: _cache, link: link);

  //Links
  Link get _http => HttpLink(_baseUrl, defaultHeaders: _headers);

  Link get _webSocket => WebSocketLink(_baseUrl.replaceFirst('http', 'ws'),
      config: SocketClientConfig(initialPayload: () => {'headers': _headers}));

  ///Headers
  Map<String, String> get _headers => {
        'content-type': 'application/json; charset=UTF-8',
        'x-hasura-role': _apiHelper.authorizedUser ? _authorizedRole : _unauthorizedRole,
        if (_apiHelper.hasToken) 'Authorization': 'Bearer ${_apiHelper.token}'
      };
}
