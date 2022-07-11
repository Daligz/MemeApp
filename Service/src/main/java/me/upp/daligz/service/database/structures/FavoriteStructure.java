package me.upp.daligz.service.database.structures;

import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import me.upp.daligz.service.commons.FavoriteData;
import me.upp.daligz.service.database.methods.Delete;
import me.upp.daligz.service.database.methods.Get;
import me.upp.daligz.service.database.methods.Insert;
import me.upp.daligz.service.database.tables.TableFavorites;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.DeleteQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.InsertQuery;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
public class FavoriteStructure {

    private final MySQL mySQL;
    private final Gson gson;
    private final UserStructure userStructure;
    private PostStructure postStructure;

    public void insert(final String mac, final String postId) {
        final InsertQuery insertQuery = new InsertQuery(TableFavorites.TABLE_NAME.getValue())
                .value(TableFavorites.ID.getValue(), null)
                .value(TableFavorites.USER_ID.getValue(), String.format("'%s'", mac))
                .value(TableFavorites.POST_ID.getValue(), String.format("'%s'", postId));
        new Insert(insertQuery, this.mySQL).execute();
    }

    public void delete(final String mac, final String postId) {
        final DeleteQuery deleteQuery = new DeleteQuery(TableFavorites.TABLE_NAME.getValue())
                .where(String.format("%s = '%s'", TableFavorites.USER_ID.getValue(), mac))
                .and(String.format("%s = '%s'", TableFavorites.POST_ID.getValue(), postId));
        new Delete(deleteQuery, this.mySQL).execute();
    }

    public String get(final String mac, final String postId) {
        final SelectQuery selectQuery = new SelectQuery(TableFavorites.TABLE_NAME.getValue())
                .column("*")
                .where(TableFavorites.USER_ID.getValue() + " = '" + mac + "'")
                .and(TableFavorites.POST_ID.getValue() + " = '" + postId + "'");
        final String result = new Get(selectQuery, this.mySQL).execute();
        System.out.println(result);
        final List<FavoriteData.ToService> toService = new ArrayList<>();
        for (final FavoriteData.FromDataBase fromDataBase : this.gson.fromJson(result, FavoriteData.FromDataBase[].class)) {
            toService.add(
                    new FavoriteData.ToService(

                    )
            );
        }
        return this.gson.toJson(toService);
    }

    public String get(final String mac) {
        final SelectQuery selectQuery = new SelectQuery(TableFavorites.TABLE_NAME.getValue())
                .column("*")
                .where(TableFavorites.USER_ID.getValue() + " = '" + mac + "'");
        return new Get(selectQuery, this.mySQL).execute();
    }
}
