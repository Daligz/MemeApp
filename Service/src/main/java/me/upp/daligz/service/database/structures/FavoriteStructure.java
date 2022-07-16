package me.upp.daligz.service.database.structures;

import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import me.upp.daligz.service.commons.FavoriteData;
import me.upp.daligz.service.commons.PostData;
import me.upp.daligz.service.commons.UserData;
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

    public boolean exists(final String mac, final String postId) {
        final SelectQuery selectQuery = new SelectQuery(TableFavorites.TABLE_NAME.getValue())
                .column("*")
                .where(TableFavorites.USER_ID.getValue() + " = '" + mac + "'")
                .and(TableFavorites.POST_ID.getValue() + " = '" + postId + "'");
        final String execute = new Get(selectQuery, this.mySQL).execute();
        return (execute != null && !(execute.isEmpty()));
    }

    public String get(final String mac, final String postId, final UserStructure userStructure, final PostStructure postStructure) {
        final int id = userStructure.getIdByMac(mac);
        final SelectQuery selectQuery = new SelectQuery(TableFavorites.TABLE_NAME.getValue())
                .column("*")
                .where(TableFavorites.USER_ID.getValue() + " = '" + id + "'")
                .and(TableFavorites.POST_ID.getValue() + " = '" + postId + "'");
        return this.getData(userStructure, postStructure, selectQuery);
    }

    public String get(final String mac, final UserStructure userStructure, final PostStructure postStructure) {
        final int id = userStructure.getIdByMac(mac);
        final SelectQuery selectQuery = new SelectQuery(TableFavorites.TABLE_NAME.getValue())
                .column("*")
                .where(TableFavorites.USER_ID.getValue() + " = '" + id + "'");
        return this.getData(userStructure, postStructure, selectQuery);
    }

    private String getData(final UserStructure userStructure, final PostStructure postStructure, final SelectQuery selectQuery) {
        final String result = new Get(selectQuery, this.mySQL).execute();
        final List<FavoriteData.ToService> toService = new ArrayList<>();
        final FavoriteData.FromDataBase[] fromDataBases = this.gson.fromJson(result, FavoriteData.FromDataBase[].class);
        if (fromDataBases == null) return "";
        for (final FavoriteData.FromDataBase fromDataBase : fromDataBases) {
            final String json = userStructure.get(fromDataBase.getUserid());
            final String byId = postStructure.getById(fromDataBase.getPostid());
            final UserData userData = this.gson.fromJson(json, UserData[].class)[0];
            final PostData postData = this.gson.fromJson(byId, PostData[].class)[0];
            toService.add(
                    new FavoriteData.ToService(
                            userData.getUserid(),
                            postData.getPostid(),
                            userData.getMac(),
                            postData.getUrl(),
                            postData.getCategory()
                    )
            );
        }
        return this.gson.toJson(toService);
    }
}
