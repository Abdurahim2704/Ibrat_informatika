import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibrat_informatika/core/routes/app_routes.dart';
import 'package:ibrat_informatika/data/models/models.dart';
import 'package:ibrat_informatika/presentation/pages/result_page/result_page.dart';

import 'components/showBottom.dart';

class TestPage extends StatefulWidget {
  final Lesson lesson;
  const TestPage({super.key, required this.lesson});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int questionIndex = 0;
  int? answer;
  List<bool> answers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.lesson.questions[questionIndex].question),
            if (widget.lesson.questions[questionIndex].image != null)
              Image.asset(widget.lesson.questions[questionIndex].image!),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              itemBuilder: (context, index) {
                final variant =
                    widget.lesson.questions[questionIndex].variants[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Radio(
                        value: index,
                        groupValue: answer,
                        onChanged: (value) {
                          setState(() {
                            answer = value;
                          });
                        },
                      ),
                      title: Text(
                        variant,
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.sp))),
                    ),
                  ),
                );
              },
              itemCount: widget.lesson.questions[questionIndex].variants.length,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                    minimumSize: Size(
                      300.sp,
                      50.sp,
                    )),
                onPressed: () {
                  if (answer == null) {
                    return;
                  }
                  answers.add(
                      widget.lesson.questions[questionIndex].answer == answer);
                  showBottom(
                          context,
                          widget.lesson.questions[questionIndex].answer ==
                              answer)
                      .whenComplete(() {
                    if (questionIndex + 1 == widget.lesson.questions.length) {
                      Navigator.popAndPushNamed(
                        context,
                        AppRoutes.resultPage,
                        arguments: {
                          "title": widget.lesson.title,
                          "images": widget.lesson.questions
                              .map((e) => e.image)
                              .toList(),
                          "questions": widget.lesson.questions
                              .map((e) => e.question)
                              .toList(),
                          "answers": widget.lesson.questions
                              .map((e) => e.variants[e.answer])
                              .toList(),
                          "user_answers": answers.toList(),
                        },
                      );
                      return;
                    }
                    setState(() {
                      questionIndex++;
                      answer = null;
                    });
                  });
                },
                child: Text("Tekshirish"),
              ),
            ),
            SizedBox(
              height: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
