import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationSection extends StatelessWidget {
  final String attribute;
  final String value;
  const InformationSection(
      {super.key, required this.value, required this.attribute});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            attribute,
            textAlign: TextAlign.start,
          ),
          Text(value!)
        ],
      ),
    );
  }
}

enum KeyBoardType { phoneNumber, word }
