# Flutter UI Package

A beautiful package for most used UI components, fully customizable .

The code is **100% Dart** and everything resides in the [/lib](/lib) folder.

# Installation

In the ``dependencies`` section of your ``pubspec.yaml`` add the following line :

```yaml
dependencies:
    flutteruipackage: 1.0.0
```

You can also reference the git repo directly if you want:

```yaml
dependencies:
    flutteruipackage:
        git: git://github.com/choubari/flutter_ui_package.git
```

Then run ``flutter packages get`` .


## Usage 

**Import this class :**

```dart
import 'package:flutteruipackage/flutteruipackage.dart';
```



## Example Project

There is a detailled example project in the ``example`` folder. You can directly run and play on it. There are code snippets from example project below.


## Table of Content :

* [Buttons](#buttons-)
    * [Filled Buttons](#filledbutton)
    * [Outlined Buttons](#outlinedbutton)
    * [Raised Buttons](#raisedbutton)

* [Alert Dialogs](#alert-dialogs-)
    * [Basic Alert Dialog](#basicalertbox)
    * [Stack Alert Dialog](#stackalertbox)

* [Input Field](#input-fields-)

* [Dropdowns](#dropdowns-)
    * [Material Dropdown](#materialdropdown)
    * [Classic Dropdown](#classicdropdown)
    * [Material Popup](#materialpopup)
    * [Dots Menu](#dotsmenu)
    * [Awesome Menu](#awesomemenu)




## Buttons :

Every type of button support text content with or without icon. The buttons are fully customizable, you can play with textStyle, alignment, width, height, icon color, space between icon and text, and much more ... 


#### FilledButton 

<img src="/screenshots/BFilled.png" align = "right" height = "250" alt="filled button flutter">

```dart 
BFilled(
    width: 200,
    height: 50,
    text: "LOGIN WITH FACEBOOK",
    textStyle: text,
    backgroundColor: Color(0xff2872ba),
),

BFilled(
    width: 200,
    height: 50,
    text: "Button",
    radius: 30,
    alignment: Position.LEFT, // align content to left
    textStyle: text,
    backgroundColor: Colors.blue,
),
//with an icon
BFilled(
    width: 200,
    height: 50,
    icon: Icons.subscriptions,
    iconSize: 20,
    icontextSpace: 30,
    text: "Subscribe Now",
    backgroundColor: Colors.red,
    onPressed: () {}, // set an action to start after pressing 
),
```

<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

#### OutlinedButton 

<img src="/screenshots/BOutlined.png" align = "left" height = "190" alt="outlined button flutter">

```dart 
BOutlined(
    width: 200,
    height: 50,
    text: "SAVE TO PLAYLIST",
    backgroundColor: Colors.blueGrey[50],
    outlineColor: Colors.red,
    onPressed: () {},
),
BOutlined(
    width: 200,
    height: 50,
    icon: Icons.done,
    iconSize: 20,
    iconColor: Colors.green,
    text: "ADD TO FAVORITES",
    textStyle: textstyle,
    outlineColor: Colors.green,
    onPressed: () {},
),
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

#### RaisedButton

<img src="/screenshots/BRaised.png" align = "right" height = "200" alt="raised button flutter">

```dart 
BRaised(
    width: 210,
    height: 50,
    text: "LOGIN",
    backgroundColor: Colors.orange,
    shadowColor: Colors.lightBlue[200],
    shadowOffset: Offset(2,2),
    spreadRadius: 1,
    blurRadius: 1,
    onPressed: () {},
),
BRaised(
    width: 210,
    height: 50,
    text: "CREATE ACCOUNT",
    icon: Icons.person,
    iconColor: Colors.white,
    iconSize: 25,
    icontextSpace: 5,
    backgroundColor: Colors.lightBlue,
    shadowColor: Colors.orange[200],
    shadowOffset: Offset(0,2),
    spreadRadius: 1,
    blurRadius: 7,
    onPressed: () {},
),
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>


## Alert Dialogs :

To create an alert dialog, you need to instantiate a new object and call the show method. There are two types of alert dialogs : BasicAlertBox and StackAlertBox. The main difference is that the second one contains a widget (image, icon ..) that pops up from the canva of the dialog while on the first dialog, the widget is inserted between the title and the description .

A dialog can contain zero, one or two buttons. If you don't want a button on your dialog ignore _successText, dismissTest, onSucceessPressed and onDismissPressed_ , but if you want just one button, you can choose between a filled or an outlined button. The _successText_ parameter allows you to have a filled button and the _dismissText_ parameter shows an outlined button. To configure their colors, modify _themeColor_ . Don't forget to fill _onSuccessPressed_ or _onDismissPressed_ when you add a success or dismiss button.  

When you are using one button on a dialog you can modify _buttonsAlignement_ to align it on LEFT, RIGHT or CENTER. Check it on the last example. 

#### BasicAlertBox

<img src="/screenshots/nobuttonDialog.png" align = "right" height = "170" alt="alert dialog flutter">

```dart 
BasicAlertBox(
    themeColor: Colors.indigo,
    backgroundColor: Colors.tealAccent[100],
    title: "Alert Dialog",
    description: "This is a dialog with no button",
    dialogRadius: 10,
    buttonsWidth: 50,
).show(context: context);
```

<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

For a two buttons dialog, you can choose their alignements : **Horizontally** or **Vertically** .

<img src="/screenshots/horizontalbuttonsDialog.png" align = "left" height = "350" alt="alert dialog flutter">

```dart 
BasicAlertBox(
    imageWidget: //this widget will be placed between title and description 
        Image.network(
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
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>
<img src="/screenshots/verticalbuttonsDialog.png" align = "right" height = "250" alt="alert dialog flutter">

```dart 
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
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

#### StackAlertBox

The second type is a StackAlertBox, you can modify the _circleColor_ parameter to appear or ignore it to have a popup widget instead.

<img src="/screenshots/stackAlert1.png" align = "left" height = "300" alt="alert dialog flutter">

```dart 
StackAlertBox(
    dialogRadius: 15,
    buttonsWidth: 150,
    themeColor: Colors.blue,
    backgroundColor: Colors.white,
    circleColor: Colors.blue,
    title: "Alert Box",
    description: "A Stack Dialog with a custom widget inside the circle above.",
    imageWidget:
        Icon(
            Icons.warning,
            color: Colors.white,
            size: 70,
        ),
    successText: "OK",
    dismissText: "CANCEL",
    buttonsPosition: ButtonsPosition.VERTICAL,
).show(context: context);
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>
<img src="/screenshots/stackAlert2.png" align = "right" height = "290" alt="alert dialog flutter">

```dart 
//a dialog with popup png image from network
StackAlertBox( 
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
```

<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

## Input Fields :

<img src="/screenshots/Entry.png" align = "right" height = "150" alt="input field flutter">

```dart 
Entry(
    title: "Username",
    hint: "username",
    isPassword: false,
    outlineColor: Colors.blue,
    radius: 0,
    outlineThikness: 1,
    cursorColor: Colors.orange,
    inputStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
),
Entry(
    title: "Password",
    hint: "********",
    isPassword: true,
    outlineColor: Colors.blueGrey,
    radius: 10,
    outlineThikness: 2,
),
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

## Dropdowns :

To add items to your dropdown, you fill the _list_ field with an array of Item. Each item can contain a text and/or an icon.

#### MaterialDropdown

The MaterialDropdown class is a simple copy of dropdown from Material, but it isn't customizable too much. Also, the menu doesn't appear below the dropdown button. 


<img src="/screenshots/Materialdropdown.png" align = "left" height = "50" alt="dropdown flutter">

<br/>

```dart 
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
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

#### ClassicDropdown

I created ClassicDropdown that allows you to list items and appear under the button based on this [stackoverflow answer.](https://stackoverflow.com/a/59859741/12802591).

<img src="/screenshots/ClassicDropdown.png" align = "right" height = "250" alt="dropdown flutter">

```dart 
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
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/> 

#### MaterialPopup

This a customizable button with a popup menu. The items are an array of Strings.

<img src="/screenshots/MaterialPopup.png" align = "left" height = "150" alt="dropdown flutter">

<br/>

```dart 
MaterialPopup(  
    text: 'Choose a number',
    width: 160,
    height: 50,
    offset: Offset(50,50), //to align the position of the popup
    borderRadius: 5,
    backgroundColor: Colors.blueGrey[50],
    outlineColor: Colors.blue,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue) ,
    items: ["One","Two", "Three"],
),
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

#### DotsMenu

This dots dropdown menu is fully customizable. You can change dots color, alignment. Also the width, height, border radius, the background and outline color of the menu. 
You can add items and change color of icons and style of texts. Note: the list of items is scrollable.

<img src="/screenshots/DotsMenu.png" align = "right" height = "330" alt="dropdown flutter">

```dart 
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
    dots: Dots.HORIZONTAL, // dots alignment
    borderRadius: 5,
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    iconColor: Colors.white,
    outlineColor: Colors.black,
    backgroundColor: Colors.red,
    onChange: (index) { // action triggered when an item is pressed
        print(index); //action setted when an item is chosen
    },
),
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

#### AwesomeMenu

This is the last dropdown. You can replace the bell icon and customize the items and the menu.

<img src="/screenshots/AwesomeMenu.png" align = "right" height = "250" alt="dropdown flutter">

```dart 
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
```
<br/>
<div align="right">
    <b><a href="#table-of-content-">↥ back to top</a></b>
</div>
<br/>

## License :

```
Copyright (c) 2020 Kawtar Choubari
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
