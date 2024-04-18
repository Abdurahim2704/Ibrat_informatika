import 'package:flutter/material.dart';
import 'package:ibrat_informatika/core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const CustomTextField(
      {Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          cursorColor: Colors.black,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
                color: Colors.grey.shade500, fontWeight: FontWeight.w600),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
