import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibrat_informatika/core/constants/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/models/lesson.dart';

class UnitPage extends StatefulWidget {
  final Lesson lesson;
  const UnitPage({super.key, required this.lesson});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          widget.lesson.videoUrl,
        )!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 40.sp),
          child: Column(
            children: [
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                bottomActions: [
                  ProgressBar(
                    isExpanded: true,
                    colors: ProgressBarColors(
                      playedColor: AppColors.cF79E1B,
                      handleColor: AppColors.cF79E1B.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(widget.lesson.text)
            ],
          ),
        ),
      ),
    );
  }
}
