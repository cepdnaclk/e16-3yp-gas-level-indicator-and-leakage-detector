import 'package:flutter/material.dart';
import 'package:gasapp4/pages/zeroGasWarning.dart';
import 'pages/welcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      //home: ZeroGaswarning(),
    );
  }
}
