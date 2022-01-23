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
