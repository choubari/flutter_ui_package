import 'package:flutter/material.dart';


class Entry1 extends StatelessWidget {
  String title, hint;
  Color outlineColor;
  double radius, outlineThikness;
  bool isPassword;

  Entry1({
    this.title = "Field",
    this.hint= "hint",
    this.outlineColor = Colors.blue,
    this.radius = 10,
    this.outlineThikness=2,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outlineColor, width: outlineThikness),
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outlineColor, width: outlineThikness),
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              hintText: hint,
            ),
          )
        ],
      ),
    );
  }
}