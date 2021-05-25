import 'package:flutter/material.dart';
import 'package:gasmate/model/gas_usage_model.dart';
import 'package:gasmate/pages/navigationPanel.dart';

class GasUsage extends StatefulWidget {
  @override
  _GasUsageState createState() => _GasUsageState();
}

class _GasUsageState extends State<GasUsage> {
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  GasUsageRequestModel gasUsageRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    gasUsageRequestModel = new GasUsageRequestModel();
  }

  Widget _usageTable() {
    return InkWell(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Table(
          border: TableBorder.all(color: Colors.black26),
          children: [
            TableRow(children: [
              Center(
                  child: Text(
                'Day',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
              Center(
                  child: Text(
                'Usage',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
            ]),
            TableRow(children: [
              Center(child: Text('Jan 01')),
              Center(child: Text('300 g')),
            ])
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
        title: Text('Gas Usage'),
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
              _usageTable(),
            ],
          ),
        ),
      ),
    );
  }
}
