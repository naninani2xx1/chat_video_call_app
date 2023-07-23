import 'package:chat_video_call/common/values/colors.dart';
import 'package:chat_video_call/pages/message/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common/values/assets.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () => controller.goProfile(),
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.headerUserImg),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      color: AppColor.primarySecondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          color: AppColor.primarySecondaryBackground,
                          offset: Offset(0, 1),
                          blurRadius: 15.0,
                        ),
                      ],
                    ),
                    child: controller.state.headerUsers.value.avatar == null
                        ? const SizedBox()
                        : const Text('Đen vâu'),
                  ),
                ),
                Positioned(
                  bottom: 5.w,
                  right: 0,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.w,
                        color: AppColor.primaryElementText,
                      ),
                      color: AppColor.primaryElementStatus,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _headBar(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
