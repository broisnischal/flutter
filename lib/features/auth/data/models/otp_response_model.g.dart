// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPModel _$OTPModelFromJson(Map<String, dynamic> json) => OTPModel(
      hash: json['hash'] as String,
      otp: json['otp'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$OTPModelToJson(OTPModel instance) => <String, dynamic>{
      'hash': instance.hash,
      'otp': instance.otp,
      'phone': instance.phone,
    };
