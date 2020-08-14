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
            // 3 dots popup menu
            PopupMenu(
              items: [
                Item(name : 'Profil', icon: Icon(Icons.person)),
                Item(name : 'Phone', icon: Icon(Icons.phone)),
                Item(name : 'Email', icon: Icon(Icons.email)),
                Item(name : 'Profil', icon: Icon(Icons.person)),
                Item(name : 'Phone', icon: Icon(Icons.phone)),
                Item(name : 'Email', icon: Icon(Icons.email)),
              ],
              height: 200,
              width: 100,
              dots: Dots.HORIZONTAL,
              borderRadius: 5,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              iconColor: Colors.white,
              outlineColor: Colors.black,
              backgroundColor: Colors.grey,
              onChange: (index) {
                print(index);
              },
            ),
            SizedBox(height: 20,),
            // the classsic dropdown from material
            MaterialDropdown(
              list: [
                Item(name : 'Android',  icon: Icon(Icons.android, color:  Colors.teal,)),
                Item(name : 'Flutter',),
                Item(name : 'iOS',icon: Icon(Icons.mobile_screen_share,color: Colors.teal)),
                Item(name : 'ReactNative',),
                Item(name : 'Android',  icon: Icon(Icons.android, color:  Colors.teal,)),
                Item(name : 'Flutter',),
                Item(name : 'iOS',icon: Icon(Icons.mobile_screen_share,color: Colors.teal)),
                Item(name : 'ReactNative',),
              ],
              outlineColor: Colors.grey,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
              iconSize: 30,
              borderRadius: 5,
              hint: "Select Language",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(height: 20,),
            // the same material dropdown but it opens the dropdown menu under the button, isn't working for a big list, to be fixed
            ClassicDropdown(
              list: [
                Item(name : 'Android',  icon: Icon(Icons.android, color:  Colors.teal,)),
                Item(name : 'Flutter',),
                Item(name : 'iOS',icon: Icon(Icons.mobile_screen_share,color: Colors.teal)),
                Item(name : 'ReactNative',),
              ],
              outlineColor: Colors.teal,
              icon: Icon(Icons.keyboard_arrow_up, color: Colors.grey,),
              iconSize: 30,
              borderRadius: 5,
              hint: "Select Language",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(height: 20,),
            // Popup Menu of Material
            MaterialPopup(
              text: 'Choose a number',
              width: 170,
              borderRadius: 5,
              items: ["One","Two", "Three"],
            ),
            SizedBox(height: 20,),
            AwesomeMenu(
              items: [
                Item(name : 'Profil', icon: Icon(Icons.person)),
                Item(name : 'Phone', icon: Icon(Icons.phone)),
                Item(name : 'Email', icon: Icon(Icons.email)),
              ],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
            )
            //BOutlined(text: "click",height: 50, backgroundColor: Colors.blue, onPressed: (){showPopupMenu(context, Offset(300,300));},)
          ],
        ),
      ),
    );
  }
}
