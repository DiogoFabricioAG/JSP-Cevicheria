/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import ClasesJavas.ConexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ConfirmarReservacionServlet", urlPatterns = {"/ConfirmarReservacionServlet"})
public class ConfirmarReservacionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Datos enviados desde el formulario
        String fechaReserva = request.getParameter("fecha_reserva");
        int fechaReservaId = Integer.parseInt(request.getParameter("fecha_reserva_id"));
        int numeroPersonas = Integer.parseInt(request.getParameter("numero_personas"));
        String numeroCelular = request.getParameter("numero_celular");
        String peticionesEspeciales = request.getParameter("peticiones_especiales");
        String correo = (String) request.getSession().getAttribute("user");

        if (correo == null) {
            response.sendRedirect("login.jsp?error=not_logged_in");
            return;
        }

        int usuarioId = getUserId(correo);
        if (usuarioId == -1) {
            response.sendRedirect("login.jsp?error=invalid_user");
            return;
        }

        try (Connection conn = ConexionSQL.getConexion()) {
            conn.setAutoCommit(false);

            // Buscar una mesa adecuada
            int mesaId = obtenerMesaAdecuada(numeroPersonas, conn);
            if (mesaId == -1) {
                response.sendRedirect("reservaConfirmacion.jsp?error=no_available_tables");
                return;
            }

            // Crear la reserva
            String sqlReserva = "INSERT INTO reservas (reservas_usuario_id, reservas_numero_personas, reservas_dia, reservas_peticiones_especiales, reservas_fecha_reserva_id, reservas_mesa_id, reservas_numero, orden_id) "
                              + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sqlReserva)) {
                stmt.setInt(1, usuarioId);
                stmt.setInt(2, numeroPersonas);
                stmt.setDate(3, Date.valueOf(fechaReserva));
                stmt.setString(4, peticionesEspeciales != null ? peticionesEspeciales : null);
                stmt.setInt(5, fechaReservaId);
                stmt.setInt(6, mesaId);
                stmt.setString(7, numeroCelular); // Almacenar número de celular
                stmt.setInt(8, 1); // Ejemplo: Cambiar a un orden_id válido
                stmt.executeUpdate();
            }

            conn.commit();

            // Convertir el ID de fechaReservaId a rangos estáticos
            String[] horas = obtenerHorasEstaticas(fechaReservaId);

            // Pasar los detalles al JSP
            request.setAttribute("numero_reserva", numeroCelular);
            request.setAttribute("fecha_reserva", fechaReserva);
            request.setAttribute("mesa_id", mesaId);
            request.setAttribute("numero_personas", numeroPersonas);
            request.setAttribute("hora_inicio", horas[0]);
            request.setAttribute("hora_final", horas[1]);
            request.setAttribute("peticiones_especiales", peticionesEspeciales);

            request.getRequestDispatcher("reservaConfirmada.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reservaConfirmacion.jsp?error=database_error");
        }
    }

    private int obtenerMesaAdecuada(int numeroPersonas, Connection conn) throws SQLException {
        String sql = "SELECT m.mesas_id FROM mesas m "
                   + "JOIN tipo_mesa tm ON m.tipo_mesa_id = tm.tipo_mesa_id "
                   + "WHERE tm.tipo_mesa_texto = ? "
                   + "AND m.mesas_id NOT IN (SELECT reservas_mesa_id FROM reservas WHERE reservas_dia = ?) "
                   + "LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            String tipoMesa = tipoMesaPorPersonas(numeroPersonas);
            stmt.setString(1, tipoMesa);
            stmt.setDate(2, Date.valueOf("2024-12-05")); // Cambiar por la fecha seleccionada
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("mesas_id");
                }
            }
        }
        return -1; // No hay mesas disponibles
    }

    private String tipoMesaPorPersonas(int numeroPersonas) {
        if (numeroPersonas == 1) return "Mesa Individual";
        if (numeroPersonas == 2) return "Mesa para 2";
        if (numeroPersonas <= 4) return "Mesa para 4";
        return "Mesa Familiar";
    }

    private String[] obtenerHorasEstaticas(int fechaReservaId) {
        switch (fechaReservaId) {
            case 1:
                return new String[]{"11:00 AM", "12:00 PM"};
            case 2:
                return new String[]{"12:00 PM", "01:00 PM"};
            case 3:
                return new String[]{"03:00 PM", "04:00 PM"};
            case 4:
                return new String[]{"05:00 PM", "06:00 PM"};
            case 5:
                return new String[]{"06:00 PM", "07:00 PM"};
            default:
                return new String[]{"", ""};
        }
    }

    private int getUserId(String correo) {
        try (Connection conn = ConexionSQL.getConexion()) {
            String sql = "SELECT usuarios_id FROM usuarios WHERE usuarios_correo = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, correo);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt("usuarios_id");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
