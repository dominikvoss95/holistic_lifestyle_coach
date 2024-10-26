import 'package:flutter/material.dart';

class FourDoctorPlanPage extends StatelessWidget {
  const FourDoctorPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4 Doctor Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '4 Doctor Plan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildDoctorPlanItem(
              context,
              icon: Icons.self_improvement,
              label: 'DR. QUIET',
              progressValue: 0.7,
              backgroundColor: Colors.blue[100]!,
              progressColor: Colors.blue[700]!,
            ),
            _buildDoctorPlanItem(
              context,
              icon: Icons.directions_run,
              label: 'DR. MOVEMENT',
              progressValue: 0.6,
              backgroundColor: Colors.red[100]!,
              progressColor: Colors.red[700]!,
            ),
            _buildDoctorPlanItem(
              context,
              icon: Icons.local_dining,
              label: 'DR. DIET',
              progressValue: 0.5,
              backgroundColor: Colors.green[100]!,
              progressColor: Colors.green[700]!,
            ),
            _buildDoctorPlanItem(
              context,
              icon: Icons.sentiment_satisfied,
              label: 'DR. HAPPINESS',
              progressValue: 0.8,
              backgroundColor: Colors.yellow[100]!,
              progressColor: Colors.yellow[700]!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorPlanItem(BuildContext context,
      {required IconData icon,
      required String label,
      required double progressValue,
      required Color backgroundColor,
      required Color progressColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: progressColor),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: progressColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progressValue,
                    color: progressColor,
                    backgroundColor: Colors.grey[300],
                    minHeight: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
