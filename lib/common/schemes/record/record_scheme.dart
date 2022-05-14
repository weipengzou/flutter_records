import 'dart:convert';

import 'package:records/common/schemes/user/user_scheme.dart';

class RecordScheme {
  int? id;
  String? title;
  String? content;
  int? like;
  String? createTime;
  String? updateTime;
  UserScheme? user;

  RecordScheme({
    this.id,
    this.title,
    this.content,
    this.like,
    this.createTime,
    this.updateTime,
    this.user,
  });

  factory RecordScheme.fromMap(Map<String, dynamic> data) => RecordScheme(
        id: data['id'] as int?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        like: data['like'] as int?,
        createTime: data['create_time'] as String?,
        updateTime: data['update_time'] as String?,
        user: data['user'] == null
            ? null
            : UserScheme.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'like': like,
        'create_time': createTime,
        'update_time': updateTime,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RecordScheme].
  factory RecordScheme.fromJson(String data) {
    return RecordScheme.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
