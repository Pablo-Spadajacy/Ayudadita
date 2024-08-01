<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ page isErrorPage="true" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Nuevo producto</title>
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
                    <div class="container">

                        <form:form action="/store/product/create" method="post" modelAttribute="product" enctype="multipart/form-data">
                            <h2>Crea tu publicación</h2>
                            <h4>¡Vende, intercambiá o regalá tus apuntes!</h4>
                            <span class="text-danger">${errors.first('title')}</span>

                            <div>

                                <div>
                                    <form:label path="title" >Titulo de los apuntes	:</form:label>
                                    <form:input path="title" class="form-control" />
                                    <form:errors path="title" class="text-danger" />
                                </div>

                                <div>
                                    <form:label path="price" >Precio:</form:label>
                                    <form:input path="price" class="form-control"/>
                                    <form:errors path="price" class="text-danger" />
                                </div>
                                <div>
                                    <form:label path="productDescription" >Descripcion:</form:label>
                                    <form:input path="productDescription" class="form-control"/>
                                    <form:errors path="productDescription" class="text-danger" />
                                </div>
                                <div>
                                    <form:label path="productLocation" >Localidad:</form:label>
                                    <form:input path="productLocation" class="form-control"/>
                                    <form:errors path="productLocation" class="text-danger" />
                                </div>
                                <div>
						         	<label for="fileInput" class="form-label">(Opcional) Selecciona una imagen:</label>
						            <input type="file" name="file" accept="image/*" class="form-control">
						        </div>
                                <form:hidden path="Creator" value="${userInSession.id}" />
                                <input type="submit" class="btn btn-info mt-1" value="Enviar">
                                <a href="/store/" class="btn btn-info mt-1">Cancelar</a>
                                </div>
                        </form:form>
						</div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>
                </body>

                </html>