import 'package:flutter/material.dart';

class TabIndicator extends Decoration {
  final Color backgroundColor;
  final int height;

  const TabIndicator({required this.backgroundColor, required this.height});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    assert(onChanged != null);
    return _TabIndicatorPainter(this, onChanged);
  }
}

class _TabIndicatorPainter extends BoxPainter {
  final TabIndicator decoration;

  _TabIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = Offset(
          offset.dx,
          (configuration.size!.height / 2) - decoration.height / 2,
        ) &
        Size(configuration.size!.width, decoration.height.toDouble());
    final Paint paint = Paint();
    paint.color = decoration.backgroundColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(26)),
      paint,
    );
  }
}
