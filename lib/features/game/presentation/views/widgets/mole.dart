import 'package:flutter/widgets.dart';
import 'package:tic_tac_taupe/core/themes/assets/assets.dart';
import 'package:tic_tac_taupe/core/widgets/rive/rive_asset.dart';

class Mole extends StatelessWidget {
  const Mole({
    super.key,
    this.isVisible,
    this.isKnockedOut,
    this.isProtected,
    this.onTap,
  });

  final bool? isVisible;
  final bool? isKnockedOut;
  final bool? isProtected;
  final VoidCallback? onTap;

  bool get _canKnockOut {
    return (isVisible ?? true) &&
        !(isKnockedOut ?? false) &&
        !(isProtected ?? false) &&
        onTap != null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _canKnockOut ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onPanDown: _canKnockOut ? (_) => onTap?.call() : null,
        child: _AnimatedMole(
          isVisible: isVisible ?? false,
          isKnockedOut: isKnockedOut ?? false,
          isProtected: isProtected ?? false,
        ),
      ),
    );
  }
}

class _AnimatedMole extends StatefulWidget {
  const _AnimatedMole({
    required this.isVisible,
    required this.isKnockedOut,
    required this.isProtected,
  });

  final bool isVisible;
  final bool isKnockedOut;
  final bool isProtected;

  @override
  State<_AnimatedMole> createState() => _AnimatedMoleState();
}

class _AnimatedMoleState extends State<_AnimatedMole> {
  late final RiveAssetController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RiveAssetController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(covariant _AnimatedMole oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isKnockedOut && !oldWidget.isKnockedOut) {
      _controller.trigger('Knock');
    }

    if (widget.isProtected && !oldWidget.isProtected) {
      _putHelmetOn();
    }

    if (widget.isVisible != oldWidget.isVisible) {
      if (!widget.isVisible) {
        _controller.trigger('Hide');
      } else {
        _controller.trigger('Show');
      }
    }
  }

  Future<void> _putHelmetOn() async {
    _controller.trigger('Hide');
    await Future.delayed(const Duration(milliseconds: 500));
    _controller.trigger('Put Helmet');
    _controller.trigger('Show');
  }

  @override
  Widget build(BuildContext context) {
    return RiveAsset(
      filePath: Assets.mole,
      controller: _controller,
      onLoaded: (controller) {
        if (widget.isVisible) {
          _controller.trigger('Show');
        }
      },
      builder: (child) => child,
    );
  }
}
