// import 'dart:convert';

class APIResponse<T> {
  APIResponse({
    this.success,
    this.message,
    this.data,
  });

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return APIResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: fromJsonT(json['data']),
    );
  }
  final bool? success;
  final String? message;
  final T? data;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'success': success,
      'message': message,
      'data': toJsonT(data as T),
    };
  }

  // @override
  // String toString() {
  //   return jsonEncode(toJson((data) => data));
  // }
}
