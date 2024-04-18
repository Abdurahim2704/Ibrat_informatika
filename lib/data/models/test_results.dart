import 'dart:convert';

class TestResults {
  int? id;
  final String title;
  final List<String> questions;
  final List<String> answers;
  final List<int> userAnswers;
  final DateTime dateTime;
  final double accuracy;

  TestResults({
    required this.title,
    required this.dateTime,
    required this.questions,
    required this.accuracy,
    required this.userAnswers,
    required this.answers,
    this.id,
  });

  factory TestResults.fromJson(Map<String, Object?> json) {
    final id = json["id"] as int;
    final title = json["title"] as String;
    final questions =
        (json["questions"] as List).map((e) => e as String).toList();
    final userAnswers = json["userAnswers"] as List<int>;
    final answers = json["answers"] as List<String>;
    final dateTime = DateTime.parse(json["dateTime"] as String);
    final accuracy = json["accuracy"] as double;

    return TestResults(
        id: id,
        dateTime: dateTime,
        questions: questions,
        accuracy: accuracy,
        answers: answers,
        title: title,
        userAnswers: userAnswers);
  }

  String toJson() {
    return jsonEncode({
      "id": id,
      'questions': questions,
      "userAnswers": userAnswers,
      "dateTime": dateTime.toIso8601String(),
      "answers": answers,
      "accuracy": accuracy,
      "title": title
    });
  }

  factory TestResults.fromSql(Map<String, Object?> json) {
    final questions = (json["questions"] as String).split(";").toList();
    final id = json["id"] as int;
    final title = json["title"] as String;
    final userAnswers = (json["userAnswers"] as String)
        .split(";")
        .map((e) => int.parse(e))
        .toList();
    final answers = (json["answers"] as String).split(";");
    final dateTime = DateTime.parse(json["dateTime"] as String);
    final accuracy = json["accuracy"] as double;

    return TestResults(
        id: id,
        dateTime: dateTime,
        questions: questions,
        accuracy: accuracy,
        answers: answers,
        title: title,
        userAnswers: userAnswers);
  }

  Map<String, Object?> toSql() {
    return {
      "id": id,
      "title": title,
      "questions": questions.join(";"),
      "userAnswers": userAnswers.join(";"),
      "dateTime": dateTime.toIso8601String(),
      "accuracy": accuracy,
      "answers": answers.join(";")
    };
  }
}
