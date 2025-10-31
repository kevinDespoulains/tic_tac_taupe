import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_taupe/core/widgets/text/app_text.dart';

/// A speech bubble dialog that displays text with a typewriter effect.
class MoleDialog extends StatefulWidget {
  const MoleDialog({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<MoleDialog> createState() => _MoleDialogState();
}

class _MoleDialogState extends State<MoleDialog> {
  String _displayedText = '';
  Timer? _timer;
  int _currentCharIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void didUpdateWidget(covariant MoleDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _resetAndStartTyping();
    }
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_currentCharIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentCharIndex];
          _currentCharIndex++;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _resetAndStartTyping() {
    _timer?.cancel();
    setState(() {
      _displayedText = '';
      _currentCharIndex = 0;
    });
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _BubblePainter(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 8),
        child: AppText(
          _displayedText,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  const _BubblePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF000000)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const pointerHeight = 10.0;
    const pointerWidth = 20.0;
    const cornerRadius = 12.0;

    final path = Path();

    final innerRect = Rect.fromLTWH(
      0,
      pointerHeight,
      size.width,
      size.height - pointerHeight,
    );

    // Draw rounded rectangle body
    path.addRRect(
      RRect.fromRectAndRadius(innerRect, const Radius.circular(cornerRadius)),
    );

    // Draw pointer
    final pointerX = innerRect.right - cornerRadius - pointerWidth / 2;

    final pointerPath = Path()
      ..moveTo(pointerX - pointerWidth / 2, innerRect.top)
      ..lineTo(pointerX, innerRect.top - pointerHeight)
      ..lineTo(pointerX + pointerWidth / 2, innerRect.top)
      ..close();

    path.addPath(pointerPath, Offset.zero);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
