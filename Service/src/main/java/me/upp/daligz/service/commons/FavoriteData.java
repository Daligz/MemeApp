package me.upp.daligz.service.commons;

import lombok.Data;

public class FavoriteData {

    @Data
    public static class FromDataBase {
        private final int favoriteid, postid, userid;
    }

    @Data
    public static class ToService {
        private final int userid, postid;
        private final String mac, url, category;
    }
}
