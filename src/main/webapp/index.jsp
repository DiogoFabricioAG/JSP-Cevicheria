<%@ page import="java.util.*" %>
<%@page import="ClasesJavas.Producto" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="cevicheria.css">
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Cevicheria Bajo el Mar</title>
</head>
<body>
    <div class="parte_contenedora">
        <div class="redes_sociales"></div>
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

                <% 
                    String user = (String) session.getAttribute("user");  // Obtener el usuario de la sesión
                    if (user != null) {
                %>
                    <button class="iniciando_sesion" type="button" onclick="window.location.href='logout.jsp'">Cerrar Sesión <i class="fa-regular fa-user" style="color: #ffffff;"></i></button>
                <% 
                    } else {
                %>
                    <button class="iniciando_sesion" type="button" onclick="showLoginModal()">Iniciar Sesión <i class="fa-regular fa-user" style="color: #ffffff;"></i></button>
                <% 
                    }
                %>
                
                <!-- Modal Login -->
                <div class="Formulario">
                    <div class="caja_formulario">
                        <div class="caja_button_cerrando_sesion">
                            <button class="cerrando_sesion" onclick="closeLoginModal()">x</button>
                        </div>
                        <h2 class="titulo">INGRESA A TU CUENTA</h2>
                        <form action="LoginWeb" method="post"> <!-- Redirigir al servlet de login -->
                            <input type="text" class="Ingresar_correo" name="correo" placeholder="Ingrese su correo" required=""/>
                            <input type="password" class="Ingrese_contraseña" name="contrasena" placeholder="Ingrese su contraseña" required=""/>
                            <button class="cargar_cuenta" type="submit">Iniciar Sesión</button>
                        </form>
                        <div class="caja_registro">
                            <p>¿No tienes Cuenta?</p><a class="registrar_cuenta" href="register.jsp">Regístrate ahora</a>
                        </div>
                    </div>
                </div>

                <!-- Modal Registro -->
                <div class="Formulario_registro">
                    <div class="caja_formulario">
                        <div class="caja_button_cerrando_sesion">
                            <button class="cerrando_registro">x</button>
                        </div>
                        <h2 class="titulo">CREA UNA CUENTA</h2>
                        <form action="register.jsp" method="post">
                            <input type="text" class="Ingresar_nombre" name="nombre" placeholder="Ingrese su nombre completo" required=""/>
                            <input type="text" class="Ingresar_nombre" name="apellido" placeholder="Ingrese su apellido completo" required=""/>
                            <input type="email" class="Ingresar_correo_registro" name="correo" placeholder="Cree el correo de la cuenta" required=""/>
                            <input type="password" class="Ingresar_contraseña_registro" name="contrasena" placeholder="Cree una contraseña" required=""/>
                            <button class="cargar_cuenta_registro" type="submit">Registrarse</button>
                        </form>
                    </div>
                </div>
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

        <div class="servicios">
            <h2 class="titulo_servicios">SERVICIOS:</h2>
            <div class="opciones_de_servicios">
                <button class="reservas" onclick="showReservaModal()">Reservar</button>
                <button class="recojo">Para Recoger</button>
                <button class="Delivery">Delivery</button>
            </div>
        </div>

        <div id="modalReserva" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Reservar Mesa</h2>
                <form id="formReserva" action="reserva.jsp" method="post">
                    <label for="fecha">Fecha:</label>
                    <input type="date" id="fecha" name="fecha" required/>
                    
                    <label for="hora">Hora:</label>
                    <select id="hora" name="hora" required>
                        <option value="11-12pm">11 a 12 PM</option>
                        <option value="12-1pm">12 a 1 PM</option>
                        <option value="1-2pm">1 a 2 PM</option>
                        <option value="3-4pm">3 a 4 PM</option>
                        <option value="5-6pm">5 a 6 PM</option>
                    </select>
                    
                    <label for="asientos">Capacidad de asientos:</label>
                    <select id="asientos" name="asientos" required>
                        <option value="2">1-2 Asientos</option>
                        <option value="4">3-4 Asientos</option>
                        <option value="8">5-8 Asientos</option>
                        <option value="10">8-10 Asientos</option>
                        <option value="15">11-15 Asientos</option>
                    </select>
                    
                    <label for="telefono">Número de Teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" required placeholder="Ej. 1234567890"/>
                    
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
                    </ol>
                </div>

                <div class="horarios">
                    <h2>Horarios</h2>
                    <ul>
                        <li>De lunes a Domingo de 11 am a 8pm</li>
                    </ul> 
                </div>

                <div class="contacto">
                    <h2>Contactanos</h2>
                    <p>+51 999 555 111</p>
                    <p>+51 989 444 222</p>
                </div>
            </div>
        </div>
    </div>

    <script src="cevicheria.js"></script>
</body>
</html>
