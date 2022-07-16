class Post {

  final int id;
  final String image, category;

  Post(this.id, this.image, this.category);

  factory Post.fromJson(final Map<String, dynamic> jsonMap) {
    return Post(
        jsonMap['postid'],
        jsonMap['url'],
        jsonMap['category']
    );
  }
}