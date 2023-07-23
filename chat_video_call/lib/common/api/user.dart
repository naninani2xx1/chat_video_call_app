import 'package:chat_video_call/common/entities/user.dart';
import 'package:chat_video_call/common/utils/http.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login(
      {LoginRequestEntity? param}) async {
    var response = await HttpUtil().post(
      "/login",
      queryParameters: param!.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
