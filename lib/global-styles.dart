import 'package:flutter/material.dart';

// Dividers
const Divider transparentDivider = Divider(height: 10.0, color: Colors.transparent);
const Divider verticalButtonDivider = Divider(height: 20.0, color: Colors.transparent);
const Divider verticalInputDivider = Divider(height: 20.0, color: Colors.transparent);
const Divider bigTransparentDivider = Divider(height: 80.0, color: Colors.transparent);
const Expanded expandedBottomOfPageDivider =  Expanded( child: Divider(height: 0.9, color: Colors.transparent));

// Modal Styles 
const modalInputPadding = EdgeInsets.all(50.0);
const modalHeaderStyle = TextStyle(color: Colors.red, fontSize: 20);
ButtonStyle modalButtonStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    ),
  minimumSize: const Size(150.0, 45.0)
  
);
ButtonStyle modalButtonCancelStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    color: Color.fromARGB(1, 4, 4, 4)
    ),
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  minimumSize: const Size(150.0, 45.0)
);

// Button Styles
const buttonSize = Size(170.0, 40.0);
ButtonStyle buttonBlueStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 15,
    ),
  backgroundColor: const Color.fromARGB(255, 5, 130, 233),
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
    fontSize: 15
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
    fontSize: 15
    ),
  minimumSize: buttonSize
);

// Input Styles
const inputPadding = EdgeInsets.only(left: 40.0, right: 40.0, top: 5);

// Text Styles
const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);
const TextStyle logoutStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
const TextStyle profileNameHeaderStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 54, 82, 244));
const TextStyle profilePageInfoStyle = TextStyle(fontSize: 16, color: Color.fromARGB(255, 54, 82, 244));

