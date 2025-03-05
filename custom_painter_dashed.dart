import 'package:flutter/material.dart';

class DashedBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: DashedLinePainter(),
          child: Container(
            width: 200,
            height: 100,
            color: Colors.transparent,  // The color of the container
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black  // Color of the dashed line
      ..strokeWidth = 2.0;

    double dashWidth = 10.0; // Dash width
    double dashSpace = 5.0; // Space between dashes

    double startX = 0;
    double y = size.height; // Bottom border y-coordinate

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, y),
        Offset(startX + dashWidth, y),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() => runApp(MaterialApp(home: DashedBorder()));
