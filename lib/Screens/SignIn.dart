import 'package:flutter/material.dart';
import 'package:esi_absence/Screens/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esi_absence/globals.dart';
import 'package:esi_absence/globals.dart' as globals;
// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  static String id = 'sign-in';
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenue dans ESI Absence',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (newEmail) {
                      _email = newEmail;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      errorStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                     onSaved: (newPass) {
                      _password = newPass;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      errorStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      _formKey.currentState.save();
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomepageScreen.id);
                          globals.idUser=user.user.uid;
                          
                          print(idUser.toString());
                        }
                      } catch (e) {
                        print(e);
                           
                      }
                    },
                    child: Text(
                      'Se connecter',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
