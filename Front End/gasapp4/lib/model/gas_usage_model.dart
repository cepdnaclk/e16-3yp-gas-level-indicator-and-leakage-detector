class GasUsageResponseModel {
  final String token;
  final String error;

  GasUsageResponseModel({this.token, this.error});

  factory GasUsageResponseModel.fromJson(Map<String, dynamic> json) {
    return GasUsageResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class GasUsageRequestModel {
  String email;

  GasUsageRequestModel({
    this.email,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
    };

    return map;
  }
}
