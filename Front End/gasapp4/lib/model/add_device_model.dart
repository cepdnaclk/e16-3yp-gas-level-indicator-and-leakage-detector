class AddDeviceResponseModel {
  final String statusCode;
  final String error;

  AddDeviceResponseModel({this.statusCode, this.error});

  factory AddDeviceResponseModel.fromJson(Map<String, dynamic> json) {
    return AddDeviceResponseModel(
        error: json["error"] != null ? json["error"] : "", statusCode: 'OK');
  }
}

class AddDeviceRequestModel {
  String deviceID;
  String deviceName;

  AddDeviceRequestModel({
    this.deviceID,
    this.deviceName,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'device_id': deviceID.trim(),
      'device_name': deviceName.trim(),
    };

    return map;
  }
}
