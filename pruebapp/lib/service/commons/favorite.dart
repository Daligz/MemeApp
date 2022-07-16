class Favorite {

  final int userId, postId;
  final String macAddress, image, category;

  Favorite(this.userId, this.postId, this.macAddress, this.image, this.category);

  factory Favorite.fromJson(final Map<String, dynamic> jsonMap) {
    return Favorite(
        jsonMap['userid'],
        jsonMap['postid'],
        jsonMap['mac'],
        jsonMap['url'],
        jsonMap['category']
    );
  }
}