<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<title>Bienvenido ${userInSession.nombre}</title>
<style type="text/css">
.avatar-img {
        width: 30px; /* Ajusta el tamaño del avatar */
        height: 30px; /* Ajusta el tamaño del avatar */
        border-radius: 50%; /* Hace que la imagen sea redonda */
        margin-right: 10px; /* Espacio entre la imagen y el nombre */
    }
.message-container {
    margin-bottom: 15px; /* Espacio entre los mensajes */
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
	<div class="container">
		<header class="d-flex justify-content-between">
			<h1>Bienvenido ${userInSession.nombre} !</h1>
			
		</header>
		<div>
			<div class="mt-3">
			<h2 class="mb-1">Compañeros de tu facultad</h2>			
			<c:forEach items="${listaAlumnos}" var="alumno">
					<c:if test="${userInSession.facultad == alumno.facultad && userInSession.id != alumno.id}">
						<h3>-Nombre: ${alumno.nombre} ${alumno.apellido}</h3>
						<h3>-Facultad/Universidad: ${alumno.facultad}</h3>
						<h3>-Carrera: ${alumno.carrera}</h3>
					</c:if>
			</c:forEach><!-- MAXIMO 3 ALUMNOS  -->
			</div>
			<div class="mt-3">
			<h2 class="mb-1">Compañeros de tu carrera</h2>
				<c:forEach items="${listaAlumnos}" var="alumno">
					<c:if test="${userInSession.carrera == alumno.carrera && userInSession.id != alumno.id}">
						<h3>-Nombre: ${alumno.nombre} ${alumno.apellido}</h3>
						<h3>-Facultad/Universidad: ${alumno.facultad}</h3>
						<h3>-Carrera: ${alumno.carrera}</h3>
					</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
	<h4>${userInSession.avatar}</h4>
	<img src="/img/${userInSession.avatar}" alt="${userInSession.avatar}">
	<div class="container">
    <div class="col-6">
        <a class="btn btn-danger" href="/logout">Cerrar sesión</a>
        <a href="/foro/temas/" class="btn btn-dark">Volver a foros</a>
        <a href="/principal" class="btn btn-dark">Volver al principio</a>
        <h2>Message Wall</h2>
        <div class="border mb-3">
            <!-- mostrar mensajes -->
            <c:forEach items="${foro.foroGeneralMensajes}" var="msg">
                <div class="message-container">
                    <p>
                        <a href="/perfil/${msg.autorForoGeneral.id}">
                            <!-- Muestra el avatar del autor -->
                            <c:choose>
                                <c:when test="${not empty msg.autorForoGeneral.avatar}">
                                    <img src="/img/${msg.autorForoGeneral.avatar}" alt="Avatar de ${msg.autorForoGeneral.nombre}" class="avatar-img"/>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${msg.autorForoGeneral.id == 1}">
                                        <img src="/img/adminBlank.jpg" alt="Avatar de ${msg.autorForoGeneral.nombre}" class="avatar-img"/>
                                    </c:if>
                                    <c:if test="${msg.autorForoGeneral.id > 1}">
                                        <img src="/img/studentBlank.jpg" alt="Avatar de ${msg.autorForoGeneral.nombre}" class="avatar-img"/>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            ${msg.autorForoGeneral.nombre}
                        </a> dice:
                        <c:choose>
                            <c:when test="${not empty msg.urlFotoForo}">
                                <img src="/img/${msg.urlFotoForo}" alt="Imagen enviada" class="img-fluid" />
                            </c:when>
                            <c:otherwise>
                                ${msg.contenido}
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </c:forEach>
        </div>

        <form:form action="/crear/mensaje/foroGeneral" method="post" modelAttribute="mensajeForoGeneral" enctype="multipart/form-data">
            <form:errors path="contenido" class="text-danger" />
            <form:label path="contenido">Añadir comentario:</form:label>
            <form:textarea path="contenido" class="form-control"></form:textarea>
            <form:hidden path="autorForoGeneral.id" value="${userInSession.id}" />
            <input type="submit" value="Enviar" class="btn btn-info">
            <br/><br/>
            <input type="file" name="file" accept="image/*">
        </form:form>
    </div>
</div>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>