package me.upp.daligz.admindashboard;

import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;
import java.awt.*;
import java.awt.image.ImageObserver;

public class AdminDashboard {

    public static void main(final String[] args) {
        final Connector connector = new Connector();
        final JFrame jFrame = new JFrame("Panel de Administrador");
        final MainView mainView = new MainView();
        jFrame.setContentPane(mainView.getRootPanel());
        jFrame.pack();
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setBounds(700, 250, 500, 250);
        jFrame.setVisible(true);
        final Image image = Toolkit.getDefaultToolkit().createImage("https://i.pinimg.com/originals/42/c2/61/42c261ecd1f3cb4a0b02185acb053095.gif");
        mainView.getImagenPanel().prepareImage(image, (img, infoflags, x, y, width, height) -> false);
    }
}
