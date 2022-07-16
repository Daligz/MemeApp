package me.upp.daligz.service.commons;

import lombok.Data;

@Data
public class PostData {
    private final int postid;
    private final String category, url;
}
