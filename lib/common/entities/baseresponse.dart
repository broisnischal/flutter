import 'package:freezed_annotation/freezed_annotation.dart';

part 'baseresponse.g.dart';
part 'baseresponse.freezed.dart';

@freezed
class BaseResponse with _$BaseResponse {
  const factory BaseResponse({
    bool? success,
    String? message,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
