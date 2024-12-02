<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserva Confirmada</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #4CAF50;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .confirmation-message {
            font-size: 1.2em;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .details {
            border-top: 2px solid #4CAF50;
            margin-top: 20px;
            padding-top: 20px;
        }
        .details p {
            font-size: 1em;
            color: #333;
        }
        .details .highlight {
            font-weight: bold;
            color: #4CAF50;
        }
        .button-container {
            text-align: center;
            margin-top: 30px;
        }
        .button-container a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button-container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>¡Reserva Confirmada!</h1>

        <div class="confirmation-message">
            <p>Tu reserva ha sido realizada con éxito. Aquí están los detalles de tu reserva:</p>
        </div>

        <div class="details">
            <p><span class="highlight">Número de reserva:</span> <%= request.getAttribute("numero_reserva") %></p>
            <p><span class="highlight">Fecha de la reserva:</span> <%= request.getAttribute("fecha_reserva") %></p>
            <p><span class="highlight">Hora de inicio:</span> <%= request.getAttribute("hora_inicio") %></p>
            <p><span class="highlight">Hora final:</span> <%= request.getAttribute("hora_final") %></p>
            <p><span class="highlight">Número de personas:</span> <%= request.getAttribute("numero_personas") %></p>
            <p><span class="highlight">Peticiones especiales:</span> <%= request.getAttribute("peticiones_especiales") != null ? request.getAttribute("peticiones_especiales") : "Ninguna" %></p>
            <p><span class="highlight">Mesa asignada:</span> <%= request.getAttribute("mesa_id") %></p>
        </div>

        <div class="button-container">
            <a href="<%= request.getContextPath() %>/index.jsp">Volver a la página principal</a>
        </div>
    </div>

</body>
</html>
