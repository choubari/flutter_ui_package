import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Position{
  CENTER,
  LEFT,
  RIGHT
}

MainAxisAlignment getPosition(Position position){
  switch(position){
    case Position.CENTER :
      return MainAxisAlignment.center;
    case Position.LEFT :
      return MainAxisAlignment.start;
    case Position.RIGHT :
      return MainAxisAlignment.end;
  }
}
// get a Widget List of the Button Content
List<Widget> ButtonContent(IconData icon, Color iconColor, double iconSize, double icontextSpace, String text, TextStyle textStyle){
  if (icon != null){
    return [
      Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      SizedBox(
        width: icontextSpace,
      ),
      Text(
        text,
        style: textStyle,
      ),
    ];
  }else return [
    Text(
      text,
      style: textStyle,
    ),
  ];
}

class BFilled extends StatelessWidget {
  String text;
  Color iconColor, backgroundColor;
  double width, height, radius, iconSize, icontextSpace;
  IconData icon;
  VoidCallback onPressed;
  TextStyle textStyle;
  Position alignment;
  BFilled({
    this.width =100,
    this.height= 50,
    this.radius = 7,
    this.text = "",
    this.textStyle= const TextStyle(fontSize: 18 , fontWeight: FontWeight.w700, color: Colors.white),
    this.backgroundColor= Colors.blue,
    this.icon,
    this.iconColor= Colors.white,
    this.icontextSpace =10,
    this.iconSize =32,
    this.alignment = Position.CENTER,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child:  SizedBox.expand(
        child : FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          padding: EdgeInsets.all(10),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: getPosition(alignment),
            children: ButtonContent(icon, iconColor, iconSize, icontextSpace, text, textStyle),
          ),
        ),
      )
    );
  }
}

class BOutlined extends StatelessWidget {
  String text;
  Color iconColor, backgroundColor, outlineColor;
  double width, height, radius, iconSize, icontextSpace;
  IconData icon;
  VoidCallback onPressed;
  TextStyle textStyle;
  Position alignment;

  BOutlined({
    this.width =100,
    this.height= 50,
    this.radius = 7,
    this.text = "",
    this.textStyle= const TextStyle(fontSize: 18 , fontWeight: FontWeight.w700, color: Colors.black),
    this.backgroundColor= Colors.transparent,
    this.icon,
    this.iconColor= Colors.blue,
    this.icontextSpace =10,
    this.iconSize =32,
    this.alignment = Position.CENTER,
    this.outlineColor= Colors.blue,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: outlineColor ,width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: SizedBox.expand(
        child : FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          padding: EdgeInsets.all(10),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: getPosition(alignment),
            children: ButtonContent(icon, iconColor, iconSize, icontextSpace, text, textStyle),
          ),
        ),
      ),
    );
  }
}

class BRaised extends StatelessWidget {
  String text;
  Color backgroundColor, iconColor, shadowColor;
  double width, height, radius, iconSize, icontextSpace, spreadRadius, blurRadius;
  Offset shadowOffset;
  VoidCallback onPressed;
  TextStyle textStyle;
  IconData icon;
  Position alignment;

  BRaised ({
    this.width =100,
    this.height= 50,
    this.radius = 7,
    this.text = "",
    this.textStyle= const TextStyle(fontSize: 18 , fontWeight: FontWeight.w700, color: Colors.white),
    this.backgroundColor= Colors.blue,
    this.icon,
    this.iconColor= Colors.white,
    this.icontextSpace =10,
    this.iconSize =32,
    this.alignment = Position.CENTER,
    this.shadowColor= const Color(0x80303030),
    this.spreadRadius = 2,
    this.blurRadius = 4,
    this.shadowOffset = const Offset(0, 2),
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [BoxShadow(color: shadowColor, spreadRadius: spreadRadius, blurRadius: blurRadius, offset: shadowOffset)],
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          padding: EdgeInsets.all(10),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: getPosition(alignment),
            children: ButtonContent(icon, iconColor, iconSize, icontextSpace, text, textStyle),
          ),
        ),
      ),
    );
  }
}