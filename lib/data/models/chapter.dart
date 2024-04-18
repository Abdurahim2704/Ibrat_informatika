import 'models.dart';

class Chapter {
  final String title;
  final List<Lesson> lessons;

  const Chapter({
    required this.title,
    required this.lessons,
  });

  factory Chapter.fromJson(Map<String, Object?> json) {
    final title = json["title"] as String;
    final lessons = (json["lessons"] as List)
        .map((e) => Lesson.fromJson(e as Map<String, Object?>))
        .toList();
    return Chapter(title: title, lessons: lessons);
  }
}
