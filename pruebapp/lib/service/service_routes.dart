class Routes {

  // Main url for the connection to the web service
  static const String url = "localhost:6969";

  // Posts routes
  static String routePostGet(final String category, final int amount) => url + "/posts/get/$amount/$category";
  static String routePostGetAll(final int amount) => url + "/posts/get/$amount";

  // Users favorites
  static String routeUsersInsert(final String mac) => url + "/users/insert/$mac";
}