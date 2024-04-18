import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibrat_informatika/data/models/models.dart';

import '../result_page/components/test_result_maker.dart';

class OverViewPage extends StatelessWidget {
  final TestResults result;
  const OverViewPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Test Natijalari",
          style: TextStyle(fontSize: 30.sp),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.sp,
          ),
          TestResultMaker(
              value:
                  "${result.userAnswers.where((element) => element == 1).length}/${result.answers.length}",
              attribute: "To'g'ri javoblar soni : "),
          SizedBox(
            height: 5.sp,
          ),
          TestResultMaker(
              attribute: "Darsni o'zlashtirish darajasi: ",
              value:
                  "${((result.userAnswers.where((element) => element == 1).length / result.answers.length) * 100)}%"),
          SizedBox(
            height: 20.sp,
          ),
          Text(
            "Noto'g'ri javob berilgan savollar",
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 17.sp,
          ),
          SizedBox(
            height: 500.sp,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 17.sp,
                );
              },
              itemBuilder: (context, index) {
                if (result.userAnswers[index] == 1) {
                  return const SizedBox.shrink();
                }
                final question = result.questions[index];
                final answer = result.answers[index];
                return Card(
                  elevation: 5,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(question),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        Expanded(
                          child: Text(
                            answer,
                            softWrap: true,
                            style: const TextStyle(color: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: result.userAnswers.length,
            ),
          ),
        ],
      ),
    );
  }
}
