import 'package:chat_video_call/common/routes/routes.dart';
import 'package:chat_video_call/common/store/user.dart';
import 'package:chat_video_call/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();

  Future<void> onLoggout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
    asyncPostAllData();
  }

  void asyncPostAllData() async {
    await Get.offAllNamed(AppRoutes.SignIn);
  }
}
