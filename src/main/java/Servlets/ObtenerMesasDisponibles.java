

package Servlets;

import ClasesJavas.ConexionSQL;
import ClasesJavas.Mesa;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "ObtenerMesasDisponibles", urlPatterns = {"/ObtenerMesasDisponibles"})
public class ObtenerMesasDisponibles extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fechaReserva = request.getParameter("fecha_reserva");
        String horaInicio = request.getParameter("hora_inicio");
        String horaFin = request.getParameter("hora_fin");

        if (fechaReserva == null || horaInicio == null || horaFin == null || 
            fechaReserva.isEmpty() || horaInicio.isEmpty() || horaFin.isEmpty()) {
            request.setAttribute("mesasDisponibles", null);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/mesasDisponibles.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try (Connection conn = ConexionSQL.getConexion()) {
            String query = "SELECT m.mesas_id, m.mesas_numero, m.mesas_capacidad "
                         + "FROM mesas m "
                         + "WHERE m.mesas_id NOT IN ( "
                         + "    SELECT r.reservas_mesa_id "
                         + "    FROM reservas r "
                         + "    WHERE r.reservas_fecha_reserva = ?::date "
                         + "    AND r.reservas_hora_reserva BETWEEN ?::timestamp AND ?::timestamp "
                         + ") "
                         + "AND NOT EXISTS ( "
                         + "    SELECT 1 "
                         + "    FROM reservas r "
                         + "    WHERE r.reservas_mesa_id = m.mesas_id "
                         + "    AND r.reservas_hora_reserva + r.reservas_tiempo_maximo > ?::timestamp "
                         + "    AND r.reservas_hora_reserva < ?::timestamp "
                         + ");";

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, fechaReserva);
                stmt.setString(2, fechaReserva + " " + horaInicio);
                stmt.setString(3, fechaReserva + " " + horaFin);
                stmt.setString(4, fechaReserva + " " + horaInicio);
                stmt.setString(5, fechaReserva + " " + horaFin);

                try (ResultSet rs = stmt.executeQuery()) {
                    List<Mesa> mesasDisponibles = new ArrayList<>();
                    while (rs.next()) {
                        mesasDisponibles.add(new Mesa(
                            rs.getInt("mesas_id"), 
                            rs.getInt("mesas_numero"), 
                            rs.getInt("mesas_capacidad")
                        ));
                    }

                    request.setAttribute("mesasDisponibles", mesasDisponibles);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/mesasDisponibles.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en la base de datos.");
        }
    }
}

