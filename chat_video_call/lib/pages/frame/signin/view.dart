import 'package:chat_video_call/common/values/assets.dart';
import 'package:chat_video_call/common/values/colors.dart';
import 'package:chat_video_call/pages/frame/signin/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/values/widgets.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        'Chatty .',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontFamily: "Montserrat",
          fontSize: 34.0.sp,
        ),
      ),
    );
  }

  Widget _buildLogin(String type, [String? path]) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 290.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(radiusWidget / 2),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                offset: const Offset(0.0, 1.0),
                blurRadius: 2.0,
                color: Colors.grey.withOpacity(0.1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              path == null
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(
                        top: (paddingWidget / 2).h,
                        bottom: (paddingWidget / 2).h,
                        left: (paddingWidget * 2.5).w,
                        right: (paddingWidget).w,
                      ),
                      child: Image.asset(
                        path,
                        width: 50,
                        height: 30,
                      ),
                    ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  alignment:
                      path == null ? Alignment.center : Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Sign in with $type",
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Padding _buildOrLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingWidget * 3.h),
      child: SizedBox(
        width: 290.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Divider(
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            const Text(
              '     or     ',
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            Expanded(
              child: Divider(
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildLogin("Google", Assets.googleIcon),
            const SizedBox(height: 20.0),
            _buildLogin("Facebook", Assets.facebookIcon),
            const SizedBox(height: 20.0),
            _buildLogin("Apple", Assets.appleIcon),
            _buildOrLogin(),
            _buildLogin("phone number"),
            SizedBox(height: 35.h),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Sign up here?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
