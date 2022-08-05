package me.upp.daligz.admindashboard;

import me.upp.daligz.admindashboard.database.Connector;
import me.upp.daligz.admindashboard.view.MainView;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;

public class AdminDashboard {

    public static void main(final String[] args) throws IOException {
        final Connector connector = new Connector();
        final JFrame jFrame = new JFrame("Panel de Administrador");
        final MainView mainView = new MainView();
        jFrame.setContentPane(mainView.getRootPanel());
        jFrame.pack();
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jFrame.setBounds(700, 250, 600, 450);
        jFrame.setVisible(true);
        jFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        final BufferedImage image = ImageIO.read(new URL("https://i.pinimg.com/originals/42/c2/61/42c261ecd1f3cb4a0b02185acb053095.gif"));
        mainView.getImageLabel().setIcon(new ImageIcon(image));
    }
}
