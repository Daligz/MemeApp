package me.upp.daligz.service.database.structures;

import lombok.AllArgsConstructor;
import me.upp.daligz.service.database.methods.Get;
import me.upp.daligz.service.database.tables.TablePosts;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.MySQL;
import net.royalmind.minecraft.plugin.minigamecluster.mysqlapi.queries.SelectQuery;

@AllArgsConstructor
public class PostStructure {

    private final MySQL mySQL;

    public String get(final String category, final int amount) {
        final SelectQuery selectQuery = new SelectQuery(TablePosts.TABLE_NAME.getValue())
                .column("*")
                .where(TablePosts.CATEGORY.getValue() + " = '" + category + "'");
        return new Get(selectQuery, amount, this.mySQL).execute();
    }

    public String get(final int amount) {
        final SelectQuery selectQuery = new SelectQuery(TablePosts.TABLE_NAME.getValue())
                .column("*")
                .limit(amount);
        return new Get(selectQuery, amount, this.mySQL).execute();
    }
}
