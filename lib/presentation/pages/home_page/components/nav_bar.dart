import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/constants/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      haptic: true, // haptic feedback
      tabBorderRadius: 15,
      backgroundColor: Colors.white,
      tabMargin: EdgeInsets.symmetric(vertical: 10.sp),
      tabActiveBorder:
          Border.all(color: Colors.black, width: 1), // tab button border
      tabBorder: Border.all(
          color: Colors.grey, width: 1), // tab button border/ tab button shadow
      gap: 8, // the tab button gap between icon and text
      color: Colors.black, // unselected icon color
      activeColor: Colors.black, // selected icon and text color
      iconSize: 24, // tab button icon size
      tabBackgroundColor:
          AppColors.appBarColor, // selected tab background color
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
      onTabChange: (value) {},
      tabs: [
        const GButton(
          backgroundColor: AppColors.appBarColor,
          icon: Icons.home,
          text: "Home",
        ),
        GButton(
          backgroundColor: Colors.blue.withOpacity(0.6),
          icon: Icons.person,
          text: "Profile",
        ),
      ],
    );
  }
}
