/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasesJavas;

/**
 *
 * @author Diogo
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionSQL {
    private static final String URL = "jdbc:postgresql://localhost:5432/PizzaDatabase";
    private static final String USUARIO = "postgres";
    private static final String CONTRASENA = "123";

    public static Connection getConexion() throws SQLException {
        Connection conexion = null;
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException e) {
            System.err.println("Error al cargar el controlador de PostgreSQL: " + e.getMessage());
        }
        return conexion;
    }
}

/*

public class ConexionSQL {
    private static final String URL = "jdbc:mysql://localhost:3306/PizzaDatabase?serverTimezone=UTC";
    private static final String USUARIO = "root"; // Cambia por tu usuario de MySQL
    private static final String CONTRASENA = "123"; // Cambia por tu contraseña de MySQL

    public static Connection getConexion() throws SQLException {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException e) {
            System.err.println("Error al cargar el controlador de MySQL: " + e.getMessage());
        }
        return conexion;
    }
}

*/
