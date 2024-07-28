<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Wall</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<style type="text/css">
.avatar-img {
        width: 30px; /* Ajusta el tama�o del avatar */
        height: 30px; /* Ajusta el tama�o del avatar */
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
                <span class="d-lg-none ms-2">Home</span> <!-- Texto para dispositivos pequeños -->
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
                <a href="/principal" class="btn btn-danger">Cancelar</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="./home.html">
                            <span class="material-symbols-outlined">
                                home
                            </span>
                            <span class="d-lg-none">Home</span>

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/foro/temas">
                            <span class="material-symbols-outlined">
                                groups
                            </span>
                            <span class="d-lg-none">Grupos</span>
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
                                <a class="dropdown-item" href="#">
                                    <span class="material-icons-outlined">
                                        cerrar Sesion
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">
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
        <div class="col-6">
            <a class="btn btn-danger" href="/logout">Cerrar sesión</a>
            <a href="/foro/temas/" class="btn btn-dark">Volver a foros</a>
            <a href="/principal" class="btn btn-dark">Volver al principio</a>
            <h2>Message Wall</h2>
            <div class="border mb-3">
                <!-- mostrar mensajes -->
                <c:forEach items="${foro.foroMensajes}" var="msg">
                    <div class="message-container">
                        <p>
                            <a href="/perfil/${msg.autor.id}">
                                <!-- Muestra el avatar del autor -->
                                <c:choose>
                                    <c:when test="${not empty msg.autor.avatar}">
                                        <img src="/img/${msg.autor.avatar}" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
                                    </c:when>
                                    <c:otherwise>
                                    <c:if test="${msg.autor.id == 1}">
                                        <img src="/img/adminBlank.jpg" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
                                    </c:if>
                                    <c:if test="${msg.autor.id > 1}">
                                    	<img src="/img/studentBlank.jpg" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
                                    </c:if>
                                    </c:otherwise>
                                </c:choose>
                                ${msg.autor.nombre}
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

           <form:form action="/crear/mensaje" method="post" modelAttribute="mensaje" enctype="multipart/form-data">
			    <form:errors path="contenido" class="text-danger" />
			    <form:label path="contenido">Añadir comentario:</form:label>
			    <form:textarea path="contenido" class="form-control"></form:textarea>
			    <form:hidden path="autor.id" value="${userInSession.id}" />
			    <form:hidden path="foroCarrera.id" value="${foro.id}" />
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