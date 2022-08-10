package me.upp.daligz.admindashboard.controllers;

import lombok.AllArgsConstructor;
import me.upp.daligz.admindashboard.commands.InsertImageCommand;
import me.upp.daligz.admindashboard.commands.KeyCommand;
import me.upp.daligz.admindashboard.database.data.PostData;
import me.upp.daligz.admindashboard.view.MainView;

import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

@AllArgsConstructor
public class KeyController {

    private final JFrame jFrame;
    private final PostData postData;
    private final MainView mainView;

    public void init() {
        this.jFrame.addKeyListener(
                new KeyListener() {
                    @Override
                    public void keyTyped(final KeyEvent event) { }

                    @Override
                    public void keyPressed(final KeyEvent event) { }

                    @Override
                    public void keyReleased(final KeyEvent event) {
                        final String keyText = KeyEvent.getKeyText(event.getKeyCode());
                        KeyCommand keyCommand = null;

                        if (keyText.equalsIgnoreCase("Plus")) {
                            keyCommand = new InsertImageCommand(postData, mainView);
                        }

                        if (keyCommand != null) keyCommand.work();
                    }
                }
        );
    }
}
