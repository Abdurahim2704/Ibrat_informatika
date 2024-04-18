import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ibrat_informatika/bloc/home/home_bloc.dart';
import 'package:ibrat_informatika/bloc/local_saving/test_result_bloc.dart';
import 'package:ibrat_informatika/presentation/pages/chapters_page/chapters_page.dart';
import 'package:ibrat_informatika/presentation/pages/home_page/components/custom_listile.dart';
import 'package:ibrat_informatika/presentation/pages/profile_page/profile_page.dart';

import '../../../core/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Xush Kelibsiz",
          style: TextStyle(fontSize: 19.sp),
        ),
      ),
      body: Stack(
        children: [
          index == 0
              ? ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                  itemBuilder: (context, index) {
                    final course =
                        context.read<HomeBloc>().state.courses[index];
                    return CustomListile(
                        title: course.title,
                        subtitle:
                            "${course.chapters.length} ta bob ${course.chapters.fold<int>(0, (previousValue, element) => previousValue + element.lessons.length)} ta dars",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ChaptersPage(course: course),
                          ));
                        },
                        trailingImage: course.headerImage);
                  },
                  itemCount: context.read<HomeBloc>().state.courses.length,
                )
              : const ProfilePage(),
          if (context.watch<TestResultBloc>().state is TestResultLoading)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const CircularProgressIndicator.adaptive(),
            )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.sp),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          backgroundColor: Colors.white,
          tabMargin: EdgeInsets.symmetric(vertical: 10.sp),
          tabActiveBorder:
              Border.all(color: Colors.black, width: 1), // tab button border
          tabBorder: Border.all(
              color: Colors.grey,
              width: 1), // tab button border/ tab button shadow
          gap: 8, // the tab button gap between icon and text
          color: Colors.black, // unselected icon color
          activeColor: Colors.black, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              AppColors.appBarColor, // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
          onTabChange: (value) {
            setState(() {
              index = value;
            });
          },
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
        ),
      ),
    );
  }
}
