import 'package:flutter/material.dart';
import 'package:ibrat_informatika/core/constants/icons.dart';
import 'package:ibrat_informatika/presentation/pages/test_page/test_page.dart';
import 'package:ibrat_informatika/presentation/pages/unit_page/unit_page.dart';

import '../../../data/models/models.dart';
import 'components/syllabus_tile.dart';

class LessonPage extends StatefulWidget {
  final Chapter chapter;
  const LessonPage({super.key, required this.chapter});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapter.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final lesson = widget.chapter.lessons[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SyllabusTile(
                lesson: lesson,
                leading: Image.asset(AppIcons.unitIcon),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UnitPage(
                          lesson: lesson,
                        ),
                      ));
                },
              ),
              SyllabusTile(
                lesson: lesson,
                leading: Image.asset(AppIcons.testIcon),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestPage(lesson: lesson),
                      ));
                },
              ),
            ],
          );
        },
        itemCount: widget.chapter.lessons.length,
      ),
    );
  }
}
