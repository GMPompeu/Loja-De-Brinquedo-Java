package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectorFactory {

	public static Connection getConnection() throws Exception {

		try {
			// Indicar qual o banco de dados a ser utilizado

			Class.forName("com.mysql.cj.jdbc.Driver");

			String user = "root";
			String password = "";
			String url = "jdbc:mysql://localhost:3306/trabalhosexta";

			return DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) throws Exception {
		close(conn, stmt, rs);
	}

	public static void closeConnection(Connection conn, Statement stmt) throws Exception {
		close(conn, stmt, null);
	}

	public static void closeConnection(Connection conn) throws Exception {
		close(conn, null, null);
	}

	private static void close(Connection conn, Statement stmt, ResultSet rs) throws Exception {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}
