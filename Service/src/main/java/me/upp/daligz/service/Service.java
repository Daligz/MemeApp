package me.upp.daligz.service;

import me.upp.daligz.service.database.Connector;
import me.upp.daligz.service.database.structures.PostStructure;
import me.upp.daligz.service.database.structures.UserStructure;
import spark.Spark;

public class Service {

    public static void main(final String[] args) {
        final Connector connector = new Connector();
        Spark.port(6969);

        // Posts
        Spark.get("/posts/get/:amount/:category", (request, response) -> new PostStructure(connector.getMySQL())
                .getPosts(request.params(":category"), Integer.parseInt(request.params(":amount"))));

        // Users
        Spark.get("/users/insert/:mac", (request, response) -> {
            new UserStructure(connector.getMySQL()).insert(request.params(":mac"));
            return "OK!";
        });

        // Favorites
        Spark.get("/fav/insert/:mac", (request, response) -> null);

        Spark.get("/fav/delete/:mac", (request, response) -> null);
    }
}
