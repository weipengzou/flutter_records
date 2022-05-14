import 'dart:convert';

class UserScheme {
  String? password;
  dynamic account;
  String id;
  String avatar;
  String displayName;
  String email;
  String phone;
  String createTime;
  String updateTime;

  UserScheme({
    required this.password,
    required this.account,
    required this.id,
    required this.avatar,
    required this.displayName,
    required this.email,
    required this.phone,
    required this.createTime,
    required this.updateTime,
  });

  factory UserScheme.fromMap(Map<String, dynamic> data) => UserScheme(
        password: data['password'] as String?,
        account: data['account'] as dynamic,
        id: data['id'] as String,
        avatar: data['avatar'] as String,
        displayName: data['display_name'] as String,
        email: data['email'] as String,
        phone: data['phone'] as String,
        createTime: data['create_time'] as String,
        updateTime: data['update_time'] as String,
      );

  Map<String, dynamic> toMap() => {
        'password': password,
        'account': account,
        'id': id,
        'avatar': avatar,
        'display_name': displayName,
        'email': email,
        'phone': phone,
        'create_time': createTime,
        'update_time': updateTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory UserScheme.fromJson(String data) {
    return UserScheme.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
