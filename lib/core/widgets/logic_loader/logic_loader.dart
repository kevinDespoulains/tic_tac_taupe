import 'package:flutter/widgets.dart';

/// Helper widget used to load logic asynchronously when the widget is initialized.
/// It avoids creating a separate stateful widget for this common pattern.
class LogicLoader extends StatefulWidget {
  const LogicLoader({
    super.key,
    required this.onLoad,
    required this.child,
  });

  final Future<void> Function(BuildContext context) onLoad;
  final Widget child;

  @override
  State<LogicLoader> createState() => _LogicLoaderState();
}

class _LogicLoaderState extends State<LogicLoader> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.onLoad(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
