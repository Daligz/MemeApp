package me.upp.daligz.service.database.methods;

import lombok.AllArgsConstructor;
import me.upp.daligz.service.utils.JsonUtils;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

import java.sql.ResultSet;

@AllArgsConstructor
public class Get implements DataMethod<String> {

    private final SelectQuery selectQuery;
    private int limit = -1;
    private final MySQL mySQL;

    public Get(final SelectQuery selectQuery, final MySQL mySQL) {
        this.selectQuery = selectQuery;
        this.mySQL = mySQL;
    }

    @Override
    public String execute() {
        final ResultSet resultSet = new Query(this.mySQL, this.selectQuery.build()).executeQuery();
        try {
            if (resultSet == null || !(resultSet.next())) return "";
        } catch (final Exception exception) {
            return "";
        }
        try {
            return JsonUtils.toJSON(resultSet, this.limit).toString();
        } catch (final Exception exception) {
            return null;
        }
    }
}
