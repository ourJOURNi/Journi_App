import 'package:flutter/material.dart';
import '../global-styles.dart';
import '../custom-libs/onboarding.api.dart';

String firstName = "";
String lastName = "";
String email = "";
String password = "";

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firstNameCTRL = TextEditingController();
  final lastNameCTRL = TextEditingController();
  final emailCTRL = TextEditingController();
  final passwordCTRL = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          verticalInputDivider,
          Padding(
            padding: inputPadding,
            child: 
              TextFormField(
                autofocus: true,
                controller: firstNameCTRL,
                onChanged: (text) {
                  firstName = text;
                  print('First Name: ${firstName}');
                },
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
          ),
          Padding(
            padding: inputPadding,
            child: 
              TextFormField(
                controller: lastNameCTRL,
                onChanged: (text) {
                  lastName = text;
                  print('Last Name: ${lastName}');
                },
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
          ),
          Padding(
            padding: inputPadding,
            child: 
              TextFormField(
                controller: emailCTRL,
                onChanged: (text) {
                  email = text;
                  print('Email: ${email}');
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
          ),
          Padding(
            padding: inputPadding,
            child: 
              TextFormField(
                controller: passwordCTRL,
                onChanged: (text) {
                  password = text;
                  print('Password ${password}');
                },
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
          ),
          expandedBottomOfPageDivider,
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  register(firstName, lastName, email, password, context, firstNameCTRL, lastNameCTRL, emailCTRL, passwordCTRL)
                    .then((value) => {
                      firstName = "",
                      lastName = "",
                      email = "",
                      password = "",
                    });
                  
                },
                style: buttonGreenStyle,
                child: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),
        ],
      ),
    );
  }
}