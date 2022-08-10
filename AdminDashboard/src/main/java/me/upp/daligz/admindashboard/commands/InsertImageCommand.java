package me.upp.daligz.admindashboard.commands;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.database.data.PostData;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;

@AllArgsConstructor
public class InsertImageCommand implements KeyCommand {

    private final PostData postData;
    private final MainView mainView;

    @Override
    public void work() {
        final int amount = Integer.parseInt(JOptionPane.showInputDialog("Cuantas veces se ingresaran los datos? :)"));
        final String url = mainView.getTxtUrl().getText();
        final String category = mainView.getTxtCategory().getText();
        for (int i = 0; i < amount; i++) this.postData.insert(url, category);
        JOptionPane.showMessageDialog(null, amount + " datos fueron agregados!");
    }
}
