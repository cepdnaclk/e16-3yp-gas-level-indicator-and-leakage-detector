class SignupResponseModel {
  final String statusCode;

  SignupResponseModel({this.statusCode});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      statusCode: json["statusCode"] != null ? json["statusCode"] : "200",
    );
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
