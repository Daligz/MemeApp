package me.upp.daligz.service.database.methods;

import lombok.AllArgsConstructor;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.DeleteQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.Query;

@AllArgsConstructor
public class Delete implements DataMethod<Object> {

    private final DeleteQuery deleteQuery;
    private final MySQL mySQL;

    @Override
    public Object execute() {
        new Query(this.mySQL, this.deleteQuery.build()).executeUpdateAsync();
        return null;
    }
}
