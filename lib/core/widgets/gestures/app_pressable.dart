import 'package:flutter/widgets.dart';
import 'package:tic_tac_taupe/core/inherited_data/build_context_extensions.dart';
import 'package:tic_tac_taupe/core/inherited_data/inherited_data.dart';

/// A Widget that detects press and hover interactions and exposes the
/// interaction states to its descendants via an [InheritedData].
class AppPressable extends StatefulWidget {
  const AppPressable({
    super.key,
    this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  State<AppPressable> createState() => _AppPressableState();
}

class _AppPressableState extends State<AppPressable> {
  Set<AppInteractionState> _states = {};

  void _addState(AppInteractionState state) {
    if (mounted) {
      setState(() {
        _states = {..._states, state};
      });
    }
  }

  void _removeState(AppInteractionState state) {
    if (mounted) {
      setState(() {
        _states = _states.where((s) => s != state).toSet();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onPressed != null;

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      onEnter: (_) {
        if (enabled) {
          _addState(AppInteractionState.hovered);
        }
      },
      onExit: (_) {
        _removeState(AppInteractionState.hovered);
      },
      child: Listener(
        onPointerDown: (details) {
          if (enabled) {
            _addState(AppInteractionState.pressed);
          }
        },
        onPointerUp: (details) {
          _removeState(AppInteractionState.pressed);

          if (enabled) {
            widget.onPressed?.call();
          }
        },
        child: InheritedData(
          data: AppInteractionStates(states: _states),
          child: widget.child,
        ),
      ),
    );
  }
}

class AppInteractionStatesBuilder extends StatelessWidget {
  const AppInteractionStatesBuilder({
    super.key,
    required this.builder,
    this.child,
  });

  final ValueWidgetBuilder<Set<AppInteractionState>> builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final states = context.maybeWatchInheritedData<AppInteractionStates>();

    return builder(
      context,
      states?.states ?? {},
      child,
    );
  }
}

enum AppInteractionState { hovered, pressed }

@immutable
class AppInteractionStates {
  const AppInteractionStates({
    required this.states,
  });

  final Set<AppInteractionState> states;
}
