/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import ClasesJavas.ConexionSQL;
import ClasesJavas.Producto;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "inicio", urlPatterns = {"/inicio"})
public class ObtenerProductos extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productos = new ArrayList<>();
        String query = "SELECT * FROM productos";

        try (Connection conn = ConexionSQL.getConexion();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Producto producto = new Producto(
                    rs.getInt("producto_id"),
                    rs.getString("producto_nombre"),
                    rs.getBigDecimal("producto_precio"),
                    rs.getString("producto_imagen"),
                    rs.getString("producto_categoria")
                );
                productos.add(producto);
            }

            // Agregar la lista de productos al atributo de la solicitud
            request.setAttribute("productos", productos);

            // Redirigir a la página principal (index.jsp)
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al obtener los productos", e);
        }
    }
}
