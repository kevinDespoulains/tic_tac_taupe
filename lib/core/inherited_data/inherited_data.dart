import 'package:flutter/widgets.dart';

/// An inherited widget that holds data of type [T] and notifies dependents
/// when the data changes.
class InheritedData<T> extends InheritedWidget {
  const InheritedData({
    super.key,
    required this.data,
    required super.child,
  });

  final T data;

  @override
  bool updateShouldNotify(InheritedData<Object?> oldWidget) {
    return data != oldWidget.data;
  }
}
