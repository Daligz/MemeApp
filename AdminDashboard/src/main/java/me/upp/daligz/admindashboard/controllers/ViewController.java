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
        this.update();
        this.get();
        this.loadCombo();
    }

    private void loadCombo() {
        this.mainView.getComboId().removeAllItems();
        this.postData.get().forEach(postContainer -> this.mainView.getComboId().addItem(postContainer.getId()));
    }

    private void create() {
        this.mainView.getBtnCreate().addActionListener(e -> {
            this.postData.insert(
                    mainView.getTxtUrl().getText(),
                    mainView.getTxtCategory().getText()
            );
            this.message("Datos agregados!");
            this.clearFields();
        });
    }

    private void update() {
        this.mainView.getBtnUpdate().addActionListener(e -> {
            final Object selectedItem = mainView.getComboId().getSelectedItem();
            if (selectedItem == null) return;
            this.postData.update(
                    ((Integer) selectedItem),
                    mainView.getTxtUrl().getText(),
                    mainView.getTxtCategory().getText()
            );
            this.message("Datos actualizados!");
            this.clearFields();
        });
    }

    private void get() {
        this.mainView.getBtnGet().addActionListener(e -> {
            final Object selectedItem = mainView.getComboId().getSelectedItem();
            if (selectedItem == null) return;
            this.postData.get(((Integer) selectedItem)).forEach(postContainer -> {
                mainView.getTxtUrl().setText(postContainer.getUrl());
                mainView.getTxtCategory().setText(postContainer.getCategory());
                this.imageController.updateImage(postContainer.getUrl());
            });
        });
    }

    private void cancel() {
        this.mainView.getBtnCancel().addActionListener(e -> this.clearFields());
    }

    private void clearFields() {
        this.mainView.getTxtUrl().setText(null);
        this.mainView.getTxtCategory().setText(null);
        this.mainView.getComboId().setSelectedIndex(0);
        this.loadCombo();
        this.imageController.updateImage("");
    }

    private void message(final String message) {
        JOptionPane.showMessageDialog(null, message);
    }
}