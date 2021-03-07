import 'package:gasapp4/model/add_device_model.dart';
import 'package:gasapp4/model/add_tank_model.dart';
import 'package:gasapp4/model/devices_model.dart';
import 'package:gasapp4/model/gas_usage_model.dart';
import 'package:gasapp4/model/percentage_model.dart';
import 'package:gasapp4/model/signup_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://54.166.66.196:9001/login";

    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(url, body: requestModel.toJson());

    print("login response code is below");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> loginTokens = jsonDecode(response.body);
      prefs.setString('token', loginTokens["accessToken"]);
      prefs.setString('refresh_token', loginTokens["refreshToken"]);
      prefs.setString('email', requestModel.email);
    }

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    String url = "http://54.166.66.196:9000/signup";

    final response = await http.post(url, body: requestModel.toJson());

    print("sign up status code is below");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      /*
      return SignupResponseModel.fromJson(
        json.decode(response.body),
      );
      */
      return SignupResponseModel(
          responseBody: response.body,
          statusCode: response.statusCode.toString());
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AddDeviceResponseModel> addDevice(
      AddDeviceRequestModel requestModel) async {
    String url = "http://54.166.66.196:9000/newdevice";

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    //save user given device name for device id
    prefs.setString(requestModel.deviceID, requestModel.deviceName);

    //check device name
    final devName = prefs.getString(requestModel.deviceID) ?? '';
    print(devName);

    print("Token for add device is below");
    print(token);
    print("Token for add device is above");

    final response = await http.post(
      url,
      body: requestModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print("Response code for add device is below");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      /*
      return AddDeviceResponseModel.fromJson(
        json.decode(response.body),
      );
      */
      return AddDeviceResponseModel(
          responseBody: response.body,
          statusCode: response.statusCode.toString());
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AddTankResponseModel> addTank(AddTankRequestModel requestModel) async {
    String url = "http://54.166.66.196:9000/newtank";

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      url,
      body: requestModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return AddTankResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DevicesResponseModel> devices(DevicesRequestModel requestModel) async {
    String url = "http://54.166.66.196:9000/devices";

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      url,
      body: requestModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return DevicesResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<GetPercentageResponseModel> getPercentage(
      GetPercentageRequestModel requestModel) async {
    String url = "http://54.166.66.196:9000/percentage";

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      url,
      body: requestModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return GetPercentageResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<GasUsageResponseModel> gasUsage(
      GasUsageRequestModel requestModel) async {
    String url = "http://54.166.66.196:9000/history";

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      url,
      body: requestModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return GasUsageResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
