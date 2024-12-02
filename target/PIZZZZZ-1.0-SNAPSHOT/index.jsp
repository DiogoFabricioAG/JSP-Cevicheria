<%@ page import="java.util.*" %>
<%@ page import="ClasesJavas.Producto" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="cevicheria.css">
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Cevichería Bajo el Mar</title>
</head>
<body>
    <div class="parte_contenedora">
        <div class="parte1">
            <div class="imagen_de_empresa">
                <img class="imagen" src="IMAGENES/logo_de_cevicheria.jpeg">
            </div>
            <div class="caja_de_texto_y_sesion">
                <div class="caja_barra_de_busqueda">
                    <input type="text" class="barra_de_busqueda" placeholder="Hola, ¿Qué estás buscando?" oninput="realizar_busqueda()" required=""/>
                    <div class="lupa">
                        <button class="boton_lupa">
                            <i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i>
                        </button>
                    </div>
                </div>
                <h1>Bienvenido a la aplicación</h1>
                <p>Usuario: <%= session.getAttribute("user") %></p>
                <% 
                    String user = (String) session.getAttribute("user");
                    if (user != null) {
                %>
                    <button class="iniciando_sesion" type="button" onclick="window.location.href='LogoutServlet'">Cerrar Sesión <i class="fa-regular fa-user" style="color: #ffffff;"></i></button>
                <% 
                    } else {
                %>
                    <button class="iniciando_sesion" type="button" onclick="window.location.href='login.jsp'">Iniciar Sesión <i class="fa-regular fa-user" style="color: #ffffff;"></i></button>
                <% 
                    }
                %>
            </div>
        </div>
            

        <div class="parte2">
            <div class="caja_de_imagen_plato">
                <% 
                    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                    if (productos != null && !productos.isEmpty()) {
                        for (Producto producto : productos) {
                %>
                    <div class="imagen_plato">
                        <div class="plato">
                            <img class="img_plato" src="IMAGENES/<%= producto.getProductoImagen() %>" alt="<%= producto.getProductoNombre() %>"/>
                        </div>
                        <div class="descripcion_del_plato"><%= producto.getProductoNombre() %></div>
                        <div class="precio_del_plato">S/<%= producto.getProductoPrecio() %></div>
                        <div class="comprar_aqui">
                            <button class="boton_de_pedir_comida">Pedir Aquí</button>
                        </div>
                    </div>
                <% 
                        }
                    } else { 
                %>
                    <p>No hay productos disponibles en este momento.</p>
                <% 
                    }
                %>
            </div>
        </div>

        <div class="parte3">
            <div class="direccion">
                <h2>Direccion:</h2>
                <p>Encuentranos en nuestras distintas sedes:</p>
                <ol>
                    <li>Av. 12 de octubre 835, SMP</li>
                    <li>AV. Mayor di San Marcos 246, LOS OLIVOS</li>
                </ol>
            </div>
        </div>
    </div>
</body>
</html>
