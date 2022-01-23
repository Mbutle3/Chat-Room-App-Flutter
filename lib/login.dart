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
        child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: this.controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.black)),
                  labelText: "Enter Username:",
                  suffixIcon: IconButton(
                      icon: Icon(Icons.check_box),
                      splashColor: Colors.blue,
                      tooltip: "sends a message to chatbox",
                      onPressed: this.click),
                ))));
  }
}
