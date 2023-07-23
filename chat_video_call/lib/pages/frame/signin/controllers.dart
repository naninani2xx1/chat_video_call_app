import 'dart:developer';

import 'package:chat_video_call/common/api/user.dart';
import 'package:chat_video_call/common/entities/user.dart';
import 'package:chat_video_call/common/routes/routes.dart';
import 'package:chat_video_call/common/store/user.dart';
import 'package:chat_video_call/pages/frame/signin/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['openid'],
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> handleSignIn(String loginType) async {
    //1:Google, 2: Facebook, 3: Apple, 4: phones
    try {
      switch (loginType) {
        case "Google":
          if (kDebugMode) {
            print("...you are logging with $loginType");
          }
          _handleGoogleSignIn();
          break;
        case "Facebook":
          if (kDebugMode) {
            print("...you are logging with $loginType");
          }
          break;
        case "Apple":
          if (kDebugMode) {
            print("...you are logging with $loginType");
          }
          break;
        default:
          if (kDebugMode) {
            print("...you are logging with $loginType");
          }
          break;
      }
    } catch (e) {
      log('...error with login $e');
    }
  }

  Future<void> _handleGoogleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount == null) return;
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    // Tạo một chứng thực đăng nhập Firebase với mã thông báo truy cập Google.
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // Đăng nhập vào Firebase với chứng thực được cung cấp.
    final UserCredential data = await _auth.signInWithCredential(credential);

    LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();

    loginPanelListRequestEntity.avatar = data.user!.photoURL ?? "";
    loginPanelListRequestEntity.email = data.user!.email;
    loginPanelListRequestEntity.name = data.user!.displayName ?? "";
    loginPanelListRequestEntity.openId = data.user!.uid;
    loginPanelListRequestEntity.type = 2;

    _asyncPostAllData(loginPanelListRequestEntity);
  }

  _asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(param: loginRequestEntity);
    if (kDebugMode) {
      print("API: $result");
    }
    if (result.code == 0) {
      UserStore.to.setIsLogin = true;

      await UserStore.to.saveProfile(result.data!);
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      //toastInfo(msg: 'Internet error');
    }
    Get.offAllNamed(AppRoutes.Message);
  }
}
