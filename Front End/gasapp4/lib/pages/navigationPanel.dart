import 'package:flutter/material.dart';
import 'package:gasapp4/pages/addDevice.dart';
import 'package:gasapp4/pages/addTankPage.dart';
import 'package:gasapp4/pages/gasUsage.dart';
import 'package:gasapp4/pages/loginPage.dart';
import 'package:gasapp4/pages/welcomePage.dart';
import 'package:gasapp4/pages/devicesPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _email = '';

class NavigationPanel extends StatefulWidget {
  @override
  _NavigationPanelState createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  _getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange[500]),
            child: Text(
              _email,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Your Devices'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DevicesPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Usage History'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GasUsage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Add New Device'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddDevicePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Add New Tank'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTankPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          ),
        ],
      ),
    );
  }
}
