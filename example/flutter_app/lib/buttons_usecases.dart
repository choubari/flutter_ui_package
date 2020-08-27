import 'package:flutter/material.dart';
import 'package:flutteruipackage/flutteruipackage.dart';

class MyButtons extends StatefulWidget {
  MyButtons({Key key}) : super(key: key);
  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build (BuildContext context) {
    TextStyle text = new TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);
    TextStyle textstyle = new TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.green);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "LOGIN WITH FACEBOOK",
              textStyle: text,
              backgroundColor: Color(0xff2872ba),
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Button",
              radius: 30,
              alignment: Position.LEFT,
              textStyle: text,
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              icon: Icons.subscriptions,
              iconSize: 20,
              icontextSpace: 30,
              text: "Subscribe Now",
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            BOutlined(
              width: 200,
              height: 50,
              text: "SAVE TO PLAYLIST",
              backgroundColor: Colors.blueGrey[50],
              outlineColor: Colors.red,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            BOutlined(
              width: 200,
              height: 50,
              icon: Icons.done,
              iconSize: 20,
              iconColor: Colors.green,
              text: "ADD TO FAVORITES",
              textStyle: textstyle,
              outlineColor: Colors.green,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            BRaised(
              width: 210,
              height: 50,
              text: "LOGIN",
              backgroundColor: Colors.orange,
              shadowColor: Colors.lightBlue[200],
              shadowOffset: Offset(2,2),
              spreadRadius: 1,
              blurRadius: 1,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            BRaised(
              width: 210,
              height: 50,
              text: "CREATE ACCOUNT",
              icon: Icons.person,
              iconColor: Colors.white,
              iconSize: 25,
              icontextSpace: 5,
              backgroundColor: Colors.lightBlue,
              shadowColor: Colors.orange[200],
              shadowOffset: Offset(0,2),
              spreadRadius: 1,
              blurRadius: 7,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

