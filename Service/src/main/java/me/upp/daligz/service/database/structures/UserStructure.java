package me.upp.daligz.service.database.structures;

import lombok.AllArgsConstructor;
import me.upp.daligz.service.database.methods.Get;
import me.upp.daligz.service.database.methods.Insert;
import me.upp.daligz.service.database.tables.TableFavorites;
import me.upp.daligz.service.database.tables.TableUsers;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

@AllArgsConstructor
public class UserStructure {

    private final MySQL mySQL;

    public void insert(final String mac) {
        final InsertQuery insertQuery = new InsertQuery(TableUsers.TABLE_NAME.getValue())
                .value(TableUsers.ID.getValue(), null)
                .value(TableUsers.MAC.getValue(), String.format("'%s'", mac));
        new Insert(insertQuery, this.mySQL).execute();
    }

    public boolean exists(final String mac) {
        final SelectQuery selectQuery = new SelectQuery(TableUsers.TABLE_NAME.getValue())
                .column("*")
                .where(TableUsers.MAC.getValue() + " = '" + mac + "'");
        final String execute = new Get(selectQuery, this.mySQL).execute();
        return (execute != null && !(execute.isEmpty()));
    }

    public String get(final int id) {
        final SelectQuery selectQuery = new SelectQuery(TableUsers.TABLE_NAME.getValue())
                .column("*")
                .where(TableUsers.ID.getValue() + " = '" + id + "'");
        return new Get(selectQuery, this.mySQL).execute();
    }
}
