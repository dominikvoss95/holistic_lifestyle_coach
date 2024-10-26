import 'package:flutter/material.dart';

class ScoreChartPainter extends CustomPainter {
  final Map<String, int> scores;
  final int totalScore;

  ScoreChartPainter(this.scores, this.totalScore);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    const double boxHeight = 50;
    const double boxWidth = 80;

    final textStyle = TextStyle(color: Colors.black, fontSize: 14);
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    double y = 50;
    double x = 50;

    for (String category in scores.keys) {
      paint.color = const Color(0xFFD5E8D4); // Light green for category boxes
      canvas.drawRect(Rect.fromLTWH(x, y, boxWidth, boxHeight), paint);

      textPainter.text = TextSpan(
        text: scores[category].toString(),
        style: textStyle,
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(canvas, Offset(x + 10, y + 10));

      y += boxHeight;
    }

    // Draw the total score circle in eucalyptus green
    paint.color = const Color(0xFF50C878);
    canvas.drawCircle(Offset(x + 100, y + 30), 40, paint);

    textPainter.text = TextSpan(
      text: totalScore.toString(),
      style: textStyle.copyWith(color: Colors.white, fontSize: 20),
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(canvas, Offset(x + 70, y + 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
