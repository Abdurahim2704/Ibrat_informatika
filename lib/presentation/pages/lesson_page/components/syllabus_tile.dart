import 'package:flutter/material.dart';

import '../../../../data/models/lesson.dart';

class SyllabusTile extends StatelessWidget {
  final Lesson lesson;
  final void Function() onTap;
  final Widget leading;
  const SyllabusTile(
      {super.key,
      required this.lesson,
      required this.onTap,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: leading,
      ),
      title: Text(lesson.title),
    );
  }
}
