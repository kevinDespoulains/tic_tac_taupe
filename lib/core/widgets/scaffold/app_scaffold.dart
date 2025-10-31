import 'package:flutter/material.dart';
import 'package:tic_tac_taupe/core/themes/assets/assets.dart';

/// The AppScaffold widget provides a scaffold a background image that should be used everywhere in the app.
/// The Scaffold's body becomes scrollable if the available height is less than minimum required height.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.body,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final localBody = body;

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const Positioned.fill(child: _Background()),
          if (localBody != null) Positioned.fill(child: localBody),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.background,
      fit: BoxFit.fitHeight,
      repeat: ImageRepeat.repeatX,
      alignment: Alignment.center,
    );
  }
}
