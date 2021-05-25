import 'package:flutter/material.dart';
import 'package:gasmate/ProgressHUD.dart';
import 'package:gasmate/api/api_service.dart';
import 'package:gasmate/model/add_device_model.dart';
import 'package:gasmate/pages/devicesPage.dart';
import 'package:flutter/gestures.dart';
import 'package:gasmate/pages/navigationPanel.dart';
import 'package:gasmate/pages/zeroGasWarning.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddDevicePage extends StatefulWidget {
  AddDevicePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  AddDeviceRequestModel addDeviceRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    addDeviceRequestModel = new AddDeviceRequestModel();
  }

  /*
  String barCode = '';

  Future scanBarcodeNormal() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    print(barcodeScanRes);

    setState(() {
      barCode = barcodeScanRes;
    });
  }
  */

  Widget _addDevice() {
    return InkWell(
      onTap: () {
        if (validateAndSave()) {
          print(addDeviceRequestModel.toJson());

          Navigator.push(
              //context, MaterialPageRoute(builder: (context) => DevicesPage()));
              context,
              MaterialPageRoute(builder: (context) => ZeroGaswarning()));

          setState(() {
            isApiCallProcess = true;
          });

          APIService apiService = new APIService();
          apiService.addDevice(addDeviceRequestModel).then((value) {
            if (value != null) {
              setState(() {
                isApiCallProcess = false;
              });

              if (value.statusCode.isNotEmpty) {
                final snackBar =
                    SnackBar(content: Text("Device Added Successfully!"));
                scaffoldKey.currentState.showSnackBar(snackBar);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DevicesPage()));
              } else {
                final snackBar =
                    SnackBar(content: Text("Adding Device failed"));
                scaffoldKey.currentState.showSnackBar(snackBar);
              }
            }
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Add Device',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  /*
  Widget _ScanQR() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            'Scan Device ID QR code',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
  */

  Widget _deviceID() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: TextFormField(
          //onSaved: (input) => addDeviceRequestModel.deviceID = input,

          //remove after backeknd connected
          onSaved: (input) => addDeviceRequestModel.deviceID = input,

          validator: (input) =>
              input.length > 50 ? "Maximum length limit exceeded" : null,
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Device ID'),
        ),
      ),
    );
  }

  Widget _deviceName() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: TextFormField(
          onSaved: (input) => addDeviceRequestModel.deviceName = input,
          validator: (input) =>
              input.length > 50 ? "Maximum length limit exceeded" : null,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Device Name'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: Text('Add New Device'),
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
            child: Form(
              key: globalFormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  _deviceID(),
                  SizedBox(
                    height: 30,
                  ),
                  _deviceName(),
                  SizedBox(
                    height: 100,
                  ),
                  _addDevice(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
