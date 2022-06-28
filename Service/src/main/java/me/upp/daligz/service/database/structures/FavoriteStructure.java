package me.upp.daligz.service.database.structures;

import lombok.AllArgsConstructor;
import me.upp.daligz.service.database.methods.Delete;
import me.upp.daligz.service.database.methods.Get;
import me.upp.daligz.service.database.methods.Insert;
import me.upp.daligz.service.database.tables.TableFavorites;
import me.upp.daligz.service.database.tables.TablePosts;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.DeleteQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

@AllArgsConstructor
public class FavoriteStructure {

    private final MySQL mySQL;

    public void insert(final String mac, final String postId) {
        final InsertQuery insertQuery = new InsertQuery(TableFavorites.TABLE_NAME.getValue())
                .value(TableFavorites.ID.getValue(), null)
                .value(TableFavorites.USER_ID.getValue(), String.format("'%s'", mac))
                .value(TableFavorites.POST_ID.getValue(), String.format("'%s'", postId));
        new Insert(insertQuery, this.mySQL).execute();
    }
}
