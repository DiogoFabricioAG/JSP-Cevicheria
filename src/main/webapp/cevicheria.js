//INICIO DE SESION
const abrir_formulario = document.querySelector(".iniciando_sesion");
const cerrar_formulario = document.querySelector(".cerrando_sesion");
const formulario = document.querySelector(".Formulario");

abrir_formulario.addEventListener("click",function(){
    formulario.style.display="block";});

cerrar_formulario.addEventListener("click",function(){
    formulario.style.display="none";});

// REGISTRO
const abrir_formulario_registro = document.querySelector(".registrar_cuenta");
const formulario_registro = document.querySelector(".Formulario_registro");
const cerrar_formulario_registro = document.querySelector(".cerrando_registro");

abrir_formulario_registro.addEventListener("click", function () {
    // Cerrar el formulario de inicio de sesión
    formulario.style.display = "none";
    // Abrir el formulario de registro
    formulario_registro.style.display = "block";
});

cerrar_formulario_registro.addEventListener("click", function () {
    formulario_registro.style.display = "none";
});

//REALIZAR BUSQUEDA

function realizar_busqueda() {
    // Obtener el valor ingresado en la barra de búsqueda y convertirlo a minúsculas
    const valor_ingresado = document.querySelector('.barra_de_busqueda').value.toLowerCase();
    
    // Obtener todos los platos
    const platos = document.querySelectorAll('.imagen_plato');

    // Recorrer todos los platos y verificar si el texto ingresado está en el nombre del plato
    platos.forEach(plato => {
        const descripcion = plato.querySelector('.descripcion_del_plato').textContent.toLowerCase();

        // Si el nombre del plato contiene el texto ingresado, mostrarlo
        if (descripcion.includes(valor_ingresado)) {
            plato.style.display = 'block';  // Mostrar el plato
        } else {
            plato.style.display = 'none';   // Ocultar el plato
        }
    });
}


document.addEventListener("DOMContentLoaded", () => {
    const reservasButton = document.querySelector(".reservas");
    const modal = document.getElementById("modalReserva");
    const closeModal = document.querySelector(".close");
    const formReserva = document.getElementById("formReserva");

    const mesasDisponibles = {
        2: ["Mesa 1", "Mesa 2", "Mesa 3"],
        4: ["Mesa 4", "Mesa 5"],
        8: ["Mesa 6", "Mesa 7"],
        12: ["Mesa 8"]
    };

    reservasButton.addEventListener("click", () => {
        modal.style.display = "block";
    });

    closeModal.addEventListener("click", () => {
        modal.style.display = "none";
    });

    window.addEventListener("click", (event) => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

    formReserva.addEventListener("submit", (event) => {
        event.preventDefault();

        const fecha = document.getElementById("fecha").value;
        const hora = document.getElementById("hora").value;
        const asientos = parseInt(document.getElementById("asientos").value);
        const telefono = document.getElementById("telefono").value;

        const mesaAsignada = mesasDisponibles[asientos]?.shift();

        if (mesaAsignada) {
            alert(`Reserva confirmada:\nFecha: ${fecha}\nHora: ${hora}\nMesa: ${mesaAsignada}\nTeléfono: ${telefono}`);
            modal.style.display = "none";
        } else {
            alert("No hay mesas disponibles para la capacidad seleccionada.");
        }
    });
});

