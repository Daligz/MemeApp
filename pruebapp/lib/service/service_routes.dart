class Routes {

  // Main url for the connection to the web service
  static const String url = "localhost:6969";

  // Posts routes
  static String routePostGet(final String category, final int amount) => url + "/posts/get/$amount/$category";
  static String routePostGetAll(final int amount) => url + "/posts/get/$amount";

  // Users routes
  static String routeUserInsert(final String mac) => url + "/users/insert/$mac";

  // Favorites routes
  static String routeFavoriteInsert(final String mac, final String postId) => url + "/fav/insert/$mac/$postId";
  static String routeFavoriteDelete(final String mac, final String postId) => url + "/fav/delete/$mac/$postId";
  static String routeFavoriteGet(final String mac, final String postId) => url + "/fav/get/$mac/$postId";
  static String routeFavoriteGetAll(final String mac) => url + "/fav/get/$mac";
}