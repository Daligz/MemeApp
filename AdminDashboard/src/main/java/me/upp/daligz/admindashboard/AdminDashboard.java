package me.upp.daligz.admindashboard;

import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;

public class AdminDashboard {

    public static void main(final String[] args) {
        final Connector connector = new Connector();
        final JFrame jFrame = new JFrame("Panel de Administrador");
        jFrame.setContentPane(new MainView().getRootPanel());
        jFrame.pack();
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setBounds(700, 250, 500, 250);
        jFrame.setVisible(true);
    }
}
