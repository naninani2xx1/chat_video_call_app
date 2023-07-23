// ignore_for_file: constant_identifier_names

import 'package:chat_video_call/common/middlewares/router_auth.dart';
import 'package:chat_video_call/common/routes/routes.dart';
import '../../pages/profile/index.dart';
import '../../pages/frame/welcome/index.dart';
import '../../pages/message/index.dart';
import '../../pages/frame/signin/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static const String INITIAL = AppRoutes.Initial;

  static final RouteObserver<Route> observer = RouteObserver();

  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.Initial,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: AppRoutes.SignIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    //page message
    GetPage(
      name: AppRoutes.Message,
      page: () => const MessagePage(),
      binding: MessageBinding(),
      middlewares: [RouteAuthMiddleware(priority: 1)],
    ),

    //page message
    GetPage(
      name: AppRoutes.Profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      //middlewares: [RouteAuthMiddleware(priority: 1)],
    ),
  ];
}
