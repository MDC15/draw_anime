import 'package:flutter/material.dart';
import 'home_model.dart';

class AnimeCanvas extends StatefulWidget {
  final List<DrawingPoint> drawings;
  final DrawingTool currentTool;
  final Color currentColor;
  final Function(DrawingPoint) onDrawingUpdate;

  const AnimeCanvas({
    super.key,
    required this.drawings,
    required this.currentTool,
    required this.currentColor,
    required this.onDrawingUpdate,
  });

  @override
  State<AnimeCanvas> createState() => _AnimeCanvasState();
}

class _AnimeCanvasState extends State<AnimeCanvas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: GestureDetector(
        onPanUpdate: (details) {
          final point = DrawingPoint(
            point: details.localPosition,
            color: widget.currentTool == DrawingTool.eraser
                ? Colors.white
                : widget.currentColor,
            tool: widget.currentTool,
            strokeWidth: widget.currentTool == DrawingTool.eraser ? 10.0 : 3.0,
          );
          widget.onDrawingUpdate(point);
        },
        child: CustomPaint(
          painter: DrawingPainter(widget.drawings),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawings;

  DrawingPainter(this.drawings);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawings.length - 1; i++) {
      final current = drawings[i];
      final next = drawings[i + 1];

      final paint = Paint()
        ..color = current.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = current.strokeWidth;

      canvas.drawLine(current.point, next.point, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
