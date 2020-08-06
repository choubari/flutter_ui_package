import 'package:flutter/material.dart';

class ClassicDropdown extends StatefulWidget {
  List<Item> list;
  String hint;
  Color outlineColor;
  Color backgroundColor, boxColor;
  double borderRadius, borderThickness, iconSize;
  TextStyle style;
  Widget icon;
  ClassicDropdown({
    this.list,
    this.borderThickness = 2,
    this.borderRadius = 10,
    this.iconSize = 40,
    this.icon = const Icon(
      Icons.keyboard_arrow_down,
    ),
    this.boxColor = Colors.white,
    this.outlineColor = Colors.white,
    this.hint = "Select",
    this.backgroundColor,
    this.style = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
  });
  @override
  _CdropState createState() => _CdropState();
}

class _CdropState extends State<ClassicDropdown> {
  Item selectedUser;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: widget.boxColor,
          border: Border.all(
              color: widget.outlineColor, width: widget.borderThickness),
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: DropdownButton<Item>(
        hint: Text(
          widget.hint.toString(),
          style: widget.style,
        ),
        icon: widget.icon,
        iconSize: widget.iconSize,
        style: widget.style,
        underline: SizedBox(),
        value: selectedUser,
        onChanged: (Item Value) {
          setState(() {
            selectedUser = Value;
          });
        },
        items: widget.list.map((Item user) {
          return DropdownMenuItem<Item>(
            value: user,
            child: Row(
              children: <Widget>[
                user.icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  user.name,
                  style: widget.style,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  const Item(this.name, {this.icon = const SizedBox()});
  final String name;
  final Widget icon;
}
