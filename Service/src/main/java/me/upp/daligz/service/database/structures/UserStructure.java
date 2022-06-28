package me.upp.daligz.service.database.structures;

import lombok.AllArgsConstructor;
import me.upp.daligz.service.database.methods.Insert;
import me.upp.daligz.service.database.tables.TableUsers;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;

@AllArgsConstructor
public class UserStructure {

    private final MySQL mySQL;

    public void insert(final String mac) {
        final InsertQuery insertQuery = new InsertQuery(TableUsers.TABLE_NAME.getValue())
                .value(TableUsers.ID.getValue(), null)
                .value(TableUsers.MAC.getValue(), String.format("'%s'", mac));
        new Insert(insertQuery, this.mySQL).execute();
    }
}
