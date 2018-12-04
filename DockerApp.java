import java.util.Scanner;
import java.sql.*;

public class DockerApp {

	private static final String insertSQL = "insert into MyTable values (?,?,?)";
	private static final String selectSQL = "select column1, column2, column3 from MyTable)";
	private static final String db_url = "jdbc:mysql://10.0.10.3:3306/app_db";
	private static final String db_user = "root";
	private static final String db_password = "root";

	public static void main(String[] args) {
		if (args.length > 0) {
			switch(args[0]) {
				case "list":
					try {
						getAllRecords();
					} catch (SQLException ex) {
						System.out.println(ex.toString());
					}
				break;

				case "insert":
					try {
						if (args.length == 4) executeInsertSql(args);
					} catch (SQLException ex) {
						System.out.println(ex.toString());
					}
				break;
			}
		}
	}
	
	public static Connection getMySqlConnection() throws SQLException {
		return DriverManager.getConnection(db_url, db_user, db_password);
	}

	public static void getAllRecords() throws SQLException {
		Connection conn = getMySqlConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(selectSQL);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			System.out.println(
				"Column1:" + rs.getString("column1") + 
				"Column2:" + rs.getString("column2") + 
				"Column3:" + rs.getString("column3")
			);
		}
		
	}

	public static void executeInsertSql(String[] parts) throws SQLException {
		Connection conn = getMySqlConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(insertSQL);
		preparedStatement.setString(1, parts[1]);
        	preparedStatement.setString(2, parts[2]);
		preparedStatement.setString(3, parts[3]);

		if (preparedStatement.executeUpdate() == 0) {
            		throw new SQLException("Creating data failed!");
		}
		System.out.println("Creating data success!");
	}
}
