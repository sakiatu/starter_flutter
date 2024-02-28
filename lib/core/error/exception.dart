import '../const/string.dart';

class NetworkException implements Exception {
  final String message = MyString.errorNetwork;
}

class SomethingWentWrongException implements Exception {
  final String message = MyString.errorSomethingWentWrong;
}