package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DAO {
	private static final String url = "jdbc:mysql://localhost:3306/covid_19_plasma_therapy_db";
	private static final String uname = "root";
	private static final String pass = "Mysql@1234";

	Connection connection;
	Statement statement;

	public DAO() {
		establishConnection();
	}

	private void establishConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			connection = DriverManager.getConnection(url, uname, pass);

			statement = connection.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public int putData(String query) {
		try {
			int rows = statement.executeUpdate(query);
			return rows;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
	}

	public ResultSet getData(String query) {
		try {
			ResultSet rs = statement.executeQuery(query);
			return rs;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}