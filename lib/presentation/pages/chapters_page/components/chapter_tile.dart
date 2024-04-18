import 'package:flutter/material.dart';
import 'package:ibrat_informatika/data/models/chapter.dart';

class ChapterTile extends StatelessWidget {
  final Chapter chapter;
  final void Function() onTap;
  const ChapterTile({super.key, required this.chapter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        chapter.title,
      ),
      onTap: onTap,
      subtitle: Text("${chapter.lessons.length} ta dars"),
    );
  }
}
