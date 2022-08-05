package me.upp.daligz.admindashboard.controllers;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.database.data.PostData;
import me.upp.daligz.admindashboard.view.MainView;

@AllArgsConstructor
public class ViewController {

    private final MainView mainView;
    private final PostData postData;
    private final ImageController imageController;

    public void init() {
        this.create();
    }

    private void create() {
        this.mainView.getBtnCreate().addActionListener(e -> this.postData.insert(
                mainView.getTxtUrl().getText(),
                mainView.getTxtCategory().getText()
        ));
    }
}