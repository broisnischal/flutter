import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';

part 'otp_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OTPModel extends OTPEntity {
  OTPModel({
    required super.hash,
    required super.otp,
    required super.phone,
  });

  factory OTPModel.fromJson(Map<String, dynamic> json) =>
      _$OTPModelFromJson(json);

  Map<String, dynamic> toJson() => _$OTPModelToJson(this);
}
