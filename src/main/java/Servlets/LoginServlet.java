/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import ClasesJavas.ConexionSQL;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        try (Connection conn = ConexionSQL.getConexion()) {
            String query = "SELECT usuarios_contrasena_hash FROM usuarios WHERE usuarios_correo = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, correo);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String contrasenaHashAlmacenada = rs.getString("usuarios_contrasena_hash");

                        if (BCrypt.checkpw(contrasena, contrasenaHashAlmacenada)) {
                            HttpSession session = request.getSession();
                            session.setAttribute("user", correo);
                            response.sendRedirect("inicio");
                        } else {
                            response.sendRedirect("login.jsp?error=invalid_credentials");
                        }
                    } else {
                        // Usuario no encontrado
                        response.sendRedirect("login.jsp?error=invalid_credentials");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=database_error");
        }
    }
}
