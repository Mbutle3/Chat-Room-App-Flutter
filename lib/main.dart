import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  String body;
  String author;
  int like_count = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likedPost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.like_count += 1;
    } else {
      this.like_count -= 1;
    }
  }
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
          Expanded(child: PostList(this.posts)),
          Expanded(child: Expanded(child: TextInputWidget(this.newPosts)))
        ]));
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

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
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: this.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message),
              labelText: "Type a message:",
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: this.click,
                splashColor: Colors.blue,
                tooltip: "sends a message to chatbox",
              )))
    ]);
  }
}

class PostList extends StatefulWidget {
  final List<Post> list_items;

  PostList(this.list_items);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.list_items.length,
      itemBuilder: (context, index) {
        var post = this.widget.list_items[index];
        return Card(
            child: Row(children: <Widget>[
          Expanded(
              child: ListTile(
            title: Text(post.body),
            subtitle: Text(post.author),
          )),
          Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: post.likedPost,
            )
          ])
        ]));
      },
    );
  }
}
