package example;
import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectDB {
    public static Connection getCon() {
        Connection connection = null;
        String host="localhost";
        String port="5432";
        String db_name="postgres";
        String username="postgres";
        String password="ammaappa";
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://"+host+":"+port+"/"+db_name+"", ""+username+"", ""+password+"");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
            return connection;
        }
    }
}