import 'package:flutter/material.dart';
import 'package:flutteruipackage/flutteruipackage.dart';

class MyDialogs extends StatefulWidget {
  MyDialogs({Key key}) : super(key: key);
  @override
  _MyDialogsState createState() => _MyDialogsState();
}

class _MyDialogsState extends State<MyDialogs> {
  @override
  
  Widget build(BuildContext context) {

    Widget iconwidget = new Icon(
      Icons.warning,
      color: Colors.white,
      size: 70,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Alert Dialogs"),
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
              icon: Icons.done,
              iconSize: 20,
              text: "No Button Dialog",
              backgroundColor: Colors.green,
              onPressed: () { //a dialog with no button, no image
                BasicAlertBox(
                  themeColor: Colors.indigo,
                  backgroundColor: Colors.tealAccent[100],
                  title: "Alert Dialog",
                  description: "This is a dialog with no button",
                  dialogRadius: 10,
                  buttonsWidth: 50,
                ).show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Horizontal Buttons",
              backgroundColor: Colors.redAccent,
              onPressed: () {  //shows a dialog with two Horizantal buttons + network gif image
                BasicAlertBox(
                  imageWidget: Image.network(
                    "https://cdn.dribbble.com/users/146798/screenshots/2933118/rocket.gif",
                    width: 150,
                    height: 150,
                  ),
                  dialogRadius: 7,
                  title: "An Alert Box",
                  description: "Example of a dialog with two horizontal buttons and a widget between title and description.",
                  successText: "OK",
                  dismissText: "CANCEL",
                  buttonsWidth: 100,
                  onSuccessPressed: () {
                    Navigator.of(context).pop();
                  },
                  onDismissPressed: () {
                    Navigator.of(context).pop();
                  },
                ).show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Vertical Buttons",
              backgroundColor: Colors.redAccent,
              onPressed: () {  //a dialog with two Vertical buttons
                BasicAlertBox(
                  dialogRadius: 7,
                  buttonsWidth: 200,
                  themeColor: Colors.teal,
                  title: "An Alert Box",
                  description: "Example of a dialog with two vertical buttons.",
                  successText: "OK",
                  dismissText: "CANCEL",
                  onSuccessPressed: () {
                    Navigator.of(context).pop();
                  },
                  onDismissPressed: () {
                    Navigator.of(context).pop();
                  },
                  buttonsPosition: ButtonsPosition.VERTICAL,
                 ).show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Stack Dialog 1",
              backgroundColor: Colors.blue,
              onPressed: () { //shows a dialog with popup icon in a blue circle
                StackAlertBox(
                  dialogRadius: 15,
                  buttonsWidth: 150,
                  themeColor: Colors.blue,
                  backgroundColor: Colors.white,
                  circleColor: Colors.blue,
                  title: "Alert Box",
                  description: "A Stack Dialog with a custom widget inside the circle above.",
                  imageWidget: iconwidget,
                  successText: "OK",
                  dismissText: "CANCEL",
                  buttonsPosition: ButtonsPosition.VERTICAL,
                ).show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Stack Dialog 2",
              backgroundColor: Colors.blue,
              onPressed: () {
                StackAlertBox(  //a dialog with popup png image from network
                    imageWidget: Image.network(
                        "https://www.freepngimg.com/thumb/technology/35452-1-robot-hd.png",
                      width: 170,
                      height: 190,
                    ),
                    title: "An Alert Dialog",
                    description: "An other stack dialog with a png image, check your network connection to appear",
                    buttonsWidth: 100,
                    successText: "OK",
                    themeColor: Colors.blueGrey,
                    buttonsAlignement: ButtonsAlignement.RIGHT
                ).show(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
