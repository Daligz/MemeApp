package me.upp.daligz.admindashboard;

import me.upp.daligz.admindashboard.controllers.ImageController;
import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;

public class AdminDashboard {

    public static void main(final String[] args) {
        final Connector connector = new Connector();
        final JFrame jFrame = new JFrame("Panel de Administrador");
        final MainView mainView = new MainView();
        final ImageController imageController = new ImageController(mainView.getImageLabel());
        jFrame.setContentPane(mainView.getRootPanel());
        jFrame.pack();
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setBounds(700, 250, 600, 450);
        jFrame.setVisible(true);
        jFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
    }
}
