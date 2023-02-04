import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import '../global-styles.dart';
import '../custom-libs/onboarding.api.dart';
import '../custom-libs/camera.dart';


String firstName = "";
String lastName = "";
String email = "";
String password = "";
File profilePicture = File('');

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
  bool gotPhoto = false;
  File photoFile = File('');

  updatePhoto(File file) {
    print(file);
    setState(() {
      gotPhoto = true;
      profilePicture = file;
      print(profilePicture);
    });
  }

  @override 
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      physics: const NeverScrollableScrollPhysics(),
      
      controller: controller,
      children: <Widget>[

        // Page 1 - Personal Info
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Personal Info', style: TextStyle(fontSize: 18)),
                      Expanded( child: Divider(height: 0, color: Colors.transparent)),
                      CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                      SizedBox(width: 4),
                      CircleAvatar(backgroundColor: Colors.grey, radius: 4,),
                      SizedBox(width: 4),
                      CircleAvatar(backgroundColor: Colors.grey, radius: 4,)
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
        
        // Page 2 - Profile Picture
        Center(
          child: Column(
            children: [
              verticalInputDivider,
              // Pagination
              Padding(
                padding: inputPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                  Text('Profile Picture', style: TextStyle(fontSize: 18)),
                  Expanded( child: Divider(height: 0, color: Colors.transparent)),
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                  SizedBox(width: 4),
                  CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                  SizedBox(width: 4),
                  CircleAvatar(backgroundColor: Colors.grey, radius: 4,)
                ],)
              ),
              const SizedBox(height: 30),
              
              // Photo
              Center(
                child: Padding(
                  padding: inputPadding,
                  child: Container(
                    child: gotPhoto ? 
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(photoFile.path)
                        ) 
                      : CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage('assets/def_profile_pic.jpeg')
                        )
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  // From Photo Gallery
                  ElevatedButton(
                    style: buttonBlueStyle,
                    onPressed: () async => {
                      print('Tapped Get Profile Picture Button from Register Page'),
                      
                      // Get file
                      photoFile = await proPicGallery(),

                      // Pass in Image File
                      updatePhoto(photoFile)
                    }, 
                    child: const Text('Get from Photo Gallery')
                  ),
                  // From Camera
                  ElevatedButton(
                    style: buttonBlueStyle,
                    onPressed: () async => {
                      print('Tapped Get Profile Picture Button from Register Page'),
                      // Get file
                      photoFile = await proPicCamera(),

                      // Pass in Image File
                      updatePhoto(photoFile)
                    }, 
                    child: Text('Get from Camera')
                  ),
                  const SizedBox(height: 40),
                  
                  // Next
                  ElevatedButton(
                    style: buttonGreenStyle,
                    onPressed: () => {
                      controller.jumpToPage(2)
                    }, 
                    child: Text('Next')
                  ),
                  const SizedBox(height: 20),
                  // Back & Skip Buttons
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
        
        // Page 3 - Password
        Center(
          child: Column(
            children: [
              verticalInputDivider,
              Padding(
                padding: inputPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Personal Info', style: TextStyle(fontSize: 18)),
                    Expanded( child: Divider(height: 0, color: Colors.transparent)),
                    CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Colors.blueGrey, radius: 4,)
                ],)
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => {
                  register(firstName, lastName, email, password, 'profilePicture', context, firstNameCTRL, lastNameCTRL, emailCTRL, passwordCTRL)
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