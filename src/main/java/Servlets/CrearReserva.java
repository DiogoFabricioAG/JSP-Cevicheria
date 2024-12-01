package Servlets;

import ClasesJavas.ConexionSQL;
import ClasesJavas.Reserva;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CrearReserva", urlPatterns = {"/CrearReserva"})
public class CrearReserva extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = ConexionSQL.getConexion()) {
            int usuarioId = Integer.parseInt(request.getParameter("usuario_id"));
            String fecha = request.getParameter("fecha_reserva");
            String hora = request.getParameter("hora_reserva");
            int mesaId = Integer.parseInt(request.getParameter("mesa_id"));
            int numeroPersonas = Integer.parseInt(request.getParameter("numero_personas"));
            String peticionesEspeciales = request.getParameter("peticiones_especiales");

            // Combinar fecha y hora en un Timestamp
            String fechaHora = fecha + " " + hora + ":00"; // Aseguramos el formato HH:mm:ss
            Timestamp fechaReserva = Timestamp.valueOf(fechaHora);

            String query = "INSERT INTO reservas (reservas_usuario_id, reservas_fecha_reserva, reservas_numero_personas, reservas_peticiones_especiales, reservas_hora_reserva, reservas_mesa_id) "
                         + "VALUES (?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, usuarioId);
                stmt.setTimestamp(2, fechaReserva);
                stmt.setInt(3, numeroPersonas);
                stmt.setString(4, peticionesEspeciales);
                stmt.setTimestamp(5, fechaReserva);
                stmt.setInt(6, mesaId);
                
                stmt.executeUpdate();
                response.sendRedirect("confirmacion.jsp");
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El formato de la fecha u hora es inválido.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al crear la reserva.");
        }
    }
}
