
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro</title>
        <link rel="stylesheet" href="register.css">
    </head>
    <body>
        <div class="form-container">
            <h1>Formulario de Registro</h1>
            <form action="RegistrarUsuario" method="POST">
                <label for="nombre">Nombre Completo:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Ejemplo: Juan" required>

                <label for="apellido">Apellido Completo:</label>
                <input type="text" id="apellido" name="apellido" placeholder="Ejemplo: Pérez" required>

                <label for="correo">Correo Electrónico:</label>
                <input type="email" id="correo" name="correo" placeholder="ejemplo@correo.com" required>

                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" placeholder="Ingrese su contraseña" required>

                <label for="repetirContrasena">Repetir Contraseña:</label>
                <input type="password" id="repetirContrasena" name="repetirContrasena" placeholder="Repita su contraseña" required>

                <button type="submit">Registrar</button>
            </form>
        </div>
    </body>
</html>

