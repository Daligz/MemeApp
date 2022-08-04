package me.upp.daligz.admindashboard.database.data;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.database.commons.PostContainer;
import me.upp.daligz.admindashboard.database.tables.PostTable;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.*;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    public List<PostContainer> get(final int id) {
        final String selectQuery = new SelectQuery(PostTable.TABLE_NAME.getValue())
                .column("*")
                .where(String.format("'%s' = %s", PostTable.ID.getValue(), id))
                .build();
        final ResultSet resultSet = new Query(this.connector.getMySQL(), selectQuery).executeQuery();
        final ArrayList<PostContainer> postContainers = new ArrayList<>();
        try {
            while (resultSet.next()) {
                postContainers.add(new PostContainer(
                        resultSet.getInt(PostTable.ID.getValue()),
                        resultSet.getString(PostTable.URL.getValue()),
                        resultSet.getString(PostTable.CATEGORY.getValue())
                ));
            }
        } catch (final Exception ignored) { }
        return postContainers;
    }
}
