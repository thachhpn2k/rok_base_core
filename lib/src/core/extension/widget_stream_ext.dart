import 'package:flutter/material.dart';

extension WidgetStream<T> on Stream<T> {
  StreamBuilder<T> toWidget({required T initialData, required Widget Function(T event) widgetBuilder}) {
    return StreamBuilder(
      initialData: initialData,
      stream: this,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) => widgetBuilder(snapshot.data as T),
    );
  }
}
