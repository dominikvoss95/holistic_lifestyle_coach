import 'package:flutter/material.dart';
import '../widgets/score_chart.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, int> categoryScores;

  const SummaryPage({super.key, required this.categoryScores});

  int _calculateTotalScore() {
    return categoryScores.values.fold(0, (sum, score) => sum + score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Summary'),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(400, 400),
          painter: ScoreChartPainter(categoryScores, _calculateTotalScore()),
        ),
      ),
    );
  }
}
