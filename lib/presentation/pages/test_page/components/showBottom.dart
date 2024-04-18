import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showBottom(BuildContext context, bool isRight) {
  return showModalBottomSheet(
    enableDrag: false,
    context: context,
    backgroundColor: isRight ? Colors.green : Colors.red,
    isDismissible: false,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    !isRight
                        ? Icons.thumb_down_alt_sharp
                        : Icons.thumb_up_alt_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    !isRight ? "Noto'g'ri javob" : "To'g'ri javob",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 40.sp)),
                child: Text(
                  "Keyingi",
                  style: TextStyle(color: isRight ? Colors.green : Colors.red),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
            ],
          ),
        ),
      );
    },
  );
}
