import 'package:flutter/material.dart';
import 'package:ibrat_informatika/data/models/course.dart';
import 'package:ibrat_informatika/presentation/pages/chapters_page/components/chapter_tile.dart';

import '../lesson_page/lesson_page.dart';

class ChaptersPage extends StatefulWidget {
  final Course course;
  const ChaptersPage({super.key, required this.course});

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final chapter = widget.course.chapters[index];
              return ChapterTile(
                chapter: chapter,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LessonPage(chapter: chapter)));
                },
              );
            },
            itemCount: widget.course.chapters.length,
          )
        ],
      ),
    );
  }
}
