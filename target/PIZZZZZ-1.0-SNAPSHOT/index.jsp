<%@ page import="java.util.*" %>
<%@ page import="ClasesJavas.Producto" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="cevicheria.css">
    <title>Cevichería Bajo el Mar</title>
    <style>
    /* Estilos para el modal */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
        padding-top: 60px;
    }

    /* Estilo para el contenido del modal */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 90%;
        max-width: 900px; /* Máximo ancho */
        border-radius: 8px;
    }

    /* Botón para cerrar el modal */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
    }

    /* Estilos de la cuadrícula para los productos */
    .productos-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 15px;
        max-height: 400px;
        overflow-y: auto;
        padding: 10px;
    }

    .producto {
        background-color: #f9f9f9;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease-in-out;
    }

    .producto:hover {
        transform: scale(1.05);
    }

    .producto img {
        width: 100%;
        height: auto;
        border-radius: 8px;
    }

    .producto p {
        font-size: 14px;
        margin-top: 10px;
    }

    .producto input[type="number"] {
        width: 50px;
        padding: 5px;
        margin-top: 10px;
        text-align: center;
    }

    .producto input[type="checkbox"] {
        margin-top: 10px;
    }

    .producto button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
        margin-top: 10px;
        font-size: 14px;
    }

    .producto button:hover {
        background-color: #45a049;
    }

    /* Para hacer que el modal ocupe toda la pantalla si hay muchos productos */
    @media (max-width: 768px) {
        .modal-content {
            width: 95%;
        }

        .productos-grid {
            grid-template-columns: repeat(2, 1fr); /* Dos columnas en pantallas más pequeñas */
        }
    }
</style>

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

        <!-- Botón para abrir el modal de reserva -->
        <div class="servicios">
            <h2 class="titulo_servicios">SERVICIOS:</h2>
            <div class="opciones_de_servicios">
                <button class="reservas" onclick="openModal()">Reservar</button>
                <button class="recojo">Para Recoger</button>
                <button class="Delivery">Delivery</button>
            </div>
        </div>

        <!-- Modal de Reserva -->
            <div id="reservarModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Selecciona tus productos para la reserva</h2>
        <form action="ReservarServlet" method="POST">
            <div class="productos-grid">
                <% 
                    if (productos != null && !productos.isEmpty()) {
                        for (Producto producto : productos) {
                %>
                <div class="producto">
                    <img src="IMAGENES/<%= producto.getProductoImagen() %>" alt="<%= producto.getProductoNombre() %>"/>
                    <p><%= producto.getProductoNombre() %></p>
                    <p>S/<%= producto.getProductoPrecio() %></p>

                    <!-- Campo de cantidad -->
                    <input type="number" name="cantidad_<%= producto.getProductoId() %>" value="1" min="1" max="10">

                    <!-- Checkbox para indicar si se va a comprar este producto -->
                    <input type="checkbox" name="productos" value="<%= producto.getProductoId() %>"> Comprar
                </div>
                <% 
                    }
                }
                %>
            </div>
            <button type="submit">Confirmar Reserva</button>
        </form>
    </div>
</div>


                    <div class="parte3">
            <div class="parte1_de_parte3">
            <div class="direccion">
                <h2>Direccion:</h2>
                <p>Encuentranos en nuestras distintas sedes:</p>
                <ol>
                    <li>Av. 12 de octubre 835, SMP</li>
                    <li>AV. Mayor di San Marcos 246, LOS OLIVOS</li>
                    <li>Av._______</li>
                    <li>Av._______</li>
                </ol>
            </div>

            <div class="horarios">
                <h2>Horarios</h2>
                <ul>
                <li>De lunes a Domingo de 11 am a 8pm</li>
                </ul> 
            </div>
            <div class="contacto">
                <h2>Contacto</h2>
                <ul>
                    <li>(01) 6236283</li>
                </ul> 
                <p>cevicheria_bajo_el_mar@gmail.com</p>
                <p>Politicas de privacidad</p>
                
            </div>
            <div class="metodo_de_pago"><img class="img" src="IMAGENES/logo_de_cevicheria.jpeg"></div>
        </div>
        <div class="parte2_de_parte3">
            <h2>SIGUENOS EN: </h2>
            <div class="iconos_de_redes">
                <i class="fa-brands fa-facebook" style="color: #000000;"></i>
                <i class="fa-brands fa-instagram" style="color: #000000;"></i>
                <i class="fa-brands fa-whatsapp" style="color: #000000;"></i>
                <i class="fa-solid fa-envelope" style="color: #000000;"></i>
            </div>
        </div>
        
        </div>
    </div>

    <script>
        // Función para abrir el modal
        function openModal() {
            document.getElementById("reservarModal").style.display = "block";
        }

        // Función para cerrar el modal
        function closeModal() {
            document.getElementById("reservarModal").style.display = "none";
        }

        // Cerrar el modal si el usuario hace clic fuera del contenido del modal
        window.onclick = function(event) {
            if (event.target == document.getElementById("reservarModal")) {
                closeModal();
            }
        }
    </script>
    <script src="cevicheria.js"></script>
</body>
</html>
