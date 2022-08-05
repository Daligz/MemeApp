package me.upp.daligz.admindashboard.controllers;

import lombok.AllArgsConstructor;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.image.BufferedImage;
import java.net.URL;

@AllArgsConstructor
public class ImageController {

    private final JLabel imageLabel;

    public void updateImage(final String url) {
        try {
            final BufferedImage image = ImageIO.read(new URL(url));
            this.imageLabel.setIcon(new ImageIcon(image));
        } catch (final Exception ignored) { }
    }
}
