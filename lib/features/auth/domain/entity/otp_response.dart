class OtpResponseEntity {
  OtpResponseEntity({
    required this.hash,
    required this.otp,
    required this.phone,
  });

  final String hash;
  final String otp;
  final String phone;
}
