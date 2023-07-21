import 'package:chat_video_call/common/routes/routes.dart';
import 'package:chat_video_call/common/store/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.SignIn ||
        route == AppRoutes.Initial) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login"));
      return const RouteSettings(name: AppRoutes.SignIn);
    }
  }
}
