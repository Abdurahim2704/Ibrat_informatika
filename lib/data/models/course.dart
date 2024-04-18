import 'models.dart';

class Course {
  final String title;
  final String headerImage;
  final List<Chapter> chapters;

  const Course(
      {required this.title, required this.headerImage, required this.chapters});

  factory Course.fromJson(Map<String, Object?> json) {
    final title = json["title"] as String;
    final headerImage = json["header_image"] as String;
    final chapters = (json["chapters"] as List)
        .map((e) => Chapter.fromJson(e as Map<String, Object?>))
        .toList();

    return Course(title: title, headerImage: headerImage, chapters: chapters);
  }
}
