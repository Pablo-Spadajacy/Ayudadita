<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <title>Bienvenido ${userInSession.nombre}</title>
    <style type="text/css">
    body {
        background-color: #ffffff; 
        background-image: linear-gradient(90deg, rgba(0,0,0,0.1) 1px, transparent 1px), 
                          linear-gradient(180deg, rgba(0,0,0,0.1) 1px, transparent 1px);
        background-size: 30px 30px; 
        background-repeat: repeat; 
    }
    .navbar {
        background-color: #bfab97; 
        color: #ffffff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .navbar .navbar-brand,
    .navbar .nav-link,
    .navbar .navbar-toggler-icon {
        color: #ffffff;
    }
    .container-fluid {
        margin-top: 20px;
    }
    .card {
        border: 1px solid #ddd; /* Borde de las tarjetas */
        border-radius: 5px; /* Bordes redondeados de las tarjetas */
    }
    .card-body {
        background-color: #ffffff; /* Fondo blanco para el contenido de la tarjeta */
        border: 1px solid #ddd; /* Borde de la tarjeta */
    }
    .message-card {
        border: 1px solid #ddd;
        border-radius: 5px; /* Bordes redondeados para los mensajes */
        padding: 15px;
        display: flex;
        align-items: start;
        background-color: #ffffff; /* Fondo blanco para los mensajes */
        margin-bottom: 15px;
    }
    .message-header {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    .message-author {
        font-weight: bold;
        margin-right: 10px;
    }
    .message-text {
        margin-bottom: 10px;
    }
    .form-group {
        margin-top: 10px;
    }
    .btn-info {
        background-color: #bfab97; /* Color de fondo del botón */
        color: white;
        border: none;
    }
    .btn-info:hover {
        background-color: #d6bfa6; /* Color de fondo del botón al pasar el mouse */
    }
    .btn-dark {
        background-color: #bfab97; /* Color de fondo del botón */
        color: white;
        border: none;
    }
    .btn-dark:hover {
        background-color: #d6bfa6; /* Color de fondo del botón al pasar el mouse */
    }
    .avatar-img, .card-avatar {
        border-radius: 50%;
    }
    .card-avatar {
        width: 50px;
        height: 50px;
    }
    .avatar-img {
        width: 30px;
        height: 30px;
        margin-right: 10px;
    }
    .msg-img {
        width: 95%;
        margin: 0 auto;
    }
    .navbar-nav .nav-link {
        font-size: 1.2em;
        margin-right: 20px;
        display: flex;
        align-items: center;
    }
    .navbar-nav .nav-link .material-icons-outlined {
        margin-right: 8px;
    }
    .message-content {
        margin-left: 15px;
        flex: 1;
    }
    .dropdown-menu {
        background-color: #bfab97; 
        border: none; 
        color: #6f4e37; 
    }
    .dropdown-item {
        color: #6f4e37; 
    }
    .dropdown-item:hover {
        background-color: #d6bfa6; 
        color: #6f4e37; /* Color de texto al pasar el ratón */
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/principal">
                <span class="material-icons-outlined">home</span>
                <span class="d-lg-none ms-2">Home</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/principal">
                            <span class="material-symbols-outlined">home</span> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/foro/temas/">
                            <span class="material-symbols-outlined">groups</span> Foros
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/">
                            <span class="material-symbols-outlined">store</span> Tienda
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/messenges">
                            <span class="material-symbols-outlined">chat</span> Chat
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="material-symbols-outlined">account_circle</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="/logout">
                                    <span class="material-icons-outlined">Cerrar sesión</span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/perfil/${userInSession.id}">
                                    <span class="material-icons-outlined">Perfil</span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/editarPerfil">
                                    <span class="material-icons-outlined">Editar Perfil</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <h2 class="mb-5">Compañeros de tu facultad</h2>
                <c:set var="count" value="0" />
                <c:forEach items="${listaAlumnos}" var="alumno" varStatus="status">
                    <c:if test="${userInSession.facultad == alumno.facultad && userInSession.id != alumno.id && status.index < 3}">
                        <div class="card mb-3">
                            <div class="card-body d-flex align-items-center">
                                <c:choose>
                                    <c:when test="${not empty alumno.avatar}">
                                        <img src="/img/${alumno.avatar}" alt="Avatar de ${alumno.nombre}" class="card-avatar me-3"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/studentBlank.jpg" alt="Avatar de ${alumno.nombre}" class="card-avatar me-3"/>
                                    </c:otherwise>
                                </c:choose>
                                <div>
                                    <h5 class="card-title mb-1">${alumno.nombre} ${alumno.apellido}</h5>
                                    <p class="card-text mb-0">Carrera: ${alumno.carrera}</p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <h2 class="mb-5 mt-5">Compañeros de tu carrera</h2>
                <c:set var="count" value="0" />
                <c:forEach items="${listaAlumnos}" var="alumno" varStatus="status">
                    <c:if test="${userInSession.carrera == alumno.carrera && userInSession.id != alumno.id && status.index < 3}">
                        <div class="card mb-3">
                            <div class="card-body d-flex align-items-center">
                                <c:choose>
                                    <c:when test="${not empty alumno.avatar}">
                                        <img src="/img/${alumno.avatar}" alt="Avatar de ${alumno.nombre}" class="card-avatar me-3"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/studentBlank.jpg" alt="Avatar de ${alumno.nombre}" class="card-avatar me-3"/>
                                    </c:otherwise>
                                </c:choose>
                                <div>
                                    <h5 class="card-title mb-1">${alumno.nombre} ${alumno.apellido}</h5>
                                    <p class="card-text mb-0">Facultad/Universidad: ${alumno.facultad}</p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <div class="col-7">
    <form:form action="/crear/mensaje/foroGeneral" method="post" modelAttribute="mensajeForoGeneral" enctype="multipart/form-data">
        <form:errors path="contenido" class="text-danger" />
        <h3>Bienvenido ${userInSession.nombre} al foro General</h3>
        <div class="form-group mt-3">
            <form:textarea path="contenido" class="form-control" placeholder="Escribe un mensaje..."></form:textarea>
        </div>
        <div class="form-group mt-3">
            <label for="foto">Enviar foto</label>
            <input type="file" class="form-control-file" id="foto" name="foto">
        </div>
        <button type="submit" class="btn btn-info mt-3">Enviar</button>
    </form:form>
    <c:forEach items="${mensajesForoGeneral}" var="mensaje">
        <div class="message-card">
            <div class="message-header">
                <c:choose>
                    <c:when test="${not empty mensaje.autorForoGeneral.avatar}">
                        <img src="/img/${mensaje.autorForoGeneral.avatar}" alt="Avatar de ${mensaje.autorForoGeneral.nombre}" class="avatar-img"/>
                    </c:when>
                    <c:otherwise>
                        <img src="/img/studentBlank.jpg" alt="Avatar de ${mensaje.autorForoGeneral.nombre}" class="avatar-img"/>
                    </c:otherwise>
                </c:choose>
                <span class="message-author">${mensaje.autorForoGeneral.nombre}</span>
            </div>
            <div class="message-content">
                <p class="message-text">${mensaje.contenido}</p>
                <c:if test="${not empty mensaje.urlFotoForo}">
                    <img src="/img/${mensaje.urlFotoForo}" alt="Imagen del mensaje" class="img-fluid msg-img">
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-gbkS7ggqbRjOcUQ01iNm5hQuTkwtMjHzVb7vU50c4Hn3uHj6B5gJpRJG3LNmjYMC" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-QmeHVoQA3RN49A9KTyML1imF0F5wHHyw2oIogtkY8Vr81Bt+K5B8zBMMsgrG2O/Q" crossorigin="anonymous"></script>
</body>
</html>
