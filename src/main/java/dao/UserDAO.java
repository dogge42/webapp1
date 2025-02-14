package dao;

import model.User;
import java.sql.*;

public class UserDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/logindb";
    private static final String USER = "root";
    private static final String PASSWORD = "" ;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean validate(User user) {
        String query = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Trả về true nếu tìm thấy user
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
