package me.upp.daligz.service.database.tables;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum TableFavorites {
    TABLE_NAME("favorites"),
    ID("favoriteId"),
    USER_ID("userId"),
    POST_ID("postId");
    private String value;
}
