<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
                <title>Perfil de ${usuario.nombre}</title>
                <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ayu22.png" alt="logo-ayudadita">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/style2.css">
            </head>

            <body>
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="/principal">
                        
                            <img src="${pageContext.request.contextPath}/images/ayu.png" alt="logo-ayudadita" class="logo">
                            
                        </a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-around" id="navbarNavDropdown">
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
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="material-symbols-outlined">account_circle</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end"
                                        aria-labelledby="navbarDropdownMenuLink">
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
                
                <div class="container justify-content-between">
                    <div class="row mt-2">
                        <div class="col-6 ">
                            <div class="container text-center items-center border border-secondary rounded pb-2 position-fixed col-4"
                                style="background-color: #bfab97;">
                                <h1>Nombre: ${usuario.nombre} ${usuario.apellido}</h1>
                                <h2>Facultad: ${usuario.facultad}</h2>
                                <h3>Carrera: ${usuario.carrera}</h3>
                                <c:choose>
                                    <c:when test="${not empty usuario.avatar}">
                                        <img src="/img/${usuario.avatar}" alt="${usuario.avatar}"
                                            class="avatarNoDefault border border-secondary">
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${usuario.id == 1}">
                                            <h4>Este admin no tiene foto</h4>
                                            <img src="/img/adminBlank.jpg" alt="Avatar de ${msg.autor.nombre}"
                                                class="avatar-img-profile border border-secondary" />
                                        </c:if>
                                        <c:if test="${usuario.id > 1}">
                                            <h4>Este usuario no tiene foto</h4>
                                            <img src="/img/studentBlank.jpg" alt="Avatar de ${msg.autor.nombre}"
                                                class="avatar-img-profile border border-secondary" />
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                <br>
                                <c:if test="${usuario.id == userInSession.id}">
                                    <a href="/editarPerfil" class="btn btn-info mt-1 border">Editar perfil</a>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-6 container rounded">
                            <h3 class="mt-2">Publicaciones del usuario:</h3>
                            <c:forEach items="${foro.foroGeneralMensajes}" var="msg">
                                <c:if test="${msg.autor.id == usuario.id}">
                                    <div class="message-container mt-1">
                                        <p>
                                            <a href="/perfil/${msg.autor.id}">
                                                <!-- Muestra el avatar del autor -->
                                                <c:choose>
                                                    <c:when test="${not empty msg.autor.avatar}">
                                                        <img src="/img/${msg.autor.avatar}"
                                                            alt="Avatar de ${msg.autor.nombre}" class="avatar-img" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${msg.autor.id == 1}">
                                                            <img src="/img/adminBlank.jpg"
                                                                alt="Avatar de ${msg.autor.nombre}"
                                                                class="avatar-img" />
                                                        </c:if>
                                                        <c:if test="${msg.autor.id > 1}">
                                                            <img src="/img/studentBlank.jpg"
                                                                alt="Avatar de ${msg.autor.nombre}"
                                                                class="avatar-img" />
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                                ${msg.autor.nombre}
                                            </a>
                                            <c:choose>
                                                <c:when test="${not empty msg.urlFotoForo}">
                                                    <img src="/img/${msg.urlFotoForo}" alt="Imagen enviada"
                                                        class="img-fluid" />
                                                </c:when>
                                                <c:otherwise>
                                                    ${msg.contenido}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
            </body>

            </html>