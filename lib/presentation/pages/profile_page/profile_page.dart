import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibrat_informatika/bloc/local_saving/test_result_bloc.dart';
import 'package:ibrat_informatika/core/constants/icons.dart';
import 'package:ibrat_informatika/data/services/auth_service.dart';
import 'package:ibrat_informatika/presentation/pages/overview_page/overview_page.dart';

import 'components/components.dart';
import 'components/information_maker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: AppIcons.defaultAvatarImage,
          onClicked: () {},
        ),
        const SizedBox(height: 24),
        buildName(AuthServiceImpl.auth.currentUser),
        const SizedBox(height: 24),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildName(User? user) => Column(
        children: [
          if (user?.displayName != null)
            Text(
              user!.displayName!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          const SizedBox(height: 40),
          if (user?.email != null)
            InformationSection(value: user!.email!, attribute: "Email: "),
          SizedBox(
            height: 10.sp,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          SizedBox(
            height: 440.sp,
            child: BlocBuilder<TestResultBloc, TestResultState>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    final result = state.results[index];
                    return Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OverViewPage(result: result),
                              ));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.sp))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.sp, vertical: 10.sp),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.sp),
                                    child: Text(
                                      result.title,
                                      style: TextStyle(fontSize: 19),
                                    )),
                                SizedBox(
                                  height: 6.sp,
                                ),
                                InformationSection(
                                    attribute: "O'zlashtirish ko'rsatkichi:",
                                    value:
                                        "${(result.accuracy * 100).toInt()}%"),
                                Wrap(
                                  children: [
                                    for (var item in result.userAnswers)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 30.sp,
                                          width: 30.sp,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: item == 0
                                                  ? Colors.red
                                                  : Colors.green),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.results.length,
                );
              },
            ),
          )
        ],
      );
}
