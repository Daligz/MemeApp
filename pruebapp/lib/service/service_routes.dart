class Routes {

  // Main _url for the connection to the web service
  static const String _url = "localhost:6969";

  // Posts routes
  static String routePostGet(final String category, final int amount) => _url + "/posts/get/$amount/$category";
  static String routePostGetAll(final int amount) => _url + "/posts/get/$amount";

  // Users routes
  static String routeUserInsert(final String mac) => _url + "/users/insert/$mac";

  // Favorites routes
  static String routeFavoriteInsert(final String mac, final String postId) => _url + "/fav/insert/$mac/$postId";
  static String routeFavoriteDelete(final String mac, final String postId) => _url + "/fav/delete/$mac/$postId";
  static String routeFavoriteGet(final String mac, final String postId) => _url + "/fav/get/$mac/$postId";
  static String routeFavoriteGetAll(final String mac) => _url + "/fav/get/$mac";
}