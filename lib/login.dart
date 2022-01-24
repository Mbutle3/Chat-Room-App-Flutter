import 'package:flutter/material.dart';
import 'package:hello_world/myHomePage.dart';

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
  late String user_name;
  TextEditingController controller = new TextEditingController();

  void click() {
    this.user_name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(this.user_name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
    )
  }
}
