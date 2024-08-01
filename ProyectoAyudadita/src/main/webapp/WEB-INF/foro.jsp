<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Muro de mensaje</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
                <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ayu22.png" alt="logo-ayudadita">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/style2.css">
            </head>

            <body>
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="/principal">

                            <img src="${pageContext.request.contextPath}/images/ayu.png" alt="logo-ayudadita"
                                class="logo">

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
                <div class="container">
                    <div class="col-8 offset-2">
                        <div class="text-center">
                            <!--
    <a href="/foro/temas/" class="btn btn-dark">Volver a foros</a>
    <a href="/principal" class="btn btn-dark">Volver al principio</a>
    -->
                            <h2>Foro ${foro.nombreForo}</h2>
                        </div>
                        <form:form action="/crear/mensaje" method="post" modelAttribute="mensaje"
                            enctype="multipart/form-data" class="container">
                            <form:errors path="contenido" class="text-danger" />
                            <h3 class="text-center">Publicar en el foro</h3>
                            <form:textarea path="contenido" class="form-control"></form:textarea>
                            <form:hidden path="autor.id" value="${userInSession.id}" />
                            <form:hidden path="foroCarrera.id" value="${foro.id}" />
                            <div class="text-center">
                                <label for="fileInput" class="custom-file-upload btn btn-info mt-1">Selecciona una imagen
                                    <input type="file" name="file" accept="image/*" class="d-none">

                                </label>
                                <input type="submit" value="Enviar" class="btn btn-info mt-1">
                            </div>
                        </form:form>
                        <div>
                            <!-- mostrar mensajes -->
                            <c:forEach items="${foro.foroMensajes}" var="msg">
                                <div class="message-container">
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
                                                            alt="Avatar de ${msg.autor.nombre}" class="avatar-img" />
                                                    </c:if>
                                                    <c:if test="${msg.autor.id > 1}">
                                                        <img src="/img/studentBlank.jpg"
                                                            alt="Avatar de ${msg.autor.nombre}" class="avatar-img" />
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                            ${msg.autor.nombre}
                                        </a> dice:
                                        <c:choose>
                                            <c:when test="${not empty msg.urlFotoForo}">
                                                <p class="message-text">${msg.contenido}</p>
                                                <img src="/img/${msg.urlFotoForo}" alt="Imagen enviada"
                                                    class="img-fluid" />
                                            </c:when>
                                            <c:otherwise>
                                                ${msg.contenido}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
            </body>

            </html>