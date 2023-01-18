// ignore_for_file: avoid_print
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:layout/global-styles.dart';
import 'package:layout/login/register-page.dart';
import '../../custom-libs/onboarding.api.dart';
import '../../custom-libs/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../custom-libs/profile.api.dart';
import 'profile-info/profile-info.dart';


  Widget _updatePhotoModal(context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Update Profile Picture'),
            onTap: () => {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (BuildContext context) {
                    getCamera();
                    return Center(
                      // heightFactor: 100.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget> [
                          const Padding(
                            padding:  EdgeInsets.only(top: 100),
                            child: Text('Change Profile Picture',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: modalInputPadding,
                            child: Form(
                              key: formKey,
                              child: Column(
                                  children: <Widget>[
                                   const Padding(
                                      padding: EdgeInsets.only(bottom: 30),
                                      child: CircleAvatar(
                                        minRadius: 50,
                                        backgroundImage: NetworkImage('https://final-boss-logos.s3.us-east-2.amazonaws.com/F_Logo.svg'),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 200,
                                    //   height: 200,
                                    //   child: AspectRatio(
                                    //   aspectRatio: userCamera.value.aspectRatio,
                                    //   child: CameraPreview(userCamera),
                                    //   ),
                                    // ),
                                    ElevatedButton(
                                      style: buttonOrangeStyle,
                                      onPressed: () => {
                                        print("Getting Photo..."),
                                      },
                                      child: const Text('Get Photo')),
                                    verticalInputDivider,
                                    TextFormField(
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
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              
                              if (formKey.currentState!.validate()) {
                                // Process data.
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
                      ),
                    );
                  }
                )
            }
          );
  }
  Widget _updateNameModal(context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return 
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Update Name'),
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
                            child: Text('Change Name',
                              style: TextStyle(
                                fontSize: 25,
                              ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Full Name', style: modalHeaderStyle)),
                          Padding(
                            padding: modalInputPadding,
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your First Name',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  verticalInputDivider,
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your Last Name',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  verticalInputDivider,
                                  TextFormField(
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
                          ElevatedButton(
                            style: modalButtonStyle,
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (formKey.currentState!.validate()) {
                                // Process data.
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
                      ),
                    );
                  }
                )
            }
          );
  }
  Widget _updateEmailModal(context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var email = "";
    var newEmail = "";

    final newEmailCTRL = TextEditingController();
    final passwordCTRL = TextEditingController();

    return ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Update Email'),
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
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('email@email.com', style: modalHeaderStyle)),
                          Padding(
                            padding: modalInputPadding,
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                  TextFormField(
                                    onChanged: (text) {
                                      newEmail = text;
                                      print('Email: ${newEmail}');
                                    },
                                    controller: newEmailCTRL,
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
                                  TextFormField(
                                    onChanged: (text) {
                                      password = text;
                                    },
                                    controller: passwordCTRL,
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
                          ElevatedButton(
                            style: modalButtonStyle,
                            onPressed: () {
                              changeEmail(email, newEmail, password);
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (formKey.currentState!.validate()) {
                                // Process data.
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
                      ),
                    );
                  }
                )
            }
          );
  }
  Widget _updatePasswordModal(context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Update Password'),
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
  Widget _logoutModal(context) {
    return ListTile(
            leading: const Icon(Icons.logout, color: Colors.red,),
            title: const Text('Logout', style: logoutStyle,),
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
                            style: modalButtonStyle,
                            onPressed: () => {
                               logout(context)
                            }, 
                            child: const Text('Logout')
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
                          )],
                      ),
                    );
                  }
                )
            }
          );
  }

Map<String, dynamic> profile = {
  'id': '',
  'firstName': '',
  'lastName': '',
  'email': '',
  'profilePicture': '',
  'dateRegistered': '',
};
  
class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // getCamera();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [ 
          Column(
            children: [
              // const Text('Journi Profile', style: profileNameHeaderStyle),
                // Logo
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 50, top: 50),
                  child: Image.asset(
                    'assets/journi_logo.png',
                    semanticLabel: "Journi Logo",
                  ),
                ),
              transparentDivider,
            ],
          ),
          // TODO: Implement Bloc
          // @ https://medium.com/flutter-community/flutter-bloc-for-beginners-839e22adb9f5
          // Need to emit ProfileInfoBloc events from Modals
          // Add Snackbars for profile change updates
          // Loading during updates
          // Add Delete Account API?
          // Add Profile Picture to Register Process
            // * Upload Photo & From
          const ProfileInfoWidget(),
          transparentDivider,
          transparentDivider,
          _updatePhotoModal(context),
          _updateNameModal(context),
          _updateEmailModal(context),
          _updatePasswordModal(context),
          _logoutModal(context)
        ],
      ),
    );
  }
}