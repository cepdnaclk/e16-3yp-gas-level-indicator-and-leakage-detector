import 'package:flutter/material.dart';
import 'package:gasmate/pages/addDevice.dart';
import 'package:gasmate/pages/addTankPage.dart';
import 'package:gasmate/pages/gasUsage.dart';
import 'package:gasmate/pages/welcome_page.dart';
import 'package:gasmate/pages/devicesPage.dart';
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

    return _email;
  }

  @override
  Widget build(BuildContext context) {
    String userEmail = _getEmail().toString();
    print("email is");
    print(userEmail);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                //color: Colors.orange[500]
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfffbb448), Color(0xffe46b10)])),
            child: Column(
              children: [
                SizedBox(height: 10),
                //Image.asset('assets/user_64px.png'),
                Image(image: AssetImage("/user_64px.png")),
                SizedBox(height: 10),

                Text(
                  "kasuni@gmail.com",
                  //"user email comes here",
                  //userEmail.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
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
