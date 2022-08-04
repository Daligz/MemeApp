package me.upp.daligz.admindashboard.database.tables;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum PostTable {
    TABLE_NAME("posts"),
    ID("postId"),
    URL("url"),
    CATEGORY("category");
    private String value;
}
