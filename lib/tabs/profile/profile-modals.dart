import 'dart:io';

import 'package:flutter/material.dart';
import 'package:layout/global-styles.dart';
import 'package:layout/login/login-page.dart';
import 'package:layout/login/register-page.dart';
import '../../custom-libs/profile.api.dart';
import '../../custom-libs/onboarding.api.dart';
import './../../custom-libs/camera.dart';


class UpdateProfilePicWidget extends StatefulWidget {
  const UpdateProfilePicWidget({super.key, required this.currentProfilePic});
  final String currentProfilePic;

  @override
  State<UpdateProfilePicWidget> createState() => _UpdateProfilePicWidgetState();
}

class _UpdateProfilePicWidgetState extends State<UpdateProfilePicWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool gotUpdatedPhoto = false;
  File updatedProfilePicture = File('');
  String email = '';
  String password = '';
  TextEditingController updatePhotoPasswordCTRL = TextEditingController();

  resetPhoto() {
    setState(() {
      gotUpdatedPhoto = false;
      updatePhotoPasswordCTRL.clear();
    });
  }

  void updatePhoto(File file) {
    print(file);
    setState(() {
      gotUpdatedPhoto = true;
      updatedProfilePicture = file;
      print(updatedProfilePicture);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
            const Padding(
              padding:  EdgeInsets.only(top: 100),
              child: Text('Change Profile Picture',
                style: TextStyle(
                fontSize: 25,
              ),
              ),
            ),
            const SizedBox(height: 40),
            !gotUpdatedPhoto ? 
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(widget.currentProfilePic)
                        ) 
                      : CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(updatedProfilePicture.path)
                        ),
            Padding(
              padding: modalInputPadding,
              child: Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: buttonOrangeStyle,
                      onPressed: () async => {
                        print("Getting Photo..."),
                        // Get file
                        updatedProfilePicture = await proPicGallery(),

                        // Pass in Image File
                        updatePhoto(updatedProfilePicture)

                        // // Pass in Image File
                        // updatePhoto(updatePhotoFile)
                      },
                      child: const Text('Get Photo')),
                    verticalInputDivider,
                    TextFormField(
                      onChanged: (e) => {
                        print(e),
                        password = e
                      },
                      controller: updatePhotoPasswordCTRL,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                ],
              ),
            )
          ),
            ElevatedButton(
            style: modalButtonStyle,
            onPressed: () async {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
              if(gotUpdatedPhoto) {
                await updateProfilePicture(loginEmail, password, updatedProfilePicture, context, updatePasswordPasswordCTRL);
                await resetPhoto();
              }
            },
            child: const Text('Submit'),
          ),
            verticalButtonDivider,
            ElevatedButton(
              style: modalButtonCancelStyle,
              onPressed: () => {
                Navigator.pop(context)
              }, 
              child: const Text('Cancel', style: TextStyle(
                color: Colors.black87)
                )
            )
    ],
  );
  }

  // ···
}

  Widget updatePhotoModal(context, blocContext, currentProfilePic) {

    // File updatePhotoFile = currentProfilePic;
    
    return ListTile(
      leading: const Icon(Icons.camera_alt, color: Color.fromARGB(129, 82, 163, 255)),
      trailing: const Icon(Icons.arrow_right, color: Color.fromARGB(36, 19, 119, 200)),
      title: const Text('Update Profile Picture'),
      onTap: () => {
         showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (BuildContext context) {
             // getCamera();
             return UpdateProfilePicWidget(currentProfilePic: currentProfilePic);
            }
          )
       }
    );
  }
  
  var newFirstName = "";
  var newLastName = "";
  var updateNamePassword = "";
  var firstNameCTRL = TextEditingController();
  var lastNameCTRL = TextEditingController();
  var updateNamePasswordCTRL = TextEditingController();

  Widget updateNameModal(context, blocContext, email, currentFirstName, currentLastName) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return 
          ListTile(
            leading: const Icon(Icons.info, color: Color.fromARGB(129, 82, 163, 255)),
            trailing: const Icon(Icons.arrow_right, color: Color.fromARGB(36, 19, 119, 200)),
            title: const Text('Update Name'),
            onTap: () => {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) {
                    return Center(
                      heightFactor: 90.0,
                      child: Column(
                        children: <Widget> [
                          const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text('Change Name',
                              style: TextStyle(
                                fontSize: 25,
                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text('$currentFirstName $currentLastName', style: modalHeaderStyle)),
                          Padding(
                            padding: modalInputPadding,
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[

                                  // First Name
                                  TextFormField(
                                    controller: firstNameCTRL,
                                    onChanged: (text) => {
                                      newFirstName = text,
                                      print(newFirstName),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      // focusColor: Color.fromARGB(240, 19, 119, 200),
                                      hintText: 'First name',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  verticalInputDivider,

                                  // Last Name
                                  TextFormField(
                                    controller: lastNameCTRL,
                                    onChanged: (text) => {
                                      newLastName = text,
                                      print(newLastName),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Last Name',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  verticalInputDivider,

                                  // Password
                                  TextFormField(
                                    controller: updateNamePasswordCTRL,
                                    onChanged: (text) => {
                                      updateNamePassword = text,
                                      print(newLastName),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  )
                                ],
                              ),
                            )
                          ),

                          // Submit Button
                          ElevatedButton(
                            style: modalButtonStyle,
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              print('Attempting to Update Name');
                              
                              // Detect if any inputs were untouched
                              if(newFirstName == "") {
                                newFirstName = currentFirstName;
                              }
                              if(newLastName == "") {
                                newLastName = currentLastName;
                              }
                              updateName(context, blocContext, email, newFirstName, newLastName, updateNamePassword, firstNameCTRL, lastNameCTRL, updateNamePasswordCTRL);
                              if (formKey.currentState!.validate()) {
                                // Process data.
                              }
                            },
                            child: const Text('Submit'),
                          ),
                          verticalButtonDivider,

                          // Cancel Button
                          ElevatedButton(
                            style: modalButtonCancelStyle,
                            onPressed: () => {
                              Navigator.pop(context)
                            }, 
                            child: const Text('Cancel', style: TextStyle(
                              color: Colors.black87)
                              )
                          )
                        ],
                      ),
                    );
                  }
                )
            }
          );
  }
  
  var newEmail = "";
  var emailPassword = "";
  var newEmailCTRL = TextEditingController();
  var updateEmailPasswordCTRL = TextEditingController();
  Widget updateEmailModal(context, state, currentEmail) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return ListTile(
            leading: const Icon(Icons.email, color: Color.fromARGB(129, 82, 163, 255)),
            title: const Text('Update Email'),
            trailing: const Icon(Icons.arrow_right, color: Color.fromARGB(36, 19, 119, 200)),
            onTap: () => {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) {
                    return Center(
                      heightFactor: 100.0,
                      child: Column(
                        children: <Widget> [
                          const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text('Change Email',
                              style: TextStyle(
                                fontSize: 25,
                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text('$currentEmail', style: modalHeaderStyle)),
                          Padding(
                            padding: modalInputPadding,
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                  // New Email
                                  TextFormField(
                                    controller: newEmailCTRL,
                                    onChanged: (text) => {
                                      newEmail = text,
                                      print(newEmail),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your new Email',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  verticalInputDivider,
                                  // Password
                                  TextFormField(
                                    controller: updateEmailPasswordCTRL,
                                    onChanged: (text) => {
                                      emailPassword = text,
                                      print(emailPassword),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  )
                                ],
                              ),
                            )
                          ),

                          // Submit Button
                          ElevatedButton(
                            style: modalButtonStyle,
                            onPressed: () {
                              // updateEmail(email, newEmail, password);
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (formKey.currentState!.validate()) {
                                // Process data.
                              }
                              
                              // Detect if any inputs were untouched
                              if(newEmail == "") {
                                print('No new email enterted!');
                                return;
                              }
                              updateEmail(context, state, currentEmail, newEmail, emailPassword, newEmailCTRL, updateEmailPasswordCTRL);
                              if (formKey.currentState!.validate()) {
                                // Process data.
                              }
                            },
                            child: const Text('Submit'),
                          ),
                          verticalButtonDivider,

                          // Cancel Button
                          ElevatedButton(
                            style: modalButtonCancelStyle,
                            onPressed: () => {
                              Navigator.pop(context)
                            }, 
                            child: const Text('Cancel', style: TextStyle(
                              color: Colors.black87)
                              )
                          )
                        ],
                      ),
                    );
                  }
                )
            }
          );
  }
  
  var newPassword = "";
  var oldPassword = "";
  var oldPasswordPasswordCTRL = TextEditingController();
  var updatePasswordPasswordCTRL = TextEditingController();
  Widget updatePasswordModal(context, blocContext, currentEmail) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return ListTile(
            leading: const Icon(Icons.lock, color: Color.fromARGB(129, 82, 163, 255)),
            title: const Text('Update Password'),
            trailing: const Icon(Icons.arrow_right, color: Color.fromARGB(36, 19, 119, 200)),
            onTap: () => {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) {
                    return Center(
                      heightFactor: 100.0,
                      child: Column(
                        children: <Widget> [
                          const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text('Change Password',
                              style: TextStyle(
                                fontSize: 25,
                              ),),
                          ),
                          Padding(
                            padding: modalInputPadding,
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                  TextFormField(
                                    controller: updatePasswordPasswordCTRL,
                                    onChanged: (text) => {
                                      newPassword = text,
                                      print(newPassword),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your new Password',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  verticalButtonDivider,
                                  TextFormField(
                                    controller: oldPasswordPasswordCTRL,
                                    onChanged: (text) => {
                                      oldPassword = text,
                                      print(text),
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your current Password',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  
                                ],
                              ),
                            )
                          ),
                          ElevatedButton(
                          style: modalButtonStyle,
                          onPressed: () {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (formKey.currentState!.validate()) {
                              // Process data.
                            }
                            updatePassword(context, blocContext, currentEmail, oldPassword, newPassword, oldPasswordPasswordCTRL, updatePasswordPasswordCTRL);

                          },
                          child: const Text('Submit'),
                        ),
                          verticalButtonDivider,         
                          ElevatedButton(
                            style: modalButtonCancelStyle,
                            onPressed: () => {
                              Navigator.pop(context)
                            }, 
                            child: const Text('Cancel', style: TextStyle(
                              color: Colors.black87)
                              )
                            )
                        ],
                      ),
                    );
                  }
                )
            }
          );
  }
  
  Widget logoutModal(context) {
    return ListTile(
            leading: const Icon(Icons.logout, color: Color.fromARGB(255, 255, 173, 58)),
            title: const Text('Logout', style: TextStyle(color: Color.fromARGB(255, 248, 145, 0), fontSize: 18)),
            trailing: const Icon(Icons.arrow_right, color: Color.fromARGB(36, 19, 119, 200)),
            onTap: () => {
              showModalBottomSheet(
                context: context, 
                builder: (BuildContext context) {
                    return Center(
                      heightFactor: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          const Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 50.0,
                            ),
                          const Padding(
                            padding: EdgeInsets.only(top: 45, bottom: 15),
                            child: Text('Are you sure you want to logout?', 
                              style: TextStyle(
                                fontSize: 18,
                              ),),
                          ),
                          ElevatedButton(
                            style: buttonOrangeStyle,
                            onPressed: () => {
                               logout(context)
                            }, 
                            child: const Text('Logout')
                          ),
                          verticalButtonDivider,
                          ElevatedButton(
                            style: buttonGreyStyle,
                            onPressed: () => {
                              Navigator.pop(context)
                            }, 
                            child: const Text('Cancel', style: TextStyle(
                              color: Colors.black87)
                              )
                          )],
                      ),
                    );
                  }
                )
            }
          );
  }
