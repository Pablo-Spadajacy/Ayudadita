<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html>

                <head>

                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>edit profile</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
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
                        <div class="row">
                            <div class="col-6">
                                <form:form action="/editarPerfil" method="post" modelAttribute="usuario">
                                    <input type="hidden" name="_method" value="PUT">
                                    <input type="hidden" name="email" value="${usuario.email}">
                                    <input type="hidden" name="id" value="${userInSession.id}">
                                    <input type="hidden" name="avatar" value="${usuario.avatar}">
                                    <div>
                                        <form:label path="nombre">Nombre:</form:label>
                                        <form:input path="nombre" class="form-control" />
                                        <form:errors path="nombre" class="text-danger" />
                                    </div>
                                    <div>
                                        <form:label path="apellido">Apellido:</form:label>
                                        <form:input path="apellido" class="form-control" />
                                        <form:errors path="apellido" class="text-danger" />
                                    </div>
                                    <div>
                                        <form:label path="facultad">Facultad:</form:label>
                                        <form:select path="facultad" class="form-select">
                                            <c:forEach items="${listaFacultades}" var="facultad">
                                                <form:option value="${facultad}">${facultad}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <p class="text-danger">AVISO: Si no queres cambiar de facultad elegí la actual
                                        </p>
                                    </div>
                                    <div>
                                        <form:label path="carrera">Carrera:</form:label>
                                        <form:select path="carrera" class="form-select">
                                            <c:forEach items="${listaCarreras}" var="carrera">
                                                <form:option value="${carrera}">${carrera}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <p class="text-danger">AVISO: Si no queres cambiar la carrera elegí la actual
                                        </p>
                                        <form:errors path="facultad" class="text-danger" />
                                    </div>

                                    <div>
                                        <form:label path="contrasenna">Debes colocar tu contraseña para verificar los cambios
                                        </form:label>
                                        <input type="password" class="form-control" name="contrasenna" />
                                        <form:errors path="contrasenna" class="text-danger" />
                                    </div>
                                    <p class="text-danger">${errorContra}</p>
                                    <p class="text-danger">${size}</p>
                                    <input type="submit" value="Guardar Perfil" class="btn btn-info mt-1">
                                </form:form>


                            </div>
                            <div class="col-6">
                                <h2>¿No te gusta tu avatar? ¡Cambialo!</h2>
                                <form action="/imagen" class="form-group container d-flex" method="post" enctype="multipart/form-data">
                                    <label for="fileUpload" class="custom-file-upload btn btn-info mt-1 margen">
                                        <input type="file" id="fileUpload" class="d-none" name="file" accept="image/*" required />
                                        Seleccionar archivo
                                    </label> 
                                    
                                    <button type="submit" class="btn btn-info mt-1">Cargar Imagen</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>
                </body>

                </html>