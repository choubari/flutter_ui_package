import 'package:flutter/material.dart';
import 'package:flutteruipackage/flutteruipackage.dart';
import 'buttons_usecases.dart';
import 'dialogs_usecases.dart';
import 'dropdown_usecases.dart';
import 'inputs_usecases.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: MyHomePage(title: 'Flutter UI Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle textstyle = new TextStyle(
        fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'A demo for Custom UI widgets',
            ),
            SizedBox(
              height: 30,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Buttons",
              textStyle: textstyle,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyButtons()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Alert Dialogs",
              textStyle: textstyle,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyDialogs()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Input Fields",
              textStyle: textstyle,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyInputs()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Dropdowns",
              textStyle: textstyle,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyDrops()));
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
