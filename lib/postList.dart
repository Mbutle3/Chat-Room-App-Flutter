import 'package:flutter/material.dart';
import 'post.dart';

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
