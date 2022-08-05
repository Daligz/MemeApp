package me.upp.daligz.admindashboard.controllers;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.database.data.PostData;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;

@AllArgsConstructor
public class ViewController {

    private final MainView mainView;
    private final PostData postData;
    private final ImageController imageController;

    public void init() {
        this.create();
        this.cancel();
    }

    private void create() {
        this.mainView.getBtnCreate().addActionListener(e -> {
            this.postData.insert(
                    mainView.getTxtUrl().getText(),
                    mainView.getTxtCategory().getText()
            );
            this.clearFields();
            this.message("Datos agregados!");
        });
    }

    private void update() {
        this.mainView.getBtnUpdate().addActionListener(e -> {
            this.postData.update(
                    1,
                    mainView.getTxtUrl().getText(),
                    mainView.getTxtCategory().getText()
            );
            this.clearFields();
            this.message("Datos actualizados!");
        });
    }

    private void cancel() {
        this.mainView.getBtnCancel().addActionListener(e -> this.clearFields());
    }

    private void clearFields() {
        this.mainView.getTxtUrl().setText(null);
        this.mainView.getTxtCategory().setText(null);
    }

    private void message(final String message) {
        JOptionPane.showMessageDialog(null, message);
    }
}