import 'package:flutter/material.dart';
import 'customdropdown.dart';

enum Dots{
  HORIZONTAL,
  VERTICAL
}

// ---------------- Classic Dropdown from material
// using customdropdown.dart (from stackoverflow)
// to persist the dropdown list under button -----------
// doesn't work when the list get longer
class ClassicDropdown extends StatefulWidget {
  List<Item> list;
  String hint;
  Color outlineColor;
  Color backgroundColor, boxColor;
  double width, borderRadius, borderThickness, iconSize;
  TextStyle style;
  Widget icon;
  ClassicDropdown({
    this.list,
    this.borderThickness = 2,
    this.borderRadius = 10,
    this.iconSize = 40,
    this.icon ,
    this.width = 200,
    this.boxColor = Colors.white,
    this.outlineColor = Colors.white,
    this.hint = "Select",
    this.backgroundColor  = Colors.white,
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
      width: widget.width,
      //padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: widget.boxColor,
          border: Border.all(
              color: widget.outlineColor, width: widget.borderThickness),
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: new Theme(
        data: Theme.of(context).copyWith(
        canvasColor: widget.backgroundColor,
        ),
       child :ButtonTheme(
        alignedDropdown: true,
        child : CustomDropdownButton<Item>(
          hint: Text(
            widget.hint.toString(),
            style: widget.style,
          ),
          icon: widget.icon,
          iconSize: widget.iconSize,
          style: widget.style,
         // underline: SizedBox(),
          value: selectedUser,
          onChanged: (Item Value) {
            setState(() {
              selectedUser = Value;
            });
          },
          items: widget.list.map((Item user) {
            return  DropdownMenuItem<Item>(
              value: user,
              child:  Row(
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
      ),
    ),
    );
  }
}
// ----------------------------------------------

//----------- dropdown from Material----------------
class MaterialDropdown extends StatefulWidget {
  List<Item> list;
  String hint;
  Color outlineColor;
  Color backgroundColor, boxColor;
  double borderRadius, borderThickness, iconSize;
  TextStyle style;
  Widget icon;
  MaterialDropdown({
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
    this.backgroundColor  = Colors.white,
    this.style = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
  });
  @override
  _MdropState createState() => _MdropState();
}
class _MdropState extends State<MaterialDropdown> {
  Item selectedUser;

  @override
  Widget build(BuildContext context) {
    return new Container(
      //padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: widget.boxColor,
          border: Border.all(
              color: widget.outlineColor, width: widget.borderThickness),
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: new Theme(
        data: Theme.of(context).copyWith(
        canvasColor: widget.backgroundColor,
        ),
       child :ButtonTheme(
        alignedDropdown: true,
        child : DropdownButton<Item>(
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
            return  DropdownMenuItem<Item>(
              value: user,
              child:  Row(
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
      ),
    ),
    );
  }
}
//-----------------------------------------

//------------ a class to store dropdown items,
// it contains a text and a widget which can be an icon, image ... ----------
class Item {
  const Item({this.name="", this.icon = const SizedBox()});
  final String name;
  final Widget icon;
}
//-----------------------------------------

//-----------Scrollable PopupMenu with dots-------------------
class DotsMenu extends StatefulWidget {
  Dots dots ;
  List<Item> items;
  double width, height, borderRadius, dotsSize;
  Color backgroundColor, outlineColor;
  Color iconColor, dotsColor;
  ValueChanged<int> onChange;
  TextStyle style;

  DotsMenu({
    Key key,
    this.items,
    this.dotsSize=30,
    this.dots= Dots.HORIZONTAL,
    this.width = 100,
    this.height = 300,
    this.style = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
    this.dotsColor= Colors.black,
    this.borderRadius = 4,
    this.backgroundColor = const Color(0xFFFFFFFFF),
    this.outlineColor = Colors.transparent,
    this.iconColor = Colors.black,
    this.onChange,
  });
  @override
  _DotsMenuState createState() => _DotsMenuState();
}
class _DotsMenuState extends State<DotsMenu> {
  GlobalKey _key;
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    _key = LabeledGlobalKey("button");
    super.initState();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    Icon dotsIcon;
   switch(widget.dots) {
     case Dots.HORIZONTAL:
       dotsIcon = Icon(Icons.more_horiz, size: widget.dotsSize,);
       break;
     case Dots.VERTICAL:
       dotsIcon= Icon(Icons.more_vert, size: widget.dotsSize,);
       break;
   }
    return Container(
      key: _key,
      child: IconButton(
        icon: dotsIcon,
        color: widget.dotsColor,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Stack (children :[
          Positioned.fill(
            child: GestureDetector(
              onTap:closeMenu,
              child: Container(
                color: Colors.transparent,
              ),
            )
          ),
         Positioned(
          top: buttonPosition.dy + buttonSize.height/1.5,
          right: buttonPosition.dx + buttonSize.height/3.5,
          width: widget.width,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ConstrainedBox(
                constraints: new BoxConstraints(
                  maxHeight: widget.height,
                  maxWidth: widget.width,
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: widget.items.length * buttonSize.height,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    border: Border.all(color: widget.outlineColor ,width: 2.0),
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  child: Theme(
                    data: ThemeData(
                      iconTheme: IconThemeData(
                        color: widget.iconColor,
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children:[ Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(widget.items.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onChange(index);
                              closeMenu();
                            },
                            child: Container(
                              width: widget.width,
                              height: buttonSize.height,
                              child: Row (
                                children : [
                                  widget.items[index].icon,
                                  SizedBox(width: 10,),
                                  Text(widget.items[index].name, style: widget.style,)
                                ],
                              )
                            ),
                          );
                        }),
                      ),] ,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),],);
      },
    );
  }
}
//-----------------------------------------

// --------A notch for our AwesomeMenu-------------
class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
//-----------------------------------------

// ---------A PopupMenu with a triangle arrow-------------
class AwesomeMenu extends StatefulWidget {
  List<Item> items;
  double width, height, borderRadius, iconSize;
  Icon icon;
  Color backgroundColor;
  Color  iconColor;
  ValueChanged<int> onChange;
  TextStyle style;

  AwesomeMenu({
    Key key,
    this.items,
    this.icon= const Icon(Icons.add_alert, size: 38,),
    this.width = 100,
    this.height = 300,
    this.style = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
    this.borderRadius = 4,
    this.backgroundColor = Colors.red,
    this.iconColor = Colors.black,
    this.onChange,
  });
  @override
  _AwesomeMenuState createState() => _AwesomeMenuState();
}
class _AwesomeMenuState extends State<AwesomeMenu> {
  GlobalKey _key;
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: IconButton(
        icon: widget.icon,
        color: widget.iconColor,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Stack (children :[
          Positioned.fill(
              child: GestureDetector(
                onTap:closeMenu,
                child: Container(
                  color: Colors.transparent,
                ),
              )
          ),
          Positioned(
            top: buttonPosition.dy + buttonSize.height/1.5,
            left: buttonPosition.dx - buttonSize.height/2,
            width: widget.width,
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipPath(
                      clipper: ArrowClipper(),
                      child: Container(
                        width: 20,
                        height: 20,
                        color: widget.backgroundColor ?? Color(0xFFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 19.0),
                    child: ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxHeight: widget.height,
                        maxWidth: widget.width,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: widget.items.length * buttonSize.height,
                        decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius: BorderRadius.circular(widget.borderRadius),
                        ),
                        child: Theme(
                          data: ThemeData(
                            iconTheme: IconThemeData(
                              color: widget.iconColor,
                            ),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children:[ Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(widget.items.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    widget.onChange(index);
                                    closeMenu();
                                  },
                                  child: Container(
                                      width: widget.width,
                                      height: buttonSize.height,
                                      child: Row (
                                        children : [
                                          widget.items[index].icon,
                                          SizedBox(width: 10,),
                                          Text(widget.items[index].name, style: widget.style,)
                                        ],
                                      )
                                  ),
                                );
                              }),
                            ),] ,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],);
      },
    );
  }
}

// ----------- a function to show popup menu anywhere -------------
void showPopupMenu(BuildContext context, Offset offset) async {
  double left = offset.dx;
  double top = offset.dy;
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(left, top, 100, 100),
    items: [
      PopupMenuItem<String>(
          child: const Text('One'), value: 'One'),
      PopupMenuItem<String>(
          child: const Text('Two'), value: 'Two'),
    ],
    elevation: 8.0,
  );
}
//-----------------------------------------


// ----------- Material PopupMenu  -------------
class MaterialPopup extends StatefulWidget{
  Offset offset ;
  Color backgroundColor, outlineColor;
  String text;
  double width, height;
  List<String> items ;
  TextStyle style;
  double borderRadius;

  MaterialPopup({
    this.offset= const Offset (50,50),
    this.backgroundColor= Colors.blue,
    this.outlineColor = Colors.transparent,
    this.text= 'Select',
    this.items,
    this.width = 100,
    this.height = 50,
    this.style = const TextStyle( fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    this.borderRadius = 10
  });

  @override
  _MaterialPopupState createState() => _MaterialPopupState();
}
class _MaterialPopupState extends State<MaterialPopup> {
  String _selection;
  @override
  Widget build(BuildContext context) {
    List <PopupMenuItem<String>> list = widget.items.map((String text){
      return PopupMenuItem<String>(
        value: text,
        child: Text(text),
      ); }).toList();
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
        _selection = value;
        });
      },
      offset: widget.offset,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: widget.outlineColor, width: 2),
        ),
        child:  Align(
          alignment: Alignment.center,
          child: Text(
            _selection == null ? widget.text : _selection.toString(),
           // textAlign: TextAlign.center,
            style: widget.style,
          ),
        ),
      ),
      itemBuilder: (BuildContext context) {
        return list;
       }
    );
  }
}
//-----------------------------------------
