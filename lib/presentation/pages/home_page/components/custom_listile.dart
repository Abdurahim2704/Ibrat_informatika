import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListile extends StatelessWidget {
  final String title;
  final String trailingImage;
  final String subtitle;
  final void Function() onTap;
  const CustomListile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black.withOpacity(0.2), width: 0.4),
          borderRadius: BorderRadius.all(Radius.circular(20.sp))),
      onTap: onTap,
      tileColor: Colors.white,
      selectedTileColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      trailing: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            trailingImage,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      subtitle: Text(subtitle),
    );
  }
}
