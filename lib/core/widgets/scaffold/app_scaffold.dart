import 'package:flutter/material.dart';
import 'package:tic_tac_taupe/core/theme/assets/assets.dart';

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
      body: _ScrollableBody(
        minHeight: 600,
        body: Stack(
          children: [
            const Positioned.fill(child: _Background()),
            if (localBody != null) Positioned.fill(child: localBody),
          ],
        ),
      ),
    );
  }
}

class _ScrollableBody extends StatelessWidget {
  const _ScrollableBody({
    required this.minHeight,
    required this.body,
  });

  final double minHeight;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight > minHeight) {
          return body;
        }

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: minHeight,
            child: body,
          ),
        );
      },
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
