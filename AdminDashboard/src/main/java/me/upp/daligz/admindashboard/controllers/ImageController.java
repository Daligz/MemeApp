package me.upp.daligz.admindashboard.controllers;

import lombok.AllArgsConstructor;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.net.URL;

@AllArgsConstructor
public class ImageController {

    private final JLabel imageLabel;

    public void updateImage(final String url) {
        try {
            final BufferedImage image = resize(ImageIO.read(new URL(url)), 750, 500);
            this.imageLabel.setIcon(new ImageIcon(image));
        } catch (final Exception ignored) {
            this.imageLabel.setIcon(null);
        }
    }

    private BufferedImage resize(BufferedImage img, int newW, int newH) {
        final Image tmp = img.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
        final BufferedImage dimg = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = dimg.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return dimg;
    }
}
