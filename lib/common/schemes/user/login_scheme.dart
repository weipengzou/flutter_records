import 'dart:convert';

import 'package:records/common/schemes/user/user_scheme.dart';

class LoginScheme {
  UserScheme? user;
  String? accessToken;

  LoginScheme({this.user, this.accessToken});

  factory LoginScheme.fromMap(Map<String, dynamic> data) => LoginScheme(
        user: data['user'] == null
            ? null
            : UserScheme.fromMap(data['user'] as Map<String, dynamic>),
        accessToken: data['access_token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'access_token': accessToken,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginScheme].
  factory LoginScheme.fromJson(String data) {
    return LoginScheme.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginScheme] to a JSON string.
  String toJson() => json.encode(toMap());
}
