import 'package:flutter/material.dart';

class FadingBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color? color;
  final double? height;
  final double? width;
  const FadingBorderContainer(
      {super.key,
      required this.child,
      this.borderRadius = 20,
      this.color,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: FadingBorderPainter(borderRadius: borderRadius),
          child: Container(
            height: height,
            width: width ?? double.infinity, // Full width
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: color ?? const Color(0xFF201C45).withOpacity(0.1),
            ),
            child: child, // Child content with dynamic height
          ),
        );
      },
    );
  }
}

class FadingBorderPainter extends CustomPainter {
  final double borderRadius;

  FadingBorderPainter({this.borderRadius = 20});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 1.5;

    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final Paint borderPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1C273C).withOpacity(0.1),
          const Color(0xFF1C273C).withOpacity(0.5),
          Colors.tealAccent.withOpacity(0.3),
          Colors.tealAccent.withOpacity(0.3),
        ],
        stops: const [0.0, 0.0, 0.4, 1.0], // Fade effect at the top
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Draw the rounded rectangle border
    canvas.drawRRect(roundedRect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
