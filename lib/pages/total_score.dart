import 'package:flutter/material.dart';

class TotalScoreChartPage extends StatelessWidget {
  final Map<String, int>
      categoryScores; // Pass category scores from QuestionPage

  const TotalScoreChartPage({Key? key, required this.categoryScores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalScore =
        categoryScores.values.fold(0, (sum, score) => sum + score);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Score Chart'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Total Score Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildScoreTable(),
            const SizedBox(height: 20),
            Text(
              'Total Score: $totalScore',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreTable() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(children: _buildTableHeaderRow()),
              ...categoryScores.entries
                  .map((entry) => _buildTableRow(entry.key, entry.value))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTableHeaderRow() {
    return [
      _buildTableCell('Category'),
      _buildTableCell('Score'),
    ];
  }

  TableRow _buildTableRow(String category, int score) {
    return TableRow(
      decoration: BoxDecoration(
        color: _getPriorityColor(score),
      ),
      children: [
        _buildTableCell(category),
        _buildTableCell(score.toString()),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Color _getPriorityColor(int score) {
    if (score >= 100) {
      return Colors.redAccent; // High priority
    } else if (score >= 50) {
      return Colors.yellowAccent; // Moderate priority
    } else {
      return Colors.greenAccent; // Low priority
    }
  }
}
