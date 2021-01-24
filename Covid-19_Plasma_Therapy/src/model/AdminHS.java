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
public class AdminHS {

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
			String sql = "select * from hospital where username = '" + username + "' and password = '" + password + "'";
			System.out.println("Username " + username + " password " + password);
			ResultSet rs = dao.getData(sql);
			if (rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public static int getHospitalId(String username) {
		int hospitalId = -1;
		try {
			String getIdQuery = "select hospital_id from hospital where hospital.Username = '" + username + "'";
			DAO dao = new DAO();
			ResultSet resultSet = dao.getData(getIdQuery);
			if (resultSet.next())
				hospitalId = resultSet.getInt("Hospital_id");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return hospitalId;
	}

}
