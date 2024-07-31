// Obtén los elementos del DOM
const btnIniciarSesion = document.querySelector(".btn-subb");
const fondo = document.querySelector(".fondo");
const iconoCerrar = document.querySelector(".icono-cerrar i");
const registrarLink = document.querySelector(".registrar-link");
const loginLink = document.querySelector(".login-link");
const contenedorFormLogin = document.querySelector(".contenedor-form.login");
const contenedorFormRegistrar = document.querySelector(".contenedor-form.registrar");

// Función para mostrar el formulario de inicio de sesión
function mostrarFormularioLogin() {
    fondo.classList.add("active-btn");
    contenedorFormLogin.classList.add("active-form");
    contenedorFormRegistrar.classList.remove("active-form");
}

// Función para mostrar el formulario de registro
function mostrarFormularioRegistro() {
    fondo.classList.add("active-btn");
    contenedorFormLogin.classList.remove("active-form");
    contenedorFormRegistrar.classList.add("active-form");
}

// Evento para mostrar el formulario de inicio de sesión
btnIniciarSesion.addEventListener("click", mostrarFormularioLogin);

// Evento para cerrar el formulario
iconoCerrar.addEventListener("click", () => {
    fondo.classList.remove("active-btn");
});

// Evento para mostrar el formulario de registro
registrarLink.addEventListener("click", (e) => {
    e.preventDefault();
    mostrarFormularioRegistro();
});

// Evento para mostrar el formulario de inicio de sesión desde el enlace en el formulario de registro
loginLink.addEventListener("click", (e) => {
    e.preventDefault();
    mostrarFormularioLogin();
});
