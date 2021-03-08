import 'package:flutter/material.dart';
import 'package:gasapp4/ProgressHUD.dart';
import 'package:gasapp4/api/api_service.dart';
import 'package:gasapp4/model/add_tank_model.dart';
import 'package:gasapp4/pages/devicesPage.dart';
import 'package:flutter/gestures.dart';
import 'package:gasapp4/pages/navigationPanel.dart';

class AddTankPage extends StatefulWidget {
  AddTankPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddTankPageState createState() => _AddTankPageState();
}

class _AddTankPageState extends State<AddTankPage> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  AddTankRequestModel addTankRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    addTankRequestModel = new AddTankRequestModel();
  }

  Widget _addTank() {
    return InkWell(
      onTap: () {
        if (validateAndSave()) {
          print(addTankRequestModel.toJson());

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DevicesPage()));

          setState(() {
            isApiCallProcess = true;
          });

          APIService apiService = new APIService();
          apiService.addTank(addTankRequestModel).then((value) {
            if (value != null) {
              setState(() {
                isApiCallProcess = false;
              });

              if (value.token.isNotEmpty) {
                final snackBar =
                    SnackBar(content: Text("Tank Added Successfully!"));
                scaffoldKey.currentState.showSnackBar(snackBar);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DevicesPage()));
              } else {
                final snackBar = SnackBar(content: Text(value.error));
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
          'Add Tank',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

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
          onSaved: (input) => addTankRequestModel.deviceID = input,
          validator: (input) =>
              input.length > 50 ? "Maximum length limit exceeded" : null,
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Device ID'),
        ),
      ),
    );
  }

  Widget _tankBrand() {
    String dropdownValue = 'Litro Gas';
    addTankRequestModel.brand = dropdownValue;

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
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    addTankRequestModel.brand = dropdownValue;
                  });
                },
                items: <String>['Litro Gas', 'LAUGHS']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )),
    );
  }

  Widget _tankSize() {
    String dropdownValue = '5 kg';
    addTankRequestModel.size = dropdownValue;

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
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    addTankRequestModel.size = dropdownValue;
                  });
                },
                items: <String>['5 kg', '10 kg', '15 kg', '20 kg']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )),
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
          title: Text('Add New Tank'),
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
                  _tankBrand(),
                  SizedBox(
                    height: 30,
                  ),
                  _tankSize(),
                  SizedBox(
                    height: 100,
                  ),
                  _addTank(),
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
