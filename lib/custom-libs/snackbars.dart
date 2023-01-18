import 'package:flutter/material.dart';


// Response 200
  successSnackBar(context, text) => {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 73, 194, 3),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const Divider(indent: 10),
            Text(text)
          ],
        )
        ),
      )
  };
  // Response 400
  failureSnackBar(context, text) => {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 173, 0, 0),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.priority_high, color: Colors.white),
            const Divider(indent: 10),
            Text(text)
          ],
        )
        ),
      )
  };
  // Response 400
  warningSnackBar(context, text) => {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 231, 103, 29),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.priority_high, color: Colors.white),
            const Divider(indent: 10),
            Text(text)
          ],
        )
        ),
      )
  };
  // Response 400
  infoSnackBar(context, text) => {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 50, 115, 255),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.priority_high, color: Colors.white),
            const Divider(indent: 10),
            Text(text)
          ],
        )
        ),
      )
  };