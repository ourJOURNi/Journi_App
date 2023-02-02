import 'package:flutter/material.dart';
import '../global-styles.dart';
import '../custom-libs/onboarding.api.dart';
import '../custom-libs/camera.dart';

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
  final GlobalKey<FormState> _infoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final firstNameCTRL = TextEditingController();
  final lastNameCTRL = TextEditingController();
  final emailCTRL = TextEditingController();
  final passwordCTRL = TextEditingController();
  int _index = 0;

  @override 
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      physics: const NeverScrollableScrollPhysics(),
      
      controller: controller,
      children: <Widget>[

        // Page 1
        Center(
          child: Form(
            key: _infoFormKey,
            child:
            Column(
              children: <Widget>[
                verticalInputDivider,
                Padding(
                  padding: inputPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Colors.grey[400], radius: 4,),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Colors.grey[400], radius: 4,)
                  ],)
                ),
                verticalInputDivider,
                Padding(
                  padding: inputPadding,
                  child: 
                    TextFormField(
                      autofocus: true,
                      controller: firstNameCTRL,
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.next,
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
                expandedBottomOfPageDivider,
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.jumpToPage(1);
                      },
                      style: buttonGreenStyle,
                      child: const Text('Next', style: TextStyle(fontSize: 16)),
                    ),
                ),
              ],
            ),
            )
          ),
        
        // Page 2
        Center(
          child: Column(
            children: [
              verticalInputDivider,
              Padding(
                padding: inputPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                  SizedBox(width: 4),
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                  SizedBox(width: 4),
                  CircleAvatar(backgroundColor: Colors.grey[400], radius: 4,)
                ],)
              ),
              SizedBox(height: 30),
              Center(
                child: Padding(
                  padding: inputPadding,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueGrey,
                  )
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    style: buttonBlueStyle,
                    onPressed: () => {
                      print('Tapped Get Profile Picture Button from Register Page'),
                      proPicGallery()
                    }, 
                    child: Text('Get from Photo Gallery')
                  ),
                  ElevatedButton(
                    style: buttonBlueStyle,
                    onPressed: () => {
                      print('Tapped Get Profile Picture Button from Register Page'),
                      proPicCamera()
                    }, 
                    child: Text('Get from Camera')
                  ),
                  ElevatedButton(
                    style: buttonGreenStyle,
                    onPressed: () => {
                      controller.jumpToPage(2)
                    }, 
                    child: Text('Next')
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => {
                        controller.jumpToPage(0) 
                      }, 
                        child: Text('Back')
                      ),
                      SizedBox(width: 4),
                      ElevatedButton(
                        onPressed: () => {
                          // TODO: Add Skip Logic
                          controller.jumpToPage(2) 
                        }, 
                        child: Text('Skip')
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        
        // Page 3
        Center(
          child: Column(
            children: [
              verticalInputDivider,
              Padding(
                padding: inputPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                  SizedBox(width: 4),
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                  SizedBox(width: 4),
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,)
                ],)
              ),
              SizedBox(height: 50),
              Padding(
                  padding: inputPadding,
                  child: 
                    TextFormField(
                      controller: passwordCTRL,
                      onChanged: (text) {
                        email = text;
                        print('Password: ${password}');
                      },
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye)
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => {
                  register(firstName, lastName, email, password, context, firstNameCTRL, lastNameCTRL, emailCTRL, passwordCTRL)
                  .then((value) => {
                    firstName = "",
                    lastName = "",
                    email = "",
                    password = "",
                  })
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Complete Sign Up')
                    ),
              ElevatedButton(
                 onPressed: () => {
                   controller.jumpToPage(1) 
                 }, 
                 child: Text('Back')
              )
            ]
          )
        ),
      ],
    );
    
  }
}