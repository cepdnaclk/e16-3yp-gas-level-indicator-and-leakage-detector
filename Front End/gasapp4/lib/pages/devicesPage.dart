import 'package:flutter/material.dart';
import 'package:gasapp4/api/api_service.dart';
import 'package:gasapp4/model/devices_model.dart';
import 'package:gasapp4/pages/addDevice.dart';
import 'package:gasapp4/pages/navigationPanel.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  bool isApiCallProcess = false;
  DevicesRequestModel devicesRequestModel;
  @override
  void initState() {
    super.initState();
    devicesRequestModel = new DevicesRequestModel();
  }

  APIService apiService = new APIService();

  String dropdownValue = 'd0001';
  List<String> deviceList = ['d0001'];

  Widget _selectDevice(List<String> deviceList) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xffdf8e33).withAlpha(100),
              offset: Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 2)
        ],
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          style: TextStyle(
              color: Colors.orange[700],
              fontSize: 25,
              fontWeight: FontWeight.w500),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: deviceList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _deviceDetails(dropdownValue) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Column(
          children: [
            Text(
              'Device ID : $dropdownValue',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Device Name : kitchen gas',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Gas tank : Litro Gas / 5 kg',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Balance : 100%',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text('Your Devices'),
      ),
      drawer: NavigationPanel(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              _selectDevice(deviceList),
              SizedBox(
                height: 50,
              ),
              _deviceDetails(dropdownValue),
            ],
          ),
        ),
      ),
    );
  }
}
