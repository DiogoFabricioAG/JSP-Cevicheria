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


@WebServlet(name = "LoginWeb", urlPatterns = {"/LoginWeb"})
public class LoginWeb extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (credentialsAreValid(username, password)) {
            // Si las credenciales son válidas, guardar al usuario en la sesión
            request.getSession().setAttribute("user", username);
            response.sendRedirect("index.jsp");  // Redirigir a la página principal
        } else {
            request.setAttribute("errorMessage", "Credenciales incorrectas");
            request.getRequestDispatcher("/index.jsp").forward(request, response);  // Redirigir al JSP
        }
    }

    private boolean credentialsAreValid(String username, String password) {
        String query = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        
        try (Connection conn = ConexionSQL.getConexion();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();  // Si se encuentra un usuario con esas credenciales, se devuelve true
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // En caso de error, devuelve false
        }
    }

}