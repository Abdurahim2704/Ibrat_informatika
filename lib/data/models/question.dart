import 'dart:convert';

class Question {
  final String question;
  final List<String> variants;
  final String? image;
  final int answer;

  const Question({
    required this.answer,
    required this.question,
    this.image,
    required this.variants,
  });

  factory Question.fromJson(Map<String, Object?> json) {
    final question = json["question"] as String;
    final variants =
        (json["variants"] as List).map((e) => e as String).toList();
    final image = json["image"] as String?;
    final answer = json["answer"] as int;

    return Question(
        answer: answer, question: question, variants: variants, image: image);
  }

  factory Question.fromSql(Map<String, Object?> json) {
    final question = json["question"] as String;
    final variants = (json["variants"] as String).split(";").toList();
    final image = json["image"] as String?;
    final answer = json["answer"] as int;

    return Question(
        answer: answer, question: question, variants: variants, image: image);
  }

  String toSql() {
    return jsonEncode({
      "answer": answer,
      "question": question,
      "variants": variants.join(";"),
      "image": image,
    });
  }

  String toJson() {
    return jsonEncode({
      "question": question,
      "variants": variants,
      "image": image,
      "answer": answer,
    });
  }
}
