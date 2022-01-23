import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  const TextInputWidget(this.callback, {Key? key}) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message),
              labelText: "Type a message:",
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: click,
                splashColor: Colors.blue,
                tooltip: "sends a message to chatbox",
              )))
    ]);
  }
}
