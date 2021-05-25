class GetPercentageResponseModel {
  final String token;
  final String error;

  GetPercentageResponseModel({this.token, this.error});

  factory GetPercentageResponseModel.fromJson(Map<String, dynamic> json) {
    return GetPercentageResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class GetPercentageRequestModel {
  String deviceID;

  GetPercentageRequestModel({
    this.deviceID,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'device_id': deviceID.trim(),
    };

    return map;
  }
}
