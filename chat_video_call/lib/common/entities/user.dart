// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserItem {
  String? name;

  String? description;

  String? avatar;

  int? online;

  int? type;

  String? accessToken;

  String? token;

  UserItem({
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
    this.accessToken,
    this.token,
  });

  UserItem copyWith({
    String? name,
    String? description,
    String? avatar,
    int? online,
    int? type,
    String? accessToken,
    String? token,
  }) {
    return UserItem(
      name: name ?? this.name,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      online: online ?? this.online,
      type: type ?? this.type,
      accessToken: accessToken ?? this.accessToken,
      token: token ?? this.token,
    );
  }

  factory UserItem.fromJson(Map json) => UserItem(
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        avatar: json['avatar'] ?? '',
        online: json['online'] ?? '',
        type: json['type'] ?? '',
        accessToken: json['access_token'] ?? '',
        token: json['token'] ?? '',
      );
}

///user Login  Response Entity
class UserLoginResponseEntity {
  int? code;

  String? msg;

  UserItem? data;

  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson(Map json) => UserLoginResponseEntity(
        code: json['code'] ?? '',
        msg: json['msg'] ?? '',
        data: UserItem.fromJson(json['data']),
      );
}
