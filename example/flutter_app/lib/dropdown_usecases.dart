import 'package:flutter/material.dart';
import 'package:flutteruipackage/flutteruipackage.dart';


class MyDrops extends StatefulWidget {
  MyDrops({Key key}) : super(key: key);
  @override
  _MyDropState createState() => _MyDropState();
}
class _MyDropState extends State<MyDrops> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dropdowns"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            ClassicDropdown(
              list: [
                Item('Android',  icon: Icon(Icons.android, color:  Colors.teal,)),
                Item('Flutter',),
                Item('iOS',icon: Icon(Icons.mobile_screen_share,color: Colors.teal)),
                Item('ReactNative',),
              ],
              outlineColor: Colors.grey,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
              iconSize: 30,
              borderRadius: 5,
              hint: "Select Language",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
