class LoginResponseModel {
  final String accessToken;
  final String refreshToken;

  //constructor for LoginResponseModel
  LoginResponseModel({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      //return json of token as token, if json of token is not null - if not return ""
      accessToken: json["accessToken"] != null ? json["accessToken"] : "",
      refreshToken: json["refreshToken"] != null ? json["refreshToken"] : "",
    );
  }

  //create a json from the map
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'accessToken': accessToken.trim(),
      'refreshToken': refreshToken.trim(),
    };

    return map;
  }
}

class LoginRequestModel {
  String email;
  String password;

  //constructor for LoginRequestModel
  LoginRequestModel({
    this.email,
    this.password,
  });

  //create a json from the map
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
