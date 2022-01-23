import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPosts(String text) {
    this.setState(() {
      posts.add(new Post(text, "Author"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Chat Lobby App")),
        body: Column(children: <Widget>[
          Expanded(child: PostList(posts)),
          TextInputWidget(newPosts)
        ]));
  }
}
