import 'package:flutter/material.dart';
import 'ar_model.dart';

class ArCameraPreview extends StatelessWidget {
  const ArCameraPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey.shade800,
            Colors.grey.shade900,
          ],
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 100,
              color: Colors.white54,
            ),
            SizedBox(height: 16),
            Text(
              'Camera Preview',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 18,
              ),
            ),
            Text(
              'Real camera integration needed',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArOverlayCanvas extends StatefulWidget {
  final AnimeImageModel animeImage;
  final Function(Offset) onDrawingUpdate;

  const ArOverlayCanvas({
    super.key,
    required this.animeImage,
    required this.onDrawingUpdate,
  });

  @override
  State<ArOverlayCanvas> createState() => _ArOverlayCanvasState();
}

class _ArOverlayCanvasState extends State<ArOverlayCanvas> {
  final List<Offset> _localPoints = [];

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _localPoints.add(details.localPosition);
          });
          widget.onDrawingUpdate(details.localPosition);
        },
        child: CustomPaint(
          painter: ArOverlayPainter(
            animeImage: widget.animeImage,
            drawingPoints: _localPoints,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class ArOverlayPainter extends CustomPainter {
  final AnimeImageModel animeImage;
  final List<Offset> drawingPoints;

  ArOverlayPainter({
    required this.animeImage,
    required this.drawingPoints,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw anime image overlay (placeholder)
    final imageRect = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.3),
      width: 200,
      height: 200,
    );

    final imagePaint = Paint()
      ..color = Colors.blue.withAlpha(03)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(imageRect, const Radius.circular(20)),
      imagePaint,
    );

    // Draw placeholder text
    final textPainter = TextPainter(
      text: TextSpan(
        text: animeImage.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        imageRect.center.dx - textPainter.width / 2,
        imageRect.center.dy - textPainter.height / 2,
      ),
    );

    // Draw user drawings
    if (drawingPoints.length > 1) {
      final drawPaint = Paint()
        ..color = Colors.red
        ..strokeWidth = 3.0
        ..strokeCap = StrokeCap.round;

      for (int i = 0; i < drawingPoints.length - 1; i++) {
        canvas.drawLine(drawingPoints[i], drawingPoints[i + 1], drawPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ArControlPanel extends StatelessWidget {
  final VoidCallback onImageSelect;
  final VoidCallback onCapture;
  final VoidCallback onClearDrawing;
  final bool isLoading;

  const ArControlPanel({
    super.key,
    required this.onImageSelect,
    required this.onCapture,
    required this.onClearDrawing,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(08),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ControlButton(
            icon: Icons.auto_awesome,
            label: 'Generate',
            onPressed: isLoading ? null : onImageSelect,
          ),
          _ControlButton(
            icon: Icons.camera,
            label: 'Capture',
            onPressed: isLoading ? null : onCapture,
          ),
          _ControlButton(
            icon: Icons.clear,
            label: 'Clear',
            onPressed: isLoading ? null : onClearDrawing,
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _ControlButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withAlpha(02),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
