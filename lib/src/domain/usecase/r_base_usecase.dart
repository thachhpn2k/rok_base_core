import 'dart:async';

abstract class RBaseUsecase<R> {
  final StreamController<R> _resultController = StreamController.broadcast();

  Stream<R> get result => _resultController.stream;

  void execute() {
    _resultController.addStream(invoke());
  }

  Stream<R> invoke();
}
