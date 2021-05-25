import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gasmate/pages/addDevice.dart';

class NoDevicesWarning extends StatefulWidget {
  @override
  _NoDevicesWarningState createState() => _NoDevicesWarningState();
}

class _NoDevicesWarningState extends State<NoDevicesWarning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: AlertDialog(
        title: Text("No Existing Devices!"),
        content: Text("Add new devices here"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddDevicePage()));
            },
            child: Text("Add new device"),
          ),
        ],
      ),
    );
  }
}
