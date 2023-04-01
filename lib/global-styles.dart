import 'package:flutter/material.dart';

// Dividers
const Divider transparentDivider = Divider(height: 10.0, color: Colors.transparent);
const Divider verticalButtonDivider = Divider(height: 8.0, color: Colors.transparent);
const Divider verticalInputDivider = Divider(height: 16.0, color: Colors.transparent);
const Divider bigTransparentDivider = Divider(height: 80.0, color: Colors.transparent);
const Expanded expandedBottomOfPageDivider =  Expanded( child: Divider(height: 0.8, color: Colors.transparent));

// Button Styles
const buttonSize = Size(200.0, 40.0);
const buttonSizeSm = Size(60.0, 40.0);

// Modal Styles 
const modalInputPadding = EdgeInsets.all(50.0);
const modalHeaderStyle = TextStyle(color: Color.fromARGB(255, 255, 173, 58), fontSize: 20);
ButtonStyle modalButtonStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    ),
  minimumSize: buttonSize,
  backgroundColor: const Color.fromARGB(240, 19, 119, 200)
);
ButtonStyle modalButtonCancelStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    color: Color.fromARGB(240, 19, 119, 200)
    ),
  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  minimumSize: buttonSize,
);


ButtonStyle buttonBlueStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    ),
  backgroundColor: const Color.fromARGB(240, 19, 119, 200),
  minimumSize: buttonSize
);
ButtonStyle buttonGreenStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15
    ),
  backgroundColor: const Color.fromARGB(255, 76, 147, 9),
  minimumSize: buttonSize
);
ButtonStyle buttonGreyStyle = ElevatedButton.styleFrom(
textStyle: const TextStyle(
    fontSize: 15,
    color: Colors.white
    ),
  backgroundColor: const Color.fromARGB(255, 145, 145, 145),
  minimumSize: buttonSize
);
ButtonStyle buttonOrangeStyle = ElevatedButton.styleFrom(
textStyle: const TextStyle(
    fontSize: 15
    ),
  backgroundColor: Color.fromARGB(255, 221, 125, 0),
  minimumSize: buttonSize
);

ButtonStyle buttonOutlineStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    backgroundColor: Colors.transparent
    ),
    minimumSize: buttonSize
);
ButtonStyle buttonOutlineStyleSM = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    backgroundColor: Colors.transparent
    ),
    minimumSize: buttonSizeSm
);

// Input Styles
const inputPadding = EdgeInsets.only(left: 40.0, right: 40.0, top: 5);

// Text Styles
const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);
const TextStyle logoutStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
const TextStyle profileNameHeaderStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 54, 82, 244));
const TextStyle profilePageInfoStyle = TextStyle(fontSize: 16, color: Color.fromARGB(255, 54, 82, 244));

