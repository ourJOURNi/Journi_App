import 'package:mockito/mockito.dart';
import '../global-styles.dart';
import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
        ),
        body: const ForgotForm()
    );
    
  }
}

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override 
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          verticalInputDivider,
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            child: Column(
              children: [
                Padding(
                  padding: inputPadding,
                  child: 
                    TextFormField(
                      autofocus: true,
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
                verticalInputDivider,
                ElevatedButton(
                  onPressed: null,
                  style: buttonBlueStyle,
                  child: const Text('Next'),
                ),      
              ],
            ),
          ),
          verticalInputDivider,
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            child: Column(
              children: [
                Padding(
                  padding: inputPadding,
                  child: 
                    TextFormField(
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
                verticalInputDivider,
                ElevatedButton(
                  onPressed: null,
                  style: buttonBlueStyle,
                  child: const Text('Next'),
                ),      
              ],
            ),
          ),
          expandedBottomOfPageDivider,
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: ElevatedButton(
                onPressed: () {},
                style: buttonGreenStyle,
                child: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),
        ],
      ),
    );
  }
}