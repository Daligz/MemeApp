package me.upp.daligz.service.request;

import lombok.Data;
import me.upp.daligz.service.database.Connector;
import me.upp.daligz.service.utils.JsonUtils;

import java.sql.ResultSet;

@Data
public class GetImages implements Request {

    private final int amount;
    private final String category;
    private final Connector connector;

    @Override
    public String get() {
        final ResultSet posts = this.connector.getPosts(this.category);
        if (posts == null) return "";
        try {
            return JsonUtils.toJSON(posts, this.amount).toString();
        } catch (final Exception exception) {
            exception.printStackTrace();
        }
        return null;
    }
}
