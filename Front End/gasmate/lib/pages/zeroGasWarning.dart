import 'package:flutter/material.dart';
import 'package:gasmate/pages/addTankPage.dart';

class ZeroGaswarning extends StatefulWidget {
  @override
  _ZeroGaswarningState createState() => _ZeroGaswarningState();
}

class _ZeroGaswarningState extends State<ZeroGaswarning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.orange[600]),
      child: AlertDialog(
        title: Text("Your gas tank is empty!"),
        content: Text("Refill and add new tank details"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTankPage()));
            },
            child: Text("Add tank"),
          ),
        ],
      ),
    );
  }
}
