package me.upp.daligz.service.database.tables;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum TableUsers {
    TABLE_NAME("users"),
    ID("usersId"),
    MAC("mac");
    private String value;
}
