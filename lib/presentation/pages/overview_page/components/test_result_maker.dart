import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestResultMaker extends StatelessWidget {
  final String attribute;
  final String value;
  const TestResultMaker(
      {super.key, required this.value, required this.attribute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            attribute,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
