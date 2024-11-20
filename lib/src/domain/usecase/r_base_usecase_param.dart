import 'dart:async';

abstract class RBaseUsecaseParam<P, R> {
  final StreamController<R> _resultController = StreamController.broadcast();

  Stream<R> get result => _resultController.stream;

  void execute(P params) {
    _resultController.addStream(invoke(params));
  }

  Stream<R> invoke(P params);
}
