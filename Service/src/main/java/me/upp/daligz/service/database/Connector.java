package me.upp.daligz.service.database;

import me.upp.daligz.service.database.tables.TablePosts;
import me.upp.daligz.service.database.tables.TableUsers;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.CreateTableQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

import java.sql.ResultSet;

public class Connector {

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
    }

    private void executeTableQuery(final String query) {
        new Query(this.mySQL, query).executeUpdateAsync();
    }

    public ResultSet getPosts(final String category) {
        final String selectQuery = new SelectQuery(TablePosts.TABLE_NAME.getValue())
                .column("*")
                .where(TablePosts.CATEGORY.getValue() + " = '" + category + "'")
                .build();
        System.out.println(selectQuery);
        try {
            return new Query(this.mySQL, selectQuery).executeQuery();
        } catch (final Exception exception) {
            exception.printStackTrace();
        }
        return null;
    }

    public void close() {
        this.mySQL.disconnect();
    }
}
