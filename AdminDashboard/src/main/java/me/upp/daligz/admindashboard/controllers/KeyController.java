package me.upp.daligz.admindashboard.controllers;

import lombok.AllArgsConstructor;

import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

@AllArgsConstructor
public class KeyController {

    private final JFrame jFrame;

    public void init() {
        this.jFrame.addKeyListener(
                new KeyListener() {
                    @Override
                    public void keyTyped(final KeyEvent event) { }

                    @Override
                    public void keyPressed(final KeyEvent event) { }

                    @Override
                    public void keyReleased(final KeyEvent event) { }
                }
        );
    }
}
