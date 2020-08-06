import 'package:flutter/material.dart';
import 'package:flutteruipackage/flutteruipackage.dart';


class MyInputs extends StatefulWidget {
  MyInputs({Key key}) : super(key: key);
  @override
  _MyInputsState createState() => _MyInputsState();
}
class _MyInputsState extends State<MyInputs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Input Fields"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Entry1(
              title: "Username",
              hint: "username",
              isPassword: false,
              outlineColor: Colors.blue,
              radius: 10,
              outlineThikness: 4,
            ),
            Entry1(
              title: "Password",
              hint: "********",
              isPassword: true,
              outlineColor: Colors.blueGrey,
              radius: 10,
              outlineThikness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
