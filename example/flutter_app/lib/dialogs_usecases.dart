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

    //a dialog with popup icon in a blue circle
    StackAlertBox stackAlertBox1 = new StackAlertBox(
      dialogRadius: 3,
      buttonsWidth: 150,
      themeColor: Colors.blue,
      backgroundColor: Colors.white,
      circleColor: Colors.blue,
      title: "Alert Box",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      imageWidget: iconwidget,
      successText: "OK",
      dismissText: "CANCEL",
      buttonsPosition: ButtonsPosition.VERTICAL,
    );

    //a dialog with popup png image
    StackAlertBox stackAlertBox2 = new StackAlertBox(
        imageWidget: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Android_robot.png/646px-Android_robot.png"),
        title: "An Alert Dialog",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        buttonsWidth: 100,
        successText: "OK",
        buttonsAlignement: ButtonsAlignement.RIGHT);

    //a dialog with two buttons Horizantal + network gif image
    BasicAlertBox basicAlertBox2H = new BasicAlertBox(
      imageWidget: Image.network(
        "https://cdn.dribbble.com/users/146798/screenshots/2933118/rocket.gif",
        width: 120,
        height: 120,
      ),
      dialogRadius: 7,
      title: "An Alert Box",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      successText: "OK",
      dismissText: "CANCEL",
      buttonsWidth: 100,
      onSuccessPressed: () {
        Navigator.of(context).pop();
      },
      onDismissPressed: () {
        Navigator.of(context).pop();
      },
    );

    //a dialog with two buttons Vertical
    BasicAlertBox basicAlertBox2V = new BasicAlertBox(
      dialogRadius: 7,
      buttonsWidth: 200,
      themeColor: Colors.teal,
      title: "An Alert Box",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      successText: "OK",
      dismissText: "CANCEL",
      onSuccessPressed: () {
        Navigator.of(context).pop();
      },
      onDismissPressed: () {
        Navigator.of(context).pop();
      },
      buttonsPosition: ButtonsPosition.VERTICAL,
      //buttonsAlignement: ButtonsAlignement.LEFT,
    );

    //a dialog with no button, no image
    BasicAlertBox basicAlertBox1 = new BasicAlertBox(
      themeColor: Colors.indigo,
      backgroundColor: Colors.tealAccent,
      title: "Alert Dialog",
      description: "Lorem Ipsum TEST test test test",
      dialogRadius: 10,
      //successText: "OK",
      //buttonsAlignement: ButtonsAlignement.LEFT,
      //onSuccessPressed: (){Navigator.of(context).pop();},
      buttonsWidth: 50,
    );

    TextStyle text = new TextStyle(
        fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Alert Dialogs"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Alert Dialog',
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Stack Dialog 1",
              textStyle: text,
              backgroundColor: Colors.blue,
              onPressed: () {
                stackAlertBox1.show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Stack Dialog 2",
              alignment: Position.LEFT,
              textStyle: text,
              backgroundColor: Colors.blue,
              onPressed: () {
                stackAlertBox2.show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BFilled(
              width: 200,
              height: 50,
              text: "Horizontal Buttons",
              backgroundColor: Colors.teal,
              onPressed: () {
                basicAlertBox2H.show(context: context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            BRaised(
              width: 200,
              height: 50,
              text: "Vertical Buttons",
              backgroundColor: Colors.teal,
              onPressed: () {
                basicAlertBox2V.show(context: context);
              },
            ),
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
              onPressed: () {
                basicAlertBox1.show(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
