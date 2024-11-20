import 'package:result_monad/result_monad.dart';

extension StreamMapping<T> on Stream<Result<T, Error>> {
  Stream<S> mapSuccess<S>(S Function(T event) convert) {
    return skipWhile((element) => element.isFailure).map((event) => convert(event.value));
  }
}

