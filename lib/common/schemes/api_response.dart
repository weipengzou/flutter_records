import 'dart:convert';

class ApiResponse<T> {
  T? data;
  int? code;
  String? message;

  ApiResponse({this.data, this.code, this.message});

  factory ApiResponse.fromMap(Map<String, dynamic> data) => ApiResponse(
        data: data['data'] as T?,
        code: data['code'] as int?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'data': data,
        'code': code,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApiResponse].
  factory ApiResponse.fromJson(String data) {
    return ApiResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApiResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
