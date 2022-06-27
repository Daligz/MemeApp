package me.upp.daligz.service;

import me.upp.daligz.service.database.Connector;
import me.upp.daligz.service.database.structures.Posts;
import spark.Spark;

public class Service {

    public static void main(final String[] args) {
        final Connector connector = new Connector();
        Spark.port(6969);
        Spark.get("/images/:amount/:category", (request, response) -> {
//            final GetImages getImages = new GetImages(Integer.parseInt(request.params(":amount")), request.params(":category"), connector);
//            final String get = getImages.get();
            final String posts = new Posts(connector.getMySQL()).getPosts(request.params(":category"), Integer.parseInt(request.params(":amount")));
            System.out.println(request.toString());
            System.out.println(response.toString());
            System.out.println(posts);
            return posts;
        });
    }
}
