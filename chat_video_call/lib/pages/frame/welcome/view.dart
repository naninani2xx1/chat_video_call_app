import 'package:chat_video_call/common/values/colors.dart';
import 'package:chat_video_call/pages/frame/welcome/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildHeaderTitle(String title) {
    return Hero(
      tag: 'Chatty .',
      child: Text(
        title,
        style: TextStyle(
          fontSize: 45.0.sp,
          fontFamily: "Montserrat",
          color: AppColor.primaryElementText,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryElement,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeaderTitle(controller.title),
          ],
        ),
      ),
    );
  }
}
