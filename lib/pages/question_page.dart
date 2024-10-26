import 'package:flutter/material.dart';
import 'summary_page.dart';

class QuestionPage extends StatefulWidget {
  final String category;
  final Map<String, int> categoryScores;

  const QuestionPage(
      {super.key, required this.category, required this.categoryScores});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  // Questions for each category
  final Map<String, List<Map<String, dynamic>>> questionsData = {
    'You Are What You Eat': [
      {
        'question':
            'Do you shop for food less frequently than every four days?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (1)', 'score': 1},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you eat more packaged (frozen or canned) fruits and vegetables than fresh?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you eat more cooked vegetables than raw?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you eat vegetables with fewer than two meals daily?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you buy more non-organic vegetables than organic?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'How often do you use a microwave oven?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (2)', 'score': 2},
          {'text': '3-4 times per week (5)', 'score': 5},
          {'text': '4+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question':
            'Do you eat white bread more often than whole grain breads?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you eat quick-cook grains more often than slow-cooked organic whole grains?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'How often do you consume pasteurized, homogenized milk or cheeses?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (1)', 'score': 1},
          {'text': '3 times per week (3)', 'score': 3},
          {'text': '3+ times per week (5)', 'score': 5}
        ],
        'selected': null
      },
      {
        'question': 'How often do you eat non-organic yogurts?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (1)', 'score': 1},
          {'text': '3 times per week (3)', 'score': 3},
          {'text': '3+ times per week (5)', 'score': 5}
        ],
        'selected': null
      },
      {
        'question':
            'Do you eat typical store-bought eggs from cage-raised chickens?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you eat non-organic red meat more than once every four days?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you commonly eat meats from non-free-range and hormone-free sources?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
    ],
    'Stress': [
      {
        'question':
            'Do you eat more or less when stressed than when not stressed?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'More (10)', 'score': 10},
          {'text': 'Same or less (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you worry over job, income, or money problems?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Are any of your relationships causing you stress?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you often feel anxious?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you often get upset when things go wrong?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you lash out at others?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you feel your sex drive is lower than normal for you?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you feel isolated or lonely?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you feel stressed due to lack of intimacy in relationships?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Have you had reduced contact with friends because of stress?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you take any medication prescribed due to stress or psychological disorders?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (15)', 'score': 15},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you commonly lose more than two days of work a year due to illness?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
    ],
    'Sleep Wake Cycles': [
      {
        'question': 'Do you live in the same time zone you were born in?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (0)', 'score': 0},
          {'text': 'No (5)', 'score': 5}
        ],
        'selected': null
      },
      {
        'question': 'Do you travel across time zones more than once a month?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'How often do you wake up feeling un-rested and in need of more sleep?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': 'Once a week (1)', 'score': 1},
          {'text': '3 times per week (5)', 'score': 5},
          {'text': '3+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question': 'Do you commonly go to bed after 10:30 p.m.?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Are the times you have bowel movements consistent on a daily basis?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (0)', 'score': 0},
          {'text': 'No (5)', 'score': 5}
        ],
        'selected': null
      },
      {
        'question':
            'Do you suffer from reduced memory since traveling across time zones?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Has your sense of hunger changed since moving to a new time zone?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'How often do you wake up at night between 1:00 a.m. and 4:00 a.m. and have trouble falling back asleep?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': 'Once a week (1)', 'score': 1},
          {'text': '3 times per week (5)', 'score': 5},
          {'text': '3+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question': 'How often do you tend to feel sleepy after lunch?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': 'Once a week (1)', 'score': 1},
          {'text': '3 times per week (5)', 'score': 5},
          {'text': '3+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question':
            'Do you do shift work that requires you to stay up late at night?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
    ],
    'Digestion': [
      {
        'question': 'How often do you experience lower abdominal bloating?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (3)', 'score': 3},
          {'text': '3 times per week (5)', 'score': 5},
          {'text': '3+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question': 'Do you frequently have loose stools or diarrhea?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'No (0)', 'score': 0},
          {'text': 'Once a week (1)', 'score': 1},
          {'text': '3+ times per week (5)', 'score': 5}
        ],
        'selected': null
      },
      {
        'question': 'How often do you experience constipation or hard stools?',
        'type': 'multiple_choice',
        'options': [
          {'text': '1-2 times per week (3)', 'score': 3},
          {'text': '3+ times per week (5)', 'score': 5}
        ],
        'selected': null
      },
      {
        'question': 'Do you often burp after meals?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you frequently have gas?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (3)', 'score': 3},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you crave certain foods like bread, chocolate, or red meat if you haven’t eaten them in a day or two?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'How often do you have poor appetite or feel worse after eating?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (3)', 'score': 3},
          {'text': '3+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question': 'Do you have an excessive appetite or sweet cravings?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you frequently experience abdominal discomfort?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'How often do you have indigestion, heartburn, or an upset stomach?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (3)', 'score': 3},
          {'text': '3+ times per week (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question': 'How often do you get headaches after eating?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Never (0)', 'score': 0},
          {'text': '1-2 times per week (3)', 'score': 3},
          {'text': '3+ times per week (5)', 'score': 5}
        ],
        'selected': null
      },
    ],
    'Fungus & Parasites': [
      {
        'question': 'Have you ever been given general anesthesia?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Have you ever taken antibiotics?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Are you being treated for any condition requiring medical drugs?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Are your bowel movements loose, hard, or foul-smelling?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Would you consider your life stressful?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Stress free (0)', 'score': 0},
          {'text': 'Mildly stressful (5)', 'score': 5},
          {'text': 'Very stressful (10)', 'score': 10}
        ],
        'selected': null
      },
      {
        'question':
            'Do you suffer from digestive disorders or pain near the navel?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you have mercury fillings in your mouth?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you have metal fillings like gold or silver in your mouth?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Do you experience itching in the ears, nose, or rectum?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question': 'Have you had dandruff in the past year?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you regularly consume products containing sugar, white flour, or processed dairy products?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you crave sugar, fruit, or milk if you don’t have them for more than three days?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (10)', 'score': 10},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
      {
        'question':
            'Do you find that regardless of how much you eat you get hungry quickly?',
        'type': 'multiple_choice',
        'options': [
          {'text': 'Yes (5)', 'score': 5},
          {'text': 'No (0)', 'score': 0}
        ],
        'selected': null
      },
    ],
  };

  int _currentQuestionIndex = 0;
  int _totalScoreForCurrentCategory = 0;
  final Map<String, int> _categoryScores = {};

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questionsData[widget.category]!.length - 1) {
        _currentQuestionIndex++;
      } else {
        _calculateScore();
        _showSummary();
      }
    });
  }

  void _calculateScore() {
    int score = questionsData[widget.category]!.fold(0, (int sum, question) {
      return sum +
          (question['selected'] as int? ?? 0); // Ensure the sum is an int
    });

    widget.categoryScores[widget.category] = score;
  }

  void _showSummary() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            SummaryPage(categoryScores: widget.categoryScores),
      ),
    );
  }

  Widget _buildQuestion() {
    final currentQuestion =
        questionsData[widget.category]![_currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentQuestion['question'],
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        ...currentQuestion['options'].map<Widget>((option) {
          return RadioListTile<int>(
            title: Text(option['text']),
            value: option['score'] as int,
            groupValue: currentQuestion['selected'],
            onChanged: (int? value) {
              setState(() {
                currentQuestion['selected'] = value ?? 0;
              });
            },
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildQuestion(),
            const Spacer(),
            ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xff566e5e), // Eucalyptus green background
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(_currentQuestionIndex ==
                      questionsData[widget.category]!.length - 1
                  ? 'Submit'
                  : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
