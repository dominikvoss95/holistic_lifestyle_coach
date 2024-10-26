class Question {
  final String question;
  final List<Map<String, dynamic>> options;
  int? selected;

  Question({required this.question, required this.options, this.selected});
}
