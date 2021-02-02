import 'package:flutter/material.dart';
import 'package:gasapp4/api/api_service.dart';
import 'package:gasapp4/model/signup_model.dart';
import 'package:gasapp4/pages/loginPage.dart';

import '../ProgressHUD.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  SignupRequestModel signupRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    signupRequestModel = new SignupRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    String firstEnteredPassword;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.orange[600],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.orange.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => signupRequestModel.email = input,
                          validator: (input) => !input.contains('@')
                              ? "Email Id should be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.orange[700].withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orange[700])),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.orange[700],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => firstEnteredPassword = input,
                          validator: (input) => input.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.orange[700].withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orange[700])),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.orange[700],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.orange[700].withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              signupRequestModel.password = input,
                          validator: (input) => input == firstEnteredPassword
                              ? "Not matched to previous entry!"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Re-enter Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.orange[700].withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orange[700])),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.orange[700],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.orange[700].withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        new TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              signupRequestModel.phoneNumber = input,
                          validator: (input) => input.length != 10
                              ? "Invalid phone number"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Phone Number",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.orange[700].withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orange[700])),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.orange[700],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(signupRequestModel.toJson());

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService
                                  .signup(signupRequestModel)
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.statusCode.isNotEmpty) {
                                    final snackBar = SnackBar(
                                        content:
                                            Text("Registered Successfully"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text(value.error));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.orange[700],
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
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
