/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import ClasesJavas.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Diogo
 */
@WebServlet(name = "RegistrarUsuario", urlPatterns = {"/RegistrarUsuario"})
public class RegistrarUsuario extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreUsuario = request.getParameter("nombreUsuario");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        String contrasenaHash = BCrypt.hashpw(contrasena, BCrypt.gensalt());

        try (Connection conexion = ConexionSQL.getConexion()) {
            String query = "INSERT INTO usuarios (usuarios_nombre_usuario, usuarios_correo, usuarios_contrasena_hash) VALUES (?, ?, ?)";
            PreparedStatement stmt = conexion.prepareStatement(query);
            stmt.setString(1, nombreUsuario);
            stmt.setString(2, correo);
            stmt.setString(3, contrasenaHash);

            stmt.executeUpdate();
            response.getWriter().println("Usuario registrado exitosamente.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al registrar el usuario: " + e.getMessage());
        }
    }
}

