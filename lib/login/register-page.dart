import 'package:flutter/material.dart';
import 'package:layout/custom-libs/snackbars.dart';
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
  bool _viewPassword = true;

  bool gotPhoto = false;
  File photoFile = File('');

  void updatePhoto(File file) {
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PageView(
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
                      Text('Personal Info', style: TextStyle(fontSize: 18, color: Color.fromARGB(240, 19, 119, 200), fontWeight: FontWeight.bold)),
                      Expanded( child: Divider(height: 0, color: Colors.transparent)),
                      CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 173, 58), radius: 4,),
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
                GestureDetector(
                  onTap: null,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        if(
                          firstNameCTRL.value.text.isEmpty || 
                          lastNameCTRL.value.text.isEmpty || 
                          emailCTRL.value.text.isEmpty 
                        ) {
                          failureSnackBar(context, 'Please fill out all fiels.');
                          return;

                        } else {

                          // Closes Keyboard
                          FocusScope.of(context).unfocus();
                          controller.jumpToPage(1);
                        }
                        
                      },
                      style: buttonGreenStyle,
                      child: const Text('Next', style: TextStyle(fontSize: 16)),
                    ),
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
                    Text('Profile Picture', style: TextStyle(fontSize: 18, color: Color.fromARGB(240, 19, 119, 200), fontWeight: FontWeight.bold)),
                    Expanded( child: Divider(height: 0, color: Colors.transparent)),
                    CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 173, 58), radius: 4),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 173, 58), radius: 4),
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

              // Buttons
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
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.photo_album_outlined)),
                          WidgetSpan(child: SizedBox(width: 10)),
                          TextSpan(text: 'Gallery'),
                        ],
                      ),
                    )
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
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.camera_alt_outlined)),
                          WidgetSpan(child: SizedBox(width: 10)),
                          TextSpan(text: 'Camera'),
                        ],
                      ),
                    )
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
                      OutlinedButton(
                        style: buttonOutlineStyleSM,
                        onPressed: () => {
                        controller.jumpToPage(0) 
                      }, 
                        child: const Text('Back')
                      ),
                      const SizedBox(width: 4),
                      OutlinedButton(
                        style: buttonOutlineStyleSM,
                        onPressed: () => {
                          // TODO: Add Skip Logic
                          controller.jumpToPage(2) 
                        }, 
                        child: const Text('Skip')
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
                    Text('Personal Info', style: TextStyle(fontSize: 18, color: Color.fromARGB(240, 19, 119, 200), fontWeight: FontWeight.bold)),
                    Expanded( child: Divider(height: 0, color: Colors.transparent)),
                    CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 173, 58), radius: 4,),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 173, 58), radius: 4,),
                    SizedBox(width: 4),
                    CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 173, 58), radius: 4,)
                ],)
              ),
              const SizedBox(height: 50),
              Padding(
                  padding: inputPadding,
                  child: 
                    TextFormField(
                      controller: passwordCTRL,
                      onChanged: (text) {
                        password = text;
                        print('Password: ${password}');
                      },
                      obscureText: _viewPassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: SizedBox(
                          height: 40,
                          width: 40,
                          child: GestureDetector(
                            onTap: () => {
                              setState(() => {
                               print('Viewing Password'),
                               _viewPassword = !_viewPassword
                             })
                            },
                            child: const Icon(Icons.remove_red_eye),
                          ),
                        )
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
                  
                  if(passwordCTRL.value.text.isEmpty) {
                    failureSnackBar(context, 'Please fill out all fiels.')
                  },

                  register(firstName, lastName, email, password, profilePicture, context, firstNameCTRL, lastNameCTRL, emailCTRL, passwordCTRL)
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
    ),
    );
  }
}