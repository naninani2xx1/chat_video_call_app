import 'package:chat_video_call/common/values/colors.dart';
import 'package:chat_video_call/pages/message/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _buildHeaderTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 45.0.sp,
        fontFamily: "Montserrat",
        color: AppColors.primaryElementText,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeaderTitle("Message"),
          ],
        ),
      ),
    );
  }
}
