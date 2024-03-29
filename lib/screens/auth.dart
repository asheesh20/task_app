import 'package:flutter/material.dart';
import 'package:task_app/screens/forgot_password.dart';
import 'package:task_app/services/auth_method.dart';
import 'package:task_app/widgets/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;

  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isAuthenticating = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save(); // triggers the onSaved function

    if (_isLogin) {
      // log users in
      try {
        setState(() {
          _isAuthenticating = true;
        });
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 1000),
              backgroundColor: Colors.black,
              content: Center(
                child: Text(
                  'No User found for that email',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )));
          /*setState(() {
            _isAuthenticating = false;
          });*/
        } else if (error.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 100),
              backgroundColor: Colors.black,
              content: Center(
                child: Text(
                  'Wrong Password Provided by User',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )));
          /*setState(() {
            _isAuthenticating = false;
          });*/
        }
        setState(() {
          _isAuthenticating = false;
        });
      }
    } else {
      //signing users in
      try {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _enteredName,
          'email': _enteredEmail,
        });
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 1200),
              backgroundColor: Colors.black,
              content: Center(
                child: Text(
                  'Account already exists',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )));
          /*setState(() {
            _isAuthenticating = false;
          });*/
        } else if (error.code == 'weak-pasword') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 1000),
              backgroundColor: Colors.black,
              content: Center(
                child: Text(
                  'Password is too weak',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          );
          /*setState(() {
            _isAuthenticating = false;
          }); */
        }
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 193, 193),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: 200,
                  child: const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //if (!_isLogin) UserImagePicker(),
                      if (!_isLogin)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            //controller: namecontroller,
                            decoration: InputDecoration(
                              //labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              hintText: 'Username',
                              filled: true,
                            ),
                            enableSuggestions:
                                false, // prevents lines under words
                            autocorrect: false,
                            //textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredName = value!;
                            },
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          //controller: mailcontroller,
                          decoration: InputDecoration(
                            //labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            hintText: 'Email Address',
                            filled: true,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          //controller: passwordcontroller,
                          decoration: InputDecoration(
                            //labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                      ),
                      if (_isLogin)
                        const SizedBox(
                          height: 6,
                        ),
                      if (_isLogin)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword(),
                                  ));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (_isAuthenticating) const CircularProgressIndicator(),
                if (!_isAuthenticating)
                  GestureDetector(
                    onTap: _submit,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          _isLogin ? 'Log In' : 'Sign Up',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or LogIn with',
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          AuthMethod().signInWithGoogle(context);
                        },
                        child: const SquareTile(
                            imagePath: 'assets/images/google.png')),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                        onTap: () {
                          // AuthMethod().signInWithApple();
                        },
                        child: const SquareTile(
                            imagePath: 'assets/images/apple.png')),
                  ],
                ),*/
                const SizedBox(
                  height: 85,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isLogin
                          ? 'Don\'t have an account?'
                          : 'Already have an account?',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (!_isAuthenticating)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin ? 'SignUp' : 'LogIn',
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
