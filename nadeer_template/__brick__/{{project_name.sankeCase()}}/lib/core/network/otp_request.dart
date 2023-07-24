class OtpRequest {
  final String otp;
  final String email;

  OtpRequest({
    required this.otp,
    required this.email,
  });
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

    map['otp'] = otp;
    map['email'] = email;

    return map;
  }
}
