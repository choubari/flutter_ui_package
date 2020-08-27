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
            DotsMenu(
              items: [
                Item(name : 'Profil', icon: Icon(Icons.person)),
                Item(name : 'Phone', icon: Icon(Icons.phone)),
                Item(name : 'Email', icon: Icon(Icons.email)),
                Item(name : 'Adress', icon: Icon(Icons.home)),
                Item(name : 'Job', icon: Icon(Icons.work)),
              ],
              height: 200,
              width: 100,
              dots: Dots.HORIZONTAL,
              borderRadius: 5,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              iconColor: Colors.white,
              outlineColor: Colors.black,
              backgroundColor: Colors.red,
              onChange: (index) {
                print(index); //action setted when an item is chosen
              },
            ),
            SizedBox(height: 20,),

            // the classic dropdown from material
            MaterialDropdown(
              list: [
                Item(name : 'Android',  icon: Icon(Icons.android, color:  Colors.teal,)),
                Item(name : 'Flutter',),
                Item(name : 'iOS',icon: Icon(Icons.mobile_screen_share,color: Colors.teal)),
                Item(name : 'ReactNative',),
              ],
              outlineColor: Colors.blue,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
              iconSize: 30,
              borderRadius: 5,
              hint: "Select Language",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(height: 20,),

            // the same material dropdown but it persists opening the menu under the button, isn't working for a big list
            ClassicDropdown(
              width: 250,
              list: [
                Item(name : 'Android',  icon: Icon(Icons.android, color:  Colors.teal,)),
                Item(name : 'Flutter',),
                Item(name : 'iOS',icon: Icon(Icons.mobile_screen_share,color: Colors.teal)),
                Item(name : 'ReactNative',),
              ],
              outlineColor: Colors.teal,
              icon: Icon(Icons.keyboard_arrow_up, color: Colors.teal,),
              iconSize: 30,
              borderRadius: 5,
              hint: "Select Language",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(height: 20,),

            // Popup Menu of Material
            MaterialPopup(
              text: 'Choose a number',
              width: 160,
              height: 50,
              offset: Offset(50,50),
              borderRadius: 5,
              backgroundColor: Colors.blueGrey[50],
              outlineColor: Colors.blue,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue) ,
              items: ["One","Two", "Three"],
            ),
            SizedBox(height: 20,),

            AwesomeMenu(
              icon: Icon(Icons.notification_important, color: Colors.black, size: 35,),
              iconColor: Colors.black,
              items: [
                Item(name : 'Profil', icon: Icon(Icons.person)),
                Item(name : 'Phone', icon: Icon(Icons.phone)),
                Item(name : 'Email', icon: Icon(Icons.email)),
              ],
              borderRadius: 4,
              backgroundColor: Colors.red,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
