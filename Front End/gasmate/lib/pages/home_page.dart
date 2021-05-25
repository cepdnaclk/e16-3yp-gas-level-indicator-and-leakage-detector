import 'package:flutter/material.dart';
import 'package:gasmate/pages/widgets/widget_home_Categorized.dart';
import 'package:gasmate/pages/widgets/widget_report_list.dart';
import 'package:gasmate/shared_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Dashboard"),
        actions: [
          GestureDetector(
            onTap: () {
              SharedService.logout().then(
                  (_) => Navigator.of(context).pushReplacementNamed('/login'));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Icon(Icons.power_settings_new),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      ),
      body: _uiSetup(),
    );
  }

  Widget _uiSetup() {
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  DashboardItems(),
                  WidgetReportList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
