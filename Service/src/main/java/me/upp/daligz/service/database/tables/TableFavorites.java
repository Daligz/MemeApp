package me.upp.daligz.service.database.tables;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum TableFavorites {
    TABLE_NAME("favorites"),
    ID("favoritesId"),
    USER_ID("userId"),
    POST_ID("postsId");
    private String value;
}
