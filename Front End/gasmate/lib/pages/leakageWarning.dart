import 'package:flutter/material.dart';
import 'package:gasmate/pages/devicesPage.dart';

class LeakageWarning extends StatefulWidget {
  @override
  _LeakageWarningState createState() => _LeakageWarningState();
}

class _LeakageWarningState extends State<LeakageWarning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.orange[600]),
      child: AlertDialog(
        title: Text("Gas Leakage Detected!"),
        content: Text(
          "Please take safety actions",
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DevicesPage()));
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
