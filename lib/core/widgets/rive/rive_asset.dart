import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class RiveAsset extends StatefulWidget {
  const RiveAsset({
    super.key,
    required this.controller,
    required this.filePath,
    required this.builder,
  });

  final RiveAssetController controller;
  final String filePath;
  final Widget Function(Widget child) builder;

  @override
  State<RiveAsset> createState() => _RiveAssetState();
}

class _RiveAssetState extends State<RiveAsset> {
  late final fileLoader = FileLoader.fromAsset(
    widget.filePath,
    riveFactory: Factory.rive,
  );

  @override
  void dispose() {
    fileLoader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: fileLoader,
      onLoaded: (state) {
        widget.controller._controller = state.controller;
      },
      builder: (context, state) => switch (state) {
        RiveLoading() => const SizedBox(),
        RiveFailed() => const SizedBox(),
        RiveLoaded() => widget.builder(
          RiveWidget(
            controller: state.controller,
            fit: Fit.cover,
          ),
        ),
      },
    );
  }
}

/// A proxy controller to interact with the Rive asset.
/// This class allows triggering state machine inputs from outside the Rive widget.
class RiveAssetController {
  RiveAssetController();

  RiveWidgetController? _controller;

  void trigger(String trigger) {
    _controller?.stateMachine.trigger(trigger)?.fire();
  }

  void dispose(){
    // No need to dispose the RiveWidgetController as it is managed by the RiveWidget.
    _controller = null;
  }
}
