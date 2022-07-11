package me.upp.daligz.service;

import com.google.gson.Gson;
import me.upp.daligz.service.database.Connector;
import me.upp.daligz.service.database.structures.FavoriteStructure;
import me.upp.daligz.service.database.structures.PostStructure;
import me.upp.daligz.service.database.structures.UserStructure;
import spark.Spark;

public class Service {

    public static void main(final String[] args) {
        final Gson gson = new Gson();
        final Connector connector = new Connector();
        Spark.port(6969);

        // Posts
        final PostStructure postStructure = new PostStructure(connector.getMySQL());
        Spark.get("/posts/get/:amount/:category", (request, response) -> postStructure
                .get(request.params(":category"), Integer.parseInt(request.params(":amount"))));

        Spark.get("/posts/get/:amount", (request, response) -> postStructure.get(Integer.parseInt(request.params(":amount"))));

        // Users
        final UserStructure userStructure = new UserStructure(connector.getMySQL());
        Spark.get("/users/insert/:mac", (request, response) -> {
            userStructure.insert(request.params(":mac"));
            return gson.toJson("OK!");
        });

        Spark.get("/users/exists/:mac", (request, response) -> {
            final boolean exists = userStructure.exists(request.params(":mac"));
            return gson.toJson(exists);
        });

        // Favorites
        final FavoriteStructure favoriteStructure = new FavoriteStructure(connector.getMySQL(), gson);
        Spark.get("/fav/insert/:mac/:postId", (request, response) -> {
            favoriteStructure.insert(
                    request.params(":mac"),
                    request.params(":postId")
            );
            return "OK!";
        });

        Spark.get("/fav/delete/:mac/:postId", (request, response) -> {
            favoriteStructure.delete(
                    request.params(":mac"),
                    request.params(":postId")
            );
            return "OK!";
        });

        Spark.get("/fav/get/:mac/:postId", (request, response) -> favoriteStructure.get(request.params(":mac"), request.params(":postId"), userStructure, postStructure));

        Spark.get("/fav/get/:mac", (request, response) -> favoriteStructure.get(request.params(":mac"), userStructure, postStructure));

        Spark.get("/fav/exists/:mac/:postId", (request, response) -> gson.toJson(favoriteStructure.exists(request.params(":mac"), request.params(":postId"))));
    }
}
