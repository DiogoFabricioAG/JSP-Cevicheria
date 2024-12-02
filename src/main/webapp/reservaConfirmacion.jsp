<%@ page import="java.util.List" %>
<%@ page import="ClasesJavas.OrdenProducto" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmación de Reserva</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #4CAF50;
            color: white;
        }
        .product-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
        .total {
            font-size: 1.2em;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
        }
        .product-name {
            font-weight: bold;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        input, select {
            margin: 5px 0;
            padding: 10px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }
        input, select, textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            width: 100%;
        }
        textarea {
            resize: none;
            height: 80px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 0.9em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <h1>Confirmación de Reserva</h1>

    <div class="container">
        <p>Orden de compra ID: <%= request.getAttribute("orden") %></p>
        <p>Productos seleccionados:</p>

        <% 
            List<OrdenProducto> productos = (List<OrdenProducto>) request.getAttribute("productos");

            if (productos != null && !productos.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Imagen</th>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Total</th>
                </tr>

                <% 
                    for (OrdenProducto producto : productos) {
                %>
                    <tr>
                        <td><img src="IMAGENES/<%= producto.getImagenProducto()%>"  alt="<%= producto.getNombreProducto() %>" class="product-image"></td>
                        <td><%= producto.getNombreProducto() %></td>
                        <td><%= producto.getCantidad() %></td>
                        <td>S/<%= producto.getPrecioUnitario() %></td>
                        <td>S/<%= producto.getTotal() %></td>
                    </tr>
                <% 
                    }
                %>
            </table>

            <p class="total">Total de la reserva: S/ <%= productos.stream().mapToDouble(OrdenProducto::getTotal).sum() %></p>

            <!-- Formulario para confirmar la reserva -->
            <div class="container">
        <h1>Confirmar Reserva</h1>
        <form action="<%= request.getContextPath() %>/ConfirmarReservacionServlet" method="POST">
    <h2>Confirmar Reservación</h2>
    <div class="form-group">
        <label for="fecha_reserva">Fecha de Reservación:</label>
        <input type="date" id="fecha_reserva" name="fecha_reserva" required>
    </div>
    <div class="form-group">
        <select id="fecha_reserva_id" name="fecha_reserva_id" required>
                <option value="1">11:00 AM - 12:00 PM</option>
                <option value="2">12:00 PM - 01:00 PM</option>
                <option value="3">03:00 PM - 04:00 PM</option>
                <option value="4">05:00 PM - 06:00 PM</option>
                <option value="5">06:00 PM - 07:00 PM</option>
            </select>
    </div>
    <div class="form-group">
        <label for="numero_personas">Número de Personas:</label>
        <input type="number" id="numero_personas" name="numero_personas" min="1" required>
    </div>
    <div class="form-group">
        <label for="numero_celular">Número de Celular:</label>
        <input type="text" id="numero_celular" name="numero_celular" pattern="\d{9,15}" required>
        <small>Debe contener entre 9 y 15 dígitos.</small>
    </div>
    <div class="form-group">
        <label for="peticiones_especiales">Peticiones Especiales:</label>
        <textarea id="peticiones_especiales" name="peticiones_especiales"></textarea>
    </div>
    <button type="submit">Confirmar Reservación</button>
</form>
    </div>

       
    </div>
 <% 
            } else {
        %>
            <p>No se encontraron productos seleccionados.</p>
        <% 
            }
        %>
</body>
</html>

