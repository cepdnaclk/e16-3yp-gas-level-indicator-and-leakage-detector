class LoginResponseModel {
  final String token;
  final String error;
  final String accessToken;
  final String refreshToken;

  LoginResponseModel(
      {this.token, this.error, this.accessToken, this.refreshToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      error: json["error"] != null ? json["error"] : "",
      accessToken: json["accessToken"] != null ? json["accessToken"] : "",
      refreshToken: json["refreshToken"] != null ? json["refreshToken"] : "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
