import '../util/typedef.dart';

abstract class UseCase<T, P> {
  FutureResult<T> call(P params);
}
