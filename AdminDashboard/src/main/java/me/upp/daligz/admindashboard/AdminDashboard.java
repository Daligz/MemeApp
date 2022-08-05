package me.upp.daligz.admindashboard;

import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;
import java.awt.*;
import java.net.MalformedURLException;
import java.net.URL;

public class AdminDashboard {

    public static void main(final String[] args) throws MalformedURLException {
        final Connector connector = new Connector();
        final JFrame jFrame = new JFrame("Panel de Administrador");
        final MainView mainView = new MainView();
        jFrame.setContentPane(mainView.getRootPanel());
        jFrame.pack();
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setBounds(700, 250, 500, 250);
        jFrame.setVisible(true);
        mainView.getRootPanel().setBackground(Color.GREEN);
        final Image image = Toolkit.getDefaultToolkit().createImage(new URL("https://i.pinimg.com/originals/42/c2/61/42c261ecd1f3cb4a0b02185acb053095.gif"));
        mainView.getRootPanel().prepareImage(image, (img, infoflags, x, y, width, height) -> true);
    }
}
