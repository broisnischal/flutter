import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/token_response.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenResponseModel extends TokenResponse {
  TokenResponseModel({required super.accessToken, required super.refreshToken});

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}
