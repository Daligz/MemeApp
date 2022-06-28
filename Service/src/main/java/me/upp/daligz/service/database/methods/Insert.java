package me.upp.daligz.service.database.methods;

import lombok.AllArgsConstructor;
import me.upp.daligz.service.utils.JsonUtils;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

import java.sql.ResultSet;

@AllArgsConstructor
public class Insert implements DataMethod<String> {

    private final InsertQuery insertQuery;
    private final MySQL mySQL;

    @Override
    public String execute() {
        return null;
    }
}
