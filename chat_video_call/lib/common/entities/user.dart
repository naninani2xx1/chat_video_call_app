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
        online: json['online'] ?? 0,
        type: json['type'] ?? '',
        accessToken: json['access_token'] ?? '',
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "access_token": accessToken,
        "description": description,
        "token": token,
        "online": online,
        "type": type,
      };

  @override
  String toString() {
    super.toString();
    return "User item: $name, $description, $avatar, $online, $type, $accessToken, $token";
  }
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
  @override
  String toString() {
    super.toString();
    return "UserLoginResponseEntity: $code, $msg, $data";
  }
}

class LoginRequestEntity {
  String? email;

  String? openId;

  int? type;

  String? avatar;

  String? name;

  LoginRequestEntity({
    this.email,
    this.openId,
    this.type,
    this.avatar,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'open_id': openId,
      'type': type,
      'avatar': avatar,
      'name': name,
    };
  }

  factory LoginRequestEntity.fromJson(Map<String, dynamic> map) {
    return LoginRequestEntity(
      email: map['email'] != null ? map['email'] as String : null,
      openId: map['open_id'] != null ? map['open_id'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}
