import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/myHomePage.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Chat Lobby App")), body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller = new TextEditingController();
  late FirebaseUser user;

  void click() {
    signInWithGoogle().then((user) => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user.displayName)))
        });
  }

  Widget googleLoginButton() {
    return OutlineButton(
      onPressed: click,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      splashColor: Colors.grey,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage('assets/google_logo.png'),
              height: 35,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Sign in with google',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    )))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}
