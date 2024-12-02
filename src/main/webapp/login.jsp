<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="login.css">
    <title>Iniciar sesión</title>
</head>
<body>
    <div class="form-container">
        <h2>Iniciar sesión</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="correo" placeholder="Correo electrónico" required="true" />
            <input type="password" name="contrasena" placeholder="Contraseña" required="true" />
            <button type="submit">Iniciar sesión</button>
        </form>
        <div>
            <p>¿No tienes cuenta? <a href="registrousuario.jsp">Regístrate</a></p>
        </div>
    </div>
</body>
</html>
