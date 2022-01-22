import 'package:flutter/material.dart';

void main() {
  print("Hello World");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michaels App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Text("data"); //add text to app
    //return Scaffold(); //Helps give page structure
    return Scaffold(
        appBar: AppBar(title: Text("Hello world")), body: TextInputWidget());
  }
}

/*Class One - Any additional actions outside of build is being performed here
*/
class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

//Class Two - Build Method for TextInputWidget - State<TextInputWidget>
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    //When finished using widget -> delete loose data ==  a cleaner object
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    /* if (text == "!leave") {
      controller.clear();
      text = "left session";
    }
    if (text == "!join") {
      controller.clear();
      text = "joined session";
    } */

    //force widget to reset
  
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message), labelText: "Type a message:"),
      )
    ]);
  }
}
