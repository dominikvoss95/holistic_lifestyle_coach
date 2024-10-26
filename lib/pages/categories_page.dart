import 'package:flutter/material.dart';
import 'question_page.dart'; // If this is the file for your questions
import 'total_score.dart'; // If this is the file for total score chart

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // Define the category scores here
  final Map<String, int> _categoryScores = {
    'You Are What You Eat': 0,
    'Stress': 0,
    'Sleep Wake Cycles': 0,
    'Digestion': 0,
    'Fungus & Parasites': 0,
  };

  final List<String> categories = const [
    'You Are What You Eat',
    'Stress',
    'Sleep Wake Cycles',
    'Digestion',
    'Fungus & Parasites',
    'Total Score Chart'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire Categories'),
      ),
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Setze deinen Bildpfad hier
              fit:
                  BoxFit.cover, // Macht das Bild groß genug für die ganze Seite
            ),
          ),
          // Transparente Schicht, um Text besser lesbar zu machen
          // Positioned.fill(
          //   child: Container(
          //     color: Color(0xff4b524c)
          //         .withOpacity(0.5), // Schwarze halbtransparente Schicht
          //   ),
          // ),
          // Die ListView mit Kategorien
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      categories[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff464545), // Textfarbe auf weiß ändern
                      ),
                    ),
                    onTap: () {
                      if (categories[index] == 'Total Score Chart') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TotalScoreChartPage(
                              categoryScores: _categoryScores,
                            ),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => QuestionPage(
                              category: categories[
                                  index], // Pass the selected category
                              categoryScores: _categoryScores,
                            ),
                          ),
                        );
                      }
                    },
                    trailing:
                        const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
