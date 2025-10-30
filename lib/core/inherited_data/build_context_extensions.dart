import 'package:flutter/widgets.dart';
import 'package:tic_tac_taupe/core/inherited_data/inherited_data.dart';

extension BuildContextExtensions on BuildContext {
  /// Gets the closest [InheritedData<T>] ancestor of this context and returns
  /// null if there are none.
  T? maybeReadInheritedData<T>() {
    final element = getElementForInheritedWidgetOfExactType<InheritedData<T>>();
    if (element == null) {
      return null;
    }

    final widget = element.widget;
    if (widget is InheritedData<T>) {
      return widget.data;
    }

    return null;
  }

  /// Gets the closest [InheritedData<T>] ancestor of this context and throws
  /// an exception if there are none.
  T readInheritedData<T>() => maybeReadInheritedData<T>()!;

  /// Depends on the closest [InheritedData<T>] ancestor of this context and
  /// returns null if there are none.
  T? maybeWatchInheritedData<T>() {
    final widget = dependOnInheritedWidgetOfExactType<InheritedData<T>>();
    return widget?.data;
  }

  /// Depends on the closest [InheritedData<T>] ancestor of this context and
  /// throws an exception if there are none.
  T watchInheritedData<T>() => maybeWatchInheritedData<T>()!;
}
