import 'package:flutter/material.dart';


class Entry extends StatelessWidget {
  String title, hint;
  Color outlineColor, cursorColor;
  double radius, outlineThikness;
  bool isPassword, showCursor;
  TextStyle hintStyle, inputStyle;

  Entry({
    this.title = "Field",
    this.hint= "hint",
    this.outlineColor = Colors.blue,
    this.radius = 10,
    this.outlineThikness=2,
    this.isPassword = false,
    this.showCursor = true,
    this.cursorColor = Colors.blue,
    this.hintStyle= const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    this.inputStyle= const TextStyle(fontSize: 18),
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
            style: hintStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            showCursor: showCursor,
            style: inputStyle,
            cursorColor: cursorColor,
            obscureText: isPassword,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(right: 10, left: 10),
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