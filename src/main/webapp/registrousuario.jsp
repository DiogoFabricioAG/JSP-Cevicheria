<%-- 
    Document   : registrousuario
    Created on : 1 dic. 2024, 13:06:09
    Author     : Diogo
--%>

<<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro</title>
    </head>
    <body>
        <h1>Formulario de Registro</h1>
        <form action="RegistrarUsuario" method="POST">
            <label>Nombre de Usuario:</label>
            <input type="text" name="nombreUsuario" required>
            <br>
            <label>Correo Electrónico:</label>
            <input type="email" name="correo" required>
            <br>
            <label>Contraseña:</label>
            <input type="password" name="contrasena" required>
            <br>
            <button type="submit">Registrar</button>
        </form>
    </body>
</html>
