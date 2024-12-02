/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import ClasesJavas.ConexionSQL;
import ClasesJavas.OrdenProducto;

import java.io.IOException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "/ReservarServlet", urlPatterns = {"/ReservarServlet"})
public class ReservarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el correo y la lista de productos del formulario
        String correo = (String) request.getSession().getAttribute("user");
        if (correo == null) {
            response.sendRedirect("login.jsp?error=not_logged_in");
            return;
        }

        // Obtener los productos seleccionados y las cantidades del formulario
        String[] productosSeleccionados = request.getParameterValues("productos");
        if (productosSeleccionados == null || productosSeleccionados.length == 0) {
            response.sendRedirect("reserva.jsp?error=no_products_selected");
            return;
        }

        // Procesar las cantidades asociadas a cada producto
        List<Integer> cantidades = new ArrayList<>();
        for (String productoIdStr : productosSeleccionados) {
            String cantidadStr = request.getParameter("cantidad_" + productoIdStr); // Obtén la cantidad para este producto
            if (cantidadStr != null) {
                try {
                    int cantidad = Integer.parseInt(cantidadStr);
                    cantidades.add(cantidad);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendRedirect("reserva.jsp?error=invalid_quantity");
                    return;
                }
            }
        }

        int usuarioId = getUserId(correo);
        if (usuarioId == -1) {
            response.sendRedirect("login.jsp?error=invalid_user");
            return;
        }

        try (Connection conn = ConexionSQL.getConexion()) {
            conn.setAutoCommit(false);

            // Insertar la orden
            String sqlOrden = "INSERT INTO orden (usuario_id) VALUES (?) RETURNING orden_id";
            try (PreparedStatement stmtOrden = conn.prepareStatement(sqlOrden)) {
                stmtOrden.setInt(1, usuarioId);

                try (ResultSet rsOrden = stmtOrden.executeQuery()) {
                    if (rsOrden.next()) {
                        int ordenId = rsOrden.getInt("orden_id");

                        // Lista para almacenar los objetos OrdenProducto con precios
                        List<OrdenProducto> productosOrden = new ArrayList<>();

                        for (int i = 0; i < productosSeleccionados.length; i++) {
                            int productoId = Integer.parseInt(productosSeleccionados[i]);
                            int cantidad = cantidades.get(i);

                            // Obtener el precio del producto desde la base de datos
                            double precioUnitario = obtenerPrecioProducto(productoId, conn);

                            // Crear objeto OrdenProducto y agregarlo a la lista
                            OrdenProducto ordenProducto = new OrdenProducto();
                            ordenProducto.setProductoId(productoId);
                            ordenProducto.setCantidad(cantidad);
                            ordenProducto.setPrecioUnitario(precioUnitario); // Asignar el precio
                            productosOrden.add(ordenProducto);

                            // Insertar en la tabla orden_productos
                            String sqlOrdenProducto = "INSERT INTO orden_productos (orden_id, producto_id, cantidad) VALUES (?, ?, ?)";
                            try (PreparedStatement stmtOrdenProducto = conn.prepareStatement(sqlOrdenProducto)) {
                                stmtOrdenProducto.setInt(1, ordenId);
                                stmtOrdenProducto.setInt(2, productoId);
                                stmtOrdenProducto.setInt(3, cantidad);
                                stmtOrdenProducto.executeUpdate();
                            }
                        }

                        // Obtener los productos de la orden recién creada
                        List<OrdenProducto> productosDeLaOrden = obtenerProductosDeLaOrden(ordenId, conn);

                        // Pasar la lista de productos y la orden al JSP de confirmación
                        request.setAttribute("productos", productosDeLaOrden);
                        request.setAttribute("orden", ordenId); // Pasar el ID de la orden

                        conn.commit();

                        // Redirigir al JSP de confirmación
                        request.getRequestDispatcher("reservaConfirmacion.jsp").forward(request, response);  
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                conn.rollback();  // Deshacer los cambios si hay un error
                response.sendRedirect("reserva.jsp?error=database_error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reserva.jsp?error=database_error");
        }
    }

    private List<OrdenProducto> obtenerProductosDeLaOrden(int ordenId, Connection conn) throws SQLException {
    List<OrdenProducto> productos = new ArrayList<>();

    // Actualizar la consulta para incluir nombre y imagen del producto
    String sql = "SELECT op.producto_id, op.cantidad, p.producto_precio, p.producto_nombre, p.producto_imagen "
               + "FROM orden_productos op "
               + "JOIN productos p ON op.producto_id = p.producto_id "
               + "WHERE op.orden_id = ?";

    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, ordenId);

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int productoId = rs.getInt("producto_id");
                int cantidad = rs.getInt("cantidad");
                double precio = rs.getDouble("producto_precio");
                String nombreProducto = rs.getString("producto_nombre");
                String imagenProducto = rs.getString("producto_imagen");

                // Crear el objeto OrdenProducto y agregarlo a la lista
                OrdenProducto producto = new OrdenProducto(ordenId, productoId, cantidad);
                producto.setPrecioUnitario(precio);
                producto.setNombreProducto(nombreProducto);
                producto.setImagenProducto(imagenProducto);
                productos.add(producto);
            }
        }
    }

    return productos;
}


    private int getUserId(String correo) {
        int userId = -1;
        try (Connection conn = ConexionSQL.getConexion()) {
            String sql = "SELECT usuarios_id FROM usuarios WHERE usuarios_correo = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, correo);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        userId = rs.getInt("usuarios_id");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }

    private double obtenerPrecioProducto(int productoId, Connection conn) throws SQLException {
        double precio = 0.0;
        String sql = "SELECT producto_precio FROM productos WHERE producto_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productoId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    precio = rs.getDouble("producto_precio");
                }
            }
        }
        return precio;
    }
}
