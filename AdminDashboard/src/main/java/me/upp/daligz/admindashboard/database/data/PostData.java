package me.upp.daligz.admindashboard.database.data;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.database.tables.PostTable;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.DeleteQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.UpdateQuery;

@AllArgsConstructor
public class PostData {

    private final Connector connector;

    public void insert(final String url, final String category) {
        final String insertQuery = new InsertQuery(PostTable.TABLE_NAME.getValue())
                .value(PostTable.ID.getValue(), null)
                .value(PostTable.URL.getValue(), url)
                .value(PostTable.CATEGORY.getValue(), category)
                .build();
        new Query(this.connector.getMySQL(), insertQuery).executeUpdateAsync();
    }

    public void delete(final int id) {
        final String deleteQuery = new DeleteQuery(PostTable.TABLE_NAME.getValue())
                .where(String.format("'%s' = %s", PostTable.ID.getValue(), id))
                .build();
        new Query(this.connector.getMySQL(), deleteQuery).executeUpdateAsync();
    }

    public void update(final int id, final String url, final String category) {
        final String updateQuery = new UpdateQuery(PostTable.TABLE_NAME.getValue())
                .set(PostTable.URL.getValue(), url)
                .set(PostTable.CATEGORY.getValue(), category)
                .where(String.format("'%s' = %s", PostTable.ID.getValue(), id))
                .build();
        new Query(this.connector.getMySQL(), updateQuery).executeUpdateAsync();
    }
}
