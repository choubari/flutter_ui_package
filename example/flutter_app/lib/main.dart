import 'package:flutter/material.dart';
import 'package:flutteruipackage/flutteruipackage.dart';
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
    TextStyle text = new TextStyle(
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
              'A demo for Custom Buttons & other widgets',
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Alert Dialogs",
              textStyle: text,
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
              alignment: Position.LEFT,
              textStyle: text,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyInputs()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Dropdowns",
              backgroundColor: Colors.teal,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyDrops()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            BRaised(
              width: 200,
              height: 50,
              text: "Custom Dropdowns",
              backgroundColor: Colors.teal,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              icon: Icons.done,
              iconSize: 20,
              text: "other Widgets",
              backgroundColor: Colors.green,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
