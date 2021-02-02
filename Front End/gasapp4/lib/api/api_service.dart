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
    String url = "http://18.206.64.63:9001/login";

    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(url, body: requestModel.toJson());

    if (response.statusCode == 200) {
      prefs.setString('token', response.headers['accessToken']);
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
    String url = "http://18.206.64.63:9000/signup";

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return SignupResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AddDeviceResponseModel> addDevice(
      AddDeviceRequestModel requestModel) async {
    String url = "http://18.206.64.63:9000/newdevice";

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
      return AddDeviceResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AddTankResponseModel> addTank(AddTankRequestModel requestModel) async {
    String url = "http://18.206.64.63:9000/newtank";

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
    String url = "http://18.206.64.63:9000/devices";

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
    String url = "http://18.206.64.63:9000/percentage";

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
    String url = "http://18.206.64.63:9000/history";

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
