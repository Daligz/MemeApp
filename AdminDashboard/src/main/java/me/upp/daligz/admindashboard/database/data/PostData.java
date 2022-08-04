package me.upp.daligz.admindashboard.database.data;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.database.tables.PostTable;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;

@AllArgsConstructor
public class PostData {

    private final Connector connector;

    public void insert(final String url, final String category) {
        final String insertQuery = new InsertQuery("posts")
                .value(PostTable.ID.getValue(), null)
                .value(PostTable.URL.getValue(), url)
                .value(PostTable.CATEGORY.getValue(), category)
                .build();
        new Query(this.connector.getMySQL(), insertQuery);
    }
}
