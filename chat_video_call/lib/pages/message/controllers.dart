import 'package:chat_video_call/common/routes/routes.dart';
import 'package:chat_video_call/pages/message/state.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController();

  final state = MessageState();

  void goProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }
}
