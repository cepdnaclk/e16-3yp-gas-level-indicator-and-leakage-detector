class AddTankResponseModel {
  final String token;
  final String error;

  AddTankResponseModel({this.token, this.error});

  factory AddTankResponseModel.fromJson(Map<String, dynamic> json) {
    return AddTankResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class AddTankRequestModel {
  String deviceID;
  String brand;
  String size;

  AddTankRequestModel({this.deviceID, this.brand, this.size});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'device_id': deviceID.trim(),
      'brand': brand.trim(),
      'size': size.trim(),
    };

    return map;
  }
}
