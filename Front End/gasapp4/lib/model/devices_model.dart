class DevicesResponseModel {
  final String token;
  final String error;

  DevicesResponseModel({this.token, this.error});

  factory DevicesResponseModel.fromJson(Map<String, dynamic> json) {
    return DevicesResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class DevicesRequestModel {
  String email;

  DevicesRequestModel({
    this.email,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
    };

    return map;
  }
}
