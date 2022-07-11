package me.upp.daligz.service.database;

import lombok.Getter;
import me.upp.daligz.service.database.tables.TableFavorites;
import me.upp.daligz.service.database.tables.TablePosts;
import me.upp.daligz.service.database.tables.TableUsers;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.CreateTableQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;

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
        this.createTables();
    }

    private void createTables() {
        this.executeTableQuery(
                new CreateTableQuery(TablePosts.TABLE_NAME.getValue())
                        .ifNotExists()
                        .column(TablePosts.ID.getValue(), "INT AUTO_INCREMENT")
                        .column(TablePosts.URL.getValue(), "VARCHAR(120) NOT NULL")
                        .column(TablePosts.CATEGORY.getValue(), "VARCHAR(120) NOT NULL")
                        .primaryKey(TablePosts.ID.getValue())
                        .build()
        );

        this.executeTableQuery(
                new CreateTableQuery(TableUsers.TABLE_NAME.getValue())
                        .ifNotExists()
                        .column(TableUsers.ID.getValue(), "INT AUTO_INCREMENT")
                        .column(TableUsers.MAC.getValue(), "VARCHAR(20) NOT NULL")
                        .primaryKey(TableUsers.ID.getValue())
                        .build()
        );

        this.executeTableQuery(
                new CreateTableQuery(TableFavorites.TABLE_NAME.getValue())
                        .ifNotExists()
                        .column(TableFavorites.ID.getValue(), "INT AUTO_INCREMENT")
                        .column(TableFavorites.USER_ID.getValue(), String.format("INT NOT NULL, FOREIGN KEY(%s) REFERENCES %s(%s)", TableFavorites.USER_ID.getValue(), TableUsers.TABLE_NAME.getValue(), TableUsers.ID.getValue()))
                        .column(TableFavorites.POST_ID.getValue(), String.format("INT NOT NULL, FOREIGN KEY(%s) REFERENCES %s(%s)", TableFavorites.POST_ID.getValue(), TablePosts.TABLE_NAME.getValue(), TablePosts.ID.getValue()))
                        .primaryKey(TableFavorites.ID.getValue())
                        .build()
        );
    }

    private void executeTableQuery(final String query) {
        new Query(this.mySQL, query).executeUpdateAsync();
    }
}
