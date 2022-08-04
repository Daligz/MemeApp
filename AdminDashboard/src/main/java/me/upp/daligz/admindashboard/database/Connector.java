package me.upp.daligz.admindashboard.database;

import lombok.Getter;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;

public class Connector {

    @Getter
    private final MySQL mySQL = new MySQL();

    public Connector() {
        this.mySQL.connect(
                "localhost",
                "3306",
                "root",
                "",
                "web-service"
        );
    }
}