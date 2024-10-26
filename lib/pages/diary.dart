import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DayDiaryPage extends StatefulWidget {
  const DayDiaryPage({Key? key}) : super(key: key);

  @override
  _DayDiaryPageState createState() => _DayDiaryPageState();
}

class _DayDiaryPageState extends State<DayDiaryPage> {
  DateTime _selectedDay = DateTime.now();
  bool _isCalendarExpanded = false; // For toggling calendar view

  final TextEditingController _morningMealController = TextEditingController();
  final TextEditingController _noonMealController = TextEditingController();
  final TextEditingController _eveningMealController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _beveragesController = TextEditingController();
  final TextEditingController _fatsOilsController = TextEditingController();
  final TextEditingController _condimentsController = TextEditingController();
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _relaxationController =
      TextEditingController(); // For relaxation
  final TextEditingController _bedTimeController =
      TextEditingController(); // For bedtime
  final TextEditingController _wakeTimeController =
      TextEditingController(); // For wake time
  final TextEditingController _timeDuringNightController =
      TextEditingController(); // For time(s) during the night
  final TextEditingController _reasonWhyController =
      TextEditingController(); // For reasons why awake during night
  final TextEditingController _alertTimeController =
      TextEditingController(); // For alert time after waking up
  final TextEditingController _bowelNumberController =
      TextEditingController(); // For bowel movement number
  final TextEditingController _bowelColorController =
      TextEditingController(); // For bowel movement color
  final TextEditingController _bowelShapeController =
      TextEditingController(); // For bowel movement size and shape

  Map<DateTime, Map<String, dynamic>> diaryData = {}; // Store results by date
  Map<String, bool> checkboxStates = {
    "Sound": false,
    "Restless": false,
    "Often": false,
    "Not at all": false,
    "Yes Sweats": false,
    "No Sweats": false,
    "Refreshed": false,
    "Tired": false,
    "Slow": false,
    "Energetic": false,
  };

  @override
  void initState() {
    super.initState();
    _loadDataForDay(_selectedDay); // Load today's data initially
  }

  // Load the data for a specific day
  void _loadDataForDay(DateTime day) {
    if (diaryData.containsKey(day)) {
      final data = diaryData[day]!;
      _waterController.text = data["water"] ?? '';
      _exerciseController.text = data["exercise"] ?? '';

      for (var key in checkboxStates.keys) {
        checkboxStates[key] = data[key] ?? false;
      }
    } else {
      // If no data for the day, reset the inputs
      _waterController.clear();
      _exerciseController.clear();
      checkboxStates.updateAll((key, value) => false);
    }
    setState(() {});
  }

  // Save the current state for the selected day
  void _saveDataForDay(DateTime day) {
    diaryData[day] = {
      "water": _waterController.text,
      "exercise": _exerciseController.text,
      ...checkboxStates,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Data saved for ${day.toString().substring(0, 10)}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diet, Exercise and Sleep Diary"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggleable Calendar
            ExpansionTile(
              title: const Text('Select Date'),
              initiallyExpanded: false,
              onExpansionChanged: (bool expanded) {
                setState(() => _isCalendarExpanded = expanded);
              },
              children: [
                TableCalendar(
                  focusedDay: _selectedDay,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _loadDataForDay(
                          selectedDay); // Load the data when day is selected
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Meals Section
            buildMealSection("Morning Meal"),
            buildMealSection("Noon Meal"),
            buildMealSection("Evening Meal"),
            // Additional Questions
            const Text(
              "Additional",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            buildTextField("Water (os/cups)", _waterController),
            buildTextField("Additional Beverages", _beveragesController),
            buildTextField("Fats/ Oils", _fatsOilsController),
            buildTextField("Condiments (sugar/ salt/ spices, etc.)",
                _condimentsController),
            buildTextField(
              "Exercise (type/ duration/ pulse before/ pulse after)",
              _exerciseController,
              maxLines: 3,
            ),
            buildTextField(
                "Relaxation (type/ duration)", _relaxationController),
            const SizedBox(height: 20),

            // Sleep Questions
            const Text(
              "Sleep Quality",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            buildTextField(
                "What time did you go to bed last night?", _bedTimeController),
            buildTextField(
                "What time did you get up this morning?", _wakeTimeController),
            buildCheckboxRow(
                "How was your sleep quality?", ["Sound", "Restless"]),
            buildCheckboxRow(
                "Did you awake during the night?", ["Often", "Not at all"]),
            buildTextField("Time(s):", _timeDuringNightController),
            buildTextField("Reason(s) why?", _reasonWhyController),
            buildCheckboxRow("Did you have night sweats?", ["Yes", "No"]),
            buildCheckboxRow(
                "Did you wake up refreshed or tired?", ["Refreshed", "Tired"]),
            buildCheckboxRow(
                "Did you start slow this morning?", ["Slow", "Energetic"]),
            buildTextField("If Yes, how long did it take you to feel alert?",
                _alertTimeController),
            const SizedBox(height: 20),

            // Bowel Movement Questions
            const Text(
              "Bowel Movement",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            buildTextField("Number:", _bowelNumberController),
            buildTextField("Color:", _bowelColorController),
            buildTextField("Size & Shape:", _bowelShapeController),

            // Save button
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveDataForDay(_selectedDay),
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable function to build meal section
  Widget buildMealSection(String mealTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mealTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: "Time",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: "Food Ingredients",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: "Feeling / Symptoms",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: "Snack in Between",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Reusable function to build text fields with adjustable size and paragraph support
  Widget buildTextField(String label, TextEditingController controller,
      {int minLines = 1, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        minLines: minLines, // Minimum number of lines
        maxLines: maxLines, // Maximum number of lines (use null for infinite)
      ),
    );
  }

  // Reusable function to build checkbox questions
  Widget buildCheckboxRow(String question, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: options.map((option) {
              return Expanded(
                child: Row(
                  children: [
                    // Make sure that checkboxStates[option] is not null
                    Checkbox(
                      value: checkboxStates[option] ?? false,
                      onChanged: (val) {
                        setState(() {
                          checkboxStates[option] = val!;
                        });
                      },
                    ),
                    Text(option),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
