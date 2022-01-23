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
          Expanded(child: PostList(posts)),
          TextInputWidget(newPosts)
        ]));
  }
}

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

class PostList extends StatefulWidget {
  List<Post> list_items;

  PostList(this.list_items);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.list_items.length,
      itemBuilder: (context, index) {
        var post = this.widget.list_items[index];
        return Container(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
                    title: Text(post.body), subtitle: Text(post.author))),
            Row(children: <Widget>[
              Container(
                child: Text(post.like_count.toString(),
                    style: const TextStyle(fontSize: 20)),
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () => like(post.likedPost),
                  color: post.userLiked ? Colors.blue : Colors.black)
            ])
          ]),
        );
      },
    );
  }
}
