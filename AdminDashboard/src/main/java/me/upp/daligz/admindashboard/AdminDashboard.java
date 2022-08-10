package me.upp.daligz.admindashboard;

import me.upp.daligz.admindashboard.controllers.ImageController;
import me.upp.daligz.admindashboard.controllers.KeyController;
import me.upp.daligz.admindashboard.controllers.ViewController;
import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.database.data.PostData;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;

public class AdminDashboard {

    public static void main(final String[] args) {
        final Connector connector = new Connector();
        final JFrame jFrame = new JFrame("Panel de Administrador");
        final MainView mainView = new MainView();
        new ViewController(mainView, new PostData(connector), new ImageController(mainView.getImageLabel())).init();
        new KeyController(jFrame).init();
        jFrame.setContentPane(mainView.getRootPanel());
        jFrame.pack();
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setBounds(700, 250, 600, 450);
        jFrame.setVisible(true);
        jFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
    }
}
