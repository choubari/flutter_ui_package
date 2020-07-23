import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';

enum ButtonsPosition{
  HORIZONTAL,
  VERTICAL,
}
enum ButtonsAlignement{
  LEFT,
  RIGHT,
  CENTER,
}
// return a Widget array of buttons according to buttons (success, dismiss) input texts
List<Widget> AddButtons(BuildContext context, ButtonsPosition buttonsPosition, String successText, VoidCallback onSuccessPressed, String dismissText, VoidCallback onDismissPressed, Color backgroundColor, Color themeColor){
  TextStyle successtextstyle= new TextStyle(fontSize: 17 , fontWeight: FontWeight.w800, color: backgroundColor);
  TextStyle dismisstextstyle= new TextStyle(fontSize: 17 , fontWeight: FontWeight.w800, color: themeColor);
  if (successText.isEmpty && dismissText.isEmpty){
    return [];
  }else{
    if (successText.isNotEmpty && dismissText.isNotEmpty){
      return [
        BOutlined(
          width: getButtonsWidth(context, buttonsPosition),
          height: 45,
          text: dismissText,
          textStyle: dismisstextstyle,
          outlineColor: themeColor,
          backgroundColor: backgroundColor,
          onPressed: onDismissPressed,
        ),
        SizedBox(
          width: 12,
          height: 10,
        ),
        BFilled(
          width: getButtonsWidth(context, buttonsPosition),
          height: 45,
          text: successText,
          textStyle: successtextstyle,
          backgroundColor: themeColor,
          onPressed: onSuccessPressed,
        )
      ];
    }else{
      if (successText.isNotEmpty)  return [
        BFilled(
          width: getButtonsWidth(context, buttonsPosition),
          height: 45,
          text: successText,
          textStyle: successtextstyle,
          backgroundColor: themeColor,
          onPressed: onSuccessPressed,
        )
       ];
      else return [
        BOutlined(
          width: getButtonsWidth(context, buttonsPosition),
          height: 45,
          text: dismissText,
          textStyle: dismisstextstyle,
          outlineColor: themeColor,
          backgroundColor: backgroundColor,
          onPressed: onDismissPressed,
        ),
      ];
    }
  }
}
// place buttons on a row or colum according to buttonsPosition value (HORIZONTAL, VERTICAL)
Widget PlaceButtons(ButtonsPosition position, List<Widget> array, ButtonsAlignement alignement){
  MainAxisAlignment mainAxisAlignment;
  switch (alignement){
    case ButtonsAlignement.CENTER:
      mainAxisAlignment= MainAxisAlignment.center;
      break;
    case ButtonsAlignement.LEFT:
      mainAxisAlignment= MainAxisAlignment.start;
      break;
    case ButtonsAlignement.RIGHT:
      mainAxisAlignment= MainAxisAlignment.end;
      break;
  }
  if (array.isEmpty){
    return Container(width: 0, height: 0, color: Colors.transparent,);
  }
  switch (position){
    case ButtonsPosition.HORIZONTAL:
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: array,
        ),
      );
    case ButtonsPosition.VERTICAL :
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: array,
        ),
      );
  }
}
// return buttons width, full width for vertical alignement, and custom width for horizontal
double getButtonsWidth(BuildContext context, ButtonsPosition position){
  double width = MediaQuery.of(context).size.width;
  switch (position){
    case ButtonsPosition.VERTICAL :
        return width;
    case ButtonsPosition.HORIZONTAL :
        return width/3.5;
  }
}


// Dialog Box with customizable widget between title and description
class BasicAlertBox {
  double dialogRadius;
  Color themeColor, backgroundColor;
  String title, description;
  String successText, dismissText;
  Widget imageWidget;
  ButtonsPosition buttonsPosition;
  ButtonsAlignement buttonsAlignement;
  VoidCallback onSuccessPressed, onDismissPressed;
  BasicAlertBox({
    this.dialogRadius= 0,
    this.themeColor= Colors.blue,
    this.backgroundColor = Colors.white,
    this.title = "Alert Dialog",
    this.description= "This is an alert dialog !",
    this.imageWidget= const Card(color: Colors.transparent,),
    this.successText = "",
    this.onSuccessPressed,
    this.dismissText= "",
    this.onDismissPressed,
    this.buttonsAlignement = ButtonsAlignement.CENTER,
    this.buttonsPosition = ButtonsPosition.HORIZONTAL
  });

  Future show({
    @required BuildContext context,
  }) {
    assert(context != null, "context is null!");
    TextStyle titletext= new TextStyle(fontSize: 26 , fontWeight: FontWeight.w700, color: themeColor);
    TextStyle descriptiontext= new TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.black);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(dialogRadius)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(title, style: titletext, textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                imageWidget,
                SizedBox(height: 5,),
                Text(description, style: descriptiontext, textAlign: TextAlign.center,),
                PlaceButtons(
                  buttonsPosition,
                  AddButtons(context, buttonsPosition, successText, onSuccessPressed, dismissText, onDismissPressed, backgroundColor, themeColor),
                  buttonsAlignement
                ),

              ],
            ),
            elevation: 10,
          );
        });
  }
}


// Dialog with Widget half in half out the box
class StackAlertBox {
  double dialogRadius;
  Color themeColor, backgroundColor, circleColor;
  String title, description;
  String successText, dismissText;
  Widget imageWidget;
  ButtonsPosition buttonsPosition;
  ButtonsAlignement buttonsAlignement;
  VoidCallback onSuccessPressed, onDismissPressed;

  StackAlertBox({
    this.dialogRadius = 0,
    this.themeColor= Colors.blue,
    this.backgroundColor = Colors.white,
    this.title = "Alert Dialog",
    this.description= "This is an alert dialog !",
    this.circleColor = Colors.transparent,
    this.imageWidget= const Card(color: Colors.transparent,),
    this.successText = "",
    this.onSuccessPressed,
    this.dismissText = "",
    this.onDismissPressed,
    this.buttonsAlignement = ButtonsAlignement.CENTER,
    this.buttonsPosition=ButtonsPosition.HORIZONTAL
  });

  Future show({
    @required BuildContext context,
  }) {
    assert(context != null, "context is null!");
    TextStyle titletext= new TextStyle(fontSize: 26 , fontWeight: FontWeight.w700, color: themeColor);
    TextStyle descriptiontext= new TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.black);
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(dialogRadius),
                ),
                padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(title, style: titletext, textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text(description, style: descriptiontext, textAlign: TextAlign.center,),
                    PlaceButtons(
                      buttonsPosition,
                      AddButtons(context, buttonsPosition, successText, onSuccessPressed, dismissText, onDismissPressed, backgroundColor, themeColor),
                      buttonsAlignement
                    ),
                  ],
                ),
              ),
                Positioned(
                  left: 16,
                  right: 16,
                  child: CircleAvatar(
                    child: imageWidget,
                    backgroundColor: circleColor,
                    radius: 50,
                  ),
                ),
            ],),
          );
        });
  }
}