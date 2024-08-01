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
                <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ayu22.png"
                    alt="logo-ayudadita">
                <title>Bienvenido ${userInSession.nombre}</title>
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

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-3 container">
                            <h2 class="mb-5">Compañeros de tu facultad</h2>
                            <c:forEach items="${listaAlumnos}" var="alumno">
                                <c:if
                                    test="${userInSession.facultad == alumno.facultad && userInSession.id != alumno.id}">
                                    <div class="card mb-3">
                                        <div class="card-body d-flex align-items-center">
                                            <c:choose>
                                                <c:when test="${not empty alumno.avatar}">
                                                    <img src="/img/${alumno.avatar}" alt="Avatar de ${alumno.nombre}"
                                                        class="card-avatar me-3" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/img/studentBlank.jpg" alt="Avatar de ${alumno.nombre}"
                                                        class="card-avatar me-3" />
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
                            <c:forEach items="${listaAlumnos}" var="alumno">
                                <c:if
                                    test="${userInSession.carrera == alumno.carrera && userInSession.id != alumno.id}">
                                    <div class="card mb-3">
                                        <div class="card-body d-flex align-items-center">
                                            <c:choose>
                                                <c:when test="${not empty alumno.avatar}">
                                                    <img src="/img/${alumno.avatar}" alt="Avatar de ${alumno.nombre}"
                                                        class="card-avatar me-3" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/img/studentBlank.jpg" alt="Avatar de ${alumno.nombre}"
                                                        class="card-avatar me-3" />
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

                        <div class="container col-7">
                            <form:form action="/crear/mensaje/foroGeneral" method="post"
                                modelAttribute="mensajeForoGeneral" enctype="multipart/form-data">
                                <form:errors path="contenido" class="text-danger" />
                                <h4 class="text-center">¡Deja un mensaje!</h4>
                                <div class="form-group mt-3">
                                    <form:textarea path="contenido" class="form-control"
                                        placeholder="Escribe aquí..."></form:textarea>
                                </div>
                                <div class="form-group text-center mb-3">
                                    <label for="foto" class="custom-file-upload btn btn-info mt-1">
                                        Agregar imagen
                                        <input type="file" class="d-none" id="foto" name="foto">
                                    </label>
                                    <!--
                                                <label for="foto" class="custom-file-upload btn btn-info mt-1">
                                                        <input type="file" id="foto" class="d-none" name="foto" accept="image/*"
                                                                 required />
                                                                 Agregar imagen
                                            </label>
                                                -->
                                    <button type="submit" class="btn btn-info mt-1">Enviar</button>
                                </div>
                            </form:form>
                            <c:forEach items="${mensajesForoGeneral}" var="mensaje">
                                <div class="message-card">
                                    <div class="message-header">
                                        <c:choose>
                                            <c:when test="${not empty mensaje.autorForoGeneral.avatar}">
                                                <img src="/img/${mensaje.autorForoGeneral.avatar}"
                                                    alt="Avatar de ${mensaje.autorForoGeneral.nombre}"
                                                    class="avatar-img" />
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/img/studentBlank.jpg"
                                                    alt="Avatar de ${mensaje.autorForoGeneral.nombre}"
                                                    class="avatar-img" />
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="message-author">${mensaje.autorForoGeneral.nombre}</span>
                                    </div>
                                    <div class="message-content">
                                        <p class="message-text">${mensaje.contenido}</p>
                                        <c:if test="${not empty mensaje.urlFotoForo}">
                                            <img src="/img/${mensaje.urlFotoForo}" alt="Imagen del mensaje"
                                                class="img-fluid msg-img">
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                    integrity="sha384-gbkS7ggqbRjOcUQ01iNm5hQuTkwtMjHzVb7vU50c4Hn3uHj6B5gJpRJG3LNmjYMC"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                    integrity="sha384-QmeHVoQA3RN49A9KTyML1imF0F5wHHyw2oIogtkY8Vr81Bt+K5B8zBMMsgrG2O/Q"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous">
                    </script>
            </body>

            </html>