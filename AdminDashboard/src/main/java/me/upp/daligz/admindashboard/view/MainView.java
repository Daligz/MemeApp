package me.upp.daligz.admindashboard.view;

import lombok.Data;

import javax.swing.*;

@Data
public class MainView {
    private JTextField txtUrl;
    private JTextField txtCategory;
    private JPanel imagePanel;
    private JPanel rootPanel;
    private JButton btnCreate;
    private JButton btnGet;
    private JButton btnDelete;
    private JButton btnUpdate;
    private JButton btnCancel;
    private JLabel imageLabel;
    private JComboBox<Integer> comboId;
}
