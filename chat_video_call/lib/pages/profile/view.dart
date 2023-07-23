import 'package:chat_video_call/common/values/assets.dart';
import 'package:chat_video_call/common/values/colors.dart';
import 'package:chat_video_call/pages/profile/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text('Profile'),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(Assets.headerUserImg),
              fit: BoxFit.cover,
            ),
            color: AppColor.primarySecondaryBackground,
            border: Border.all(color: AppColor.primaryBackground, width: 5.0),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8.0,
                offset: const Offset(0, 1),
              )
            ],
          ),
        ),
        Positioned(
          right: 2.w,
          bottom: 10.w,
          child: Container(
            width: 30.w,
            height: 30.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryElement,
            ),
            child: const Icon(
              Icons.edit,
              color: AppColor.primaryElementText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBtn(
      {required VoidCallback onTap,
      required String title,
      required Color bgColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8.0,
              offset: const Offset(0, 1),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0.sp,
            color: AppColor.primaryElementText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      backgroundColor: AppColor.primaryBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfilePhoto(),
                  _buildBtn(
                    title: "Complete",
                    bgColor: AppColor.primaryElement,
                    onTap: () {},
                  ),
                  _buildBtn(
                    title: "Loggout",
                    bgColor: AppColor.primarySecondaryElementText,
                    onTap: () {
                      Get.defaultDialog(
                        radius: 8.0,
                        content: const SizedBox(),
                        backgroundColor: Colors.white,
                        title: "Are you sure to log out?",
                        titleStyle: TextStyle(
                          fontSize: 16.0.sp,
                        ),
                        onConfirm: () => controller.onLoggout(),
                        textCancel: "Cancel",
                        confirmTextColor: AppColor.primaryElement,
                        cancelTextColor: AppColor.primaryText,
                        textConfirm: "Confirm",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
