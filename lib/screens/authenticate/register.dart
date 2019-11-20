import 'package:flutter/material.dart';
import 'package:flutterprojects/services/auth.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();

  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                  ),
                  onChanged: (val) {
                    setState(() => _email = val);
                  },
                  validator: Validators.compose([
                    Validators.required('Please enter email'),
                    Validators.email('Invalid email address'),
                  ]),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your password'),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => _password = val);
                  },
                  validator: Validators.compose([
                    Validators.required('Please enter password'),
                    Validators.patternString(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        'Invalid Password')
                  ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.green[400],
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print(_email);
                          print(_password);
                          //TODO not working. needs repair
                          SnackBar(content: Text('Processing Data'));
                        }
                      },
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                    ),
                    RaisedButton(
                      color: Colors.green[400],
                      onPressed: () async {
                        _formKey.currentState.reset();
                        // clear login and password field
                      },
                      child:
                          Text('Clear', style: TextStyle(color: Colors.white)),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
