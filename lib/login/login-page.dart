import '../global-styles.dart';
import 'package:flutter/material.dart';
import 'forgot-pass-page.dart';
import '../custom-libs/onboarding.api.dart';

String loginEmail = "";
String loginPassword = "";


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override

  Widget build(BuildContext context) {
  final loginEmailCTRL = TextEditingController();
  final passwordCTRL = TextEditingController();

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                // Logo
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 10, top: 100),
                  child: Image.asset(
                    'assets/journi_logo.png',
                    semanticLabel: "Journi Logo",
                  )
                ),
                const LoginForm(),
                verticalButtonDivider,
                verticalButtonDivider,
                // Login
                ElevatedButton(
                  style: buttonBlueStyle,
                  onPressed: () => {
                      login(loginEmail, loginPassword, context, loginEmailCTRL, passwordCTRL)
                        .then((value) => {
                          print('From Login Button'),
                          print(loginEmail),
                          print('----'),
                          
                        })
                      
                  }, 
                  child: const Text('Login')
                ),
                verticalButtonDivider,
                // Forgot
                OutlinedButton(
                  style: buttonOutlineStyle,
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    )
                  }, 
                  child: const Text('Forgot Password')
                ),
                expandedBottomOfPageDivider,
                // Sign Up
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    style: buttonOrangeStyle,
                    child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          )
        ]    
      ),
    );
  } 
}




class LoginForm extends StatefulWidget  {
  const LoginForm({super.key});
  
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>  {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: inputPadding,
            child: 
              TextFormField(
                onChanged: (text) {
                  loginEmail = text;
                  print('Email: ${loginEmail}');
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_rounded),
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
                onChanged: (text) {
                  loginPassword = text;
                  print('Password: ${loginPassword}');
                },
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return loginPassword;
                },
              ),
          )
        ],
      ),
        
    );
  }
}