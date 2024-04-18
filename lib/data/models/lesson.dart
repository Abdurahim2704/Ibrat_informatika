import 'models.dart';

class Lesson {
  final String title;
  final String videoUrl;
  final List<Question> questions;
  final String text;

  const Lesson({
    required this.title,
    required this.questions,
    required this.videoUrl,
    required this.text,
  });

  factory Lesson.fromJson(Map<String, Object?> json) {
    final title = json["title"] as String;
    final videoUrl = json["video_url"] as String;
    final text = json["text"] as String;
    final questions = (json["questions"] as List)
        .map((e) => Question.fromJson(e as Map<String, Object?>))
        .toList();

    return Lesson(
        title: title, questions: questions, text: text, videoUrl: videoUrl);
  }
}
