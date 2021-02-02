class SignupResponseModel {
  final String statusCode;
  final String error;

  SignupResponseModel({this.statusCode, this.error});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
        error: json["error"] != null ? json["error"] : "", statusCode: 'OK');
  }
}

class SignupRequestModel {
  String email;
  String password;
  String phoneNumber;

  SignupRequestModel({
    this.email,
    this.password,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
      'mobile_number': phoneNumber.trim(),
    };

    return map;
  }
}
