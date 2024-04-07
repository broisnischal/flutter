// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPResponseModel _$OTPResponseModelFromJson(Map<String, dynamic> json) =>
    OTPResponseModel(
      hash: json['hash'] as String,
      otp: json['otp'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$OTPResponseModelToJson(OTPResponseModel instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'otp': instance.otp,
      'phone': instance.phone,
    };
