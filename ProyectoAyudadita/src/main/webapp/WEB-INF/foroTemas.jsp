<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Foros</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ayu22.png" alt="logo-ayudadita">
            <link rel="stylesheet"
                href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
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

            <div class="header-title">
                <h1>¡Bienvenido a la seccion de Foros! Conecta con Tu Carrera, Comparte Ideas y Aprende. </h1>
            </div>

            <div class="mt-4">
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-md-6 col-lg-3 mb-4">
                                <div class="card border-custom-success">
                                    <div class="card-header">Foros de tu carrera</div>
                                    <div class="card-body">
                                        <c:forEach items="${forosTuCarrera}" var="foroTuCarrera">
                                            <a href="/foro/tema/${foroTuCarrera.id}"
                                                class="btn btn-custom-success w-100 mb-2">${foroTuCarrera.nombreForo}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 mb-4">
                                <div class="card border-custom-primary">
                                    <div class="card-header">Foros de otras carreras</div>
                                    <div class="card-body">
                                        <c:forEach items="${foroOtrasCarreras}" var="foroOtraCarrera">
                                            <a href="/foro/tema/${foroOtraCarrera.id}"
                                                class="btn btn-custom-primary w-100 mb-2">${foroOtraCarrera.nombreForo}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 mb-4">
                                <div class="card border-custom-success">
                                    <div class="card-header">Foros de mi facultad</div>
                                    <div class="card-body">
                                        <c:forEach items="${forosTuFacultad}" var="foroTuFacultad">
                                            <a href="/foro/tema/${foroTuFacultad.id}"
                                                class="btn btn-custom-success w-100 mb-2">${foroTuFacultad.nombreForo}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 mb-4">
                                <div class="card border-custom-primary">
                                    <div class="card-header">Foros de otras facultades</div>
                                    <div class="card-body">
                                        <c:forEach items="${foroOtrasFacultades}" var="foroOtraFacultad">
                                            <a href="/foro/tema/${foroOtraFacultad.id}"
                                                class="btn btn-custom-primary w-100 mb-2">${foroOtraFacultad.nombreForo}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:if test="${userInSession.id == 1}">
                            <a href="/crear/foro" class="btn btn-custom-success mt-4">Crear foro</a>
                        </c:if>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
        </body>

        </html>