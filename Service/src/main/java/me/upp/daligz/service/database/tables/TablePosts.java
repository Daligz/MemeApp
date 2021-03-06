package me.upp.daligz.service.database.tables;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum TablePosts {
    TABLE_NAME("posts"),
    ID("postId"),
    URL("url"),
    CATEGORY("category");
    private String value;
}
