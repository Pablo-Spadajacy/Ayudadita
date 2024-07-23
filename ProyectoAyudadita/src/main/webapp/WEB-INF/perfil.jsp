<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<meta charset="ISO-8859-1">
<title>Perfil de ${usuario.nombre}</title>
<style>
	.avatar-img {
        width: 600px; /* Ajusta el tamaño del avatar */
        height: 600px; /* Ajusta el tamaño del avatar */
        border-radius: 50%; /* Hace que la imagen sea redonda */
        margin-right: 10px; /* Espacio entre la imagen y el nombre */
    }
    .avatarNoDefault {
    	width: 800px;
    	margin-right: 10px;
    }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/principal">
                <span class="material-icons-outlined">
                    home
                </span>
                <span class="d-lg-none ms-2">Home</span> <!-- Texto para dispositivos pequeÃ±os -->
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/home">
                            <span class="material-symbols-outlined">
                                home
                            </span>
                            <span class="d-lg-none">Home</span>

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/foro/temas/">
                            <span class="material-symbols-outlined">
                                groups
                            </span>
                            <span class="d-lg-none">Foros</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./store.html">
                            <span class="material-symbols-outlined">
                                store
                            </span>
                            <span class="d-lg-none">Tienda</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./messenges.html">
                            <span class="material-symbols-outlined">
                                chat
                            </span>
                            <span class="d-lg-none">Chat</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="material-symbols-outlined">
                                account_circle
                            </span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="/logout">
                                    <span class="material-icons-outlined">
                                        Cerrar sesión
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/perfil/${userInSession.id}">
                                    <span class="material-icons-outlined">
                                        Perfil
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/editarPerfil">
                                    <span class="material-icons-outlined">
                                       Editar Perfil
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<div class = "container">
		<h1>Nombre: ${usuario.nombre} ${usuario.apellido}</h1>
		<h2>Facultad: ${usuario.facultad}</h2>
		<h3>Carrera: ${usuario.carrera}</h3>
		<c:choose>
			<c:when test="${not empty usuario.avatar}">
				<h4>Avatar del Usuario</h4>
				<img src="/img/${usuario.avatar}" alt="${usuario.avatar}" class="avatarNoDefault">
			</c:when>
			<c:otherwise>
              <c:if test="${usuario.id == 1}">
              	  <h4>Este admin no tiene foto</h4>
                  <img src="/img/adminBlank.jpg" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
              </c:if>
              <c:if test="${usuario.id > 1}">
          	    <h4>Este usuario no tiene foto</h4>
              	<img src="/img/studentBlank.jpg" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
              </c:if>
            </c:otherwise>
		</c:choose>
		<br>
		<h2>¿No te gusta tu avatar?, ¡Cambialo!</h2>
		<form action="/imagen" method="post" enctype="multipart/form-data">
	        <input type="file" name="file" accept="image/*" required />
	        <br/><br/>
	        
	        <button type="submit">Cargar Imagen</button>
		</form>	
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>