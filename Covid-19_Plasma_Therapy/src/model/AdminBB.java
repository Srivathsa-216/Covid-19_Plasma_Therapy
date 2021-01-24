/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DAO;

/**
 *
 * @author Man of Steel
 */
public class AdminBB {

	private String username, password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static boolean isAdmin(String username, String password) {
		boolean flag = false;
		try {
			DAO dao = new DAO();
			String sql = "select * from blood_bank where username = '" + username + "' and password = '" + password
					+ "'";
			System.out.println("Username " + username + " password " + password);
			ResultSet rs = dao.getData(sql);
			if (rs.next()) {
				flag = true;
				System.out.println("true");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public static int getBloodbankId(String username) {

		int bloodbankId = -1;
		try {
			String getIdQuery = "select Bbank_id from blood_bank where blood_bank.Username = '" + username + "'";
			DAO dao = new DAO();
			ResultSet resultSet = dao.getData(getIdQuery);
			if (resultSet.next())
				bloodbankId = resultSet.getInt("Bbank_id");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bloodbankId;
	}

}
