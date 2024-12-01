<%@ page import="java.util.List" %>
<%@ page import="ClasesJavas.Mesa" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Seleccionar Mesas Disponibles</title>
</head>
<body>
    <h1>Seleccionar Mesas Disponibles</h1>
    
    <form action="ObtenerMesasDisponibles" method="get">
        <label for="fecha_reserva">Fecha de Reserva:</label>
        <input type="date" id="fecha_reserva" name="fecha_reserva" required><br><br>

        <label for="hora_inicio">Hora de Inicio:</label>
        <input type="time" id="hora_inicio" name="hora_inicio" required><br><br>

        <label for="hora_fin">Hora de Fin:</label>
        <input type="time" id="hora_fin" name="hora_fin" required><br><br>

        <input type="submit" value="Buscar Mesas Disponibles">
    </form>

    <h2>Mesas Disponibles</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Mesas Número</th>
                <th>Capacidad</th>
                <th>Reservar</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Mesa> mesasDisponibles = (List<Mesa>) request.getAttribute("mesasDisponibles");
                if (mesasDisponibles == null || mesasDisponibles.isEmpty()) {
            %>
                <tr>
                    <td colspan="3">No hay mesas disponibles.</td>
                </tr>
            <% 
                } else {
                    for (Mesa mesa : mesasDisponibles) {
            %>
                <tr>
                    <td><%= mesa.getNumero() %></td>
                    <td><%= mesa.getCapacidad() %></td>
                    <td>
                        <form action="CrearReserva" method="post">
                            <input type="hidden" name="mesa_id" value="<%= mesa.getId() %>">
                            <input type="hidden" name="fecha_reserva" value="<%= request.getParameter("fecha_reserva") %>">
                            <input type="hidden" name="hora_reserva" value="<%= request.getParameter("hora_inicio") %>">
                            <input type="text" name="numero_personas" placeholder="Número de personas" required>
                            <input type="text" name="peticiones_especiales" placeholder="Peticiones especiales">
                            <input type="hidden" name="usuario_id" value="1"><!-- Sustituir con el ID real del usuario -->
                            <button type="submit">Reservar</button>
                        </form>
                    </td>
                </tr>
            <% 
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
