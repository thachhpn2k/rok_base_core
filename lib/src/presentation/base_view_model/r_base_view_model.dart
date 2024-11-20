import 'package:flutter/foundation.dart';
import 'package:rok_base_core/src/core/rok/rok.dart';

abstract class RBaseViewModel extends ChangeNotifier {
  void initBase() {}

  void disposeBase() {}

  @protected
  Future<Rok> handleError(dynamic error);

  @protected
  Future<bool> rok(
    dynamic Function() handler, {
    bool shouldHandleError = true,
  }) async {
    var success = true;
    try {
      final result = handler();
      if (result is Future) {
        await result;
      }
    } catch (error) {
      success = false;
      if (shouldHandleError) {
        await handleError(error);
      }
    }
    return success;
  }
}
