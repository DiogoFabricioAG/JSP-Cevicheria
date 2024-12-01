<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Inicio</title>
    </head>
    <body>
        <h1>Bienvenido a la Gestión de Mesas</h1>
        <% String hello = "Hello World! Desde JAVA"; %>
        <p><%= hello %></p>
        
        <!-- Botón para redirigir a la revisión de mesas disponibles -->
        <form action="ObtenerMesasDisponibles" method="get">
            <button type="submit">Revisar Mesas Disponibles</button>
        </form>
    </body>
</html>
