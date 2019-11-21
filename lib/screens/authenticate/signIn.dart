import 'package:flutter/material.dart';
import 'package:flutterprojects/services/auth.dart';
import 'package:flutterprojects/shared/loading.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  //text field state
  String _email = '';
  String _password = '';
  String _error = '';
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              title: Text('Sign in'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
              ],
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
                      ]),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Enter your password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => _password = val);
                      },
                      validator: Validators.compose([
                        Validators.required('Please enter password'),
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
                              setState(() => _loading = true);
                              dynamic result =
                                  await _authService.signInWithEmailAndPassword(
                                      _email, _password);
                              if (result == null) {
                                setState(() {
                                  _error =
                                      'could not sign in with those credentials';
                                  _loading = false;
                                });
                              }
                            }
                          },
                          child: Text('Sign In',
                              style: TextStyle(color: Colors.white)),
                        ),
                        RaisedButton(
                          color: Colors.green[400],
                          onPressed: () async {
                            // clear login and password field
                            _formKey.currentState.reset();
                          },
                          child: Text('Clear',
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
