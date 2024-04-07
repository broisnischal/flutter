import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';

part 'otp_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OTPResponseModel extends OtpResponseEntity {
  OTPResponseModel({
    required super.hash,
    required super.otp,
    required super.phone,
  });

  factory OTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OTPResponseModelToJson(this);
}
