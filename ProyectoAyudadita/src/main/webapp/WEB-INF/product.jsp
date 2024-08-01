<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Product</title>
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
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
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
            <div class="container">
                <div class="d-flex justify-content-between">
                    <c:choose>
                        <c:when test="${not empty product.img}">
                            <!-- Imagen del producto disponible -->
                            <img src="/img/${product.img}" class="product-img">
                        </c:when>
                        <c:otherwise>
                            <!-- Imagen por defecto si el producto no tiene imagen -->
                            <img src="/img/test.png" class="product-img">
                        </c:otherwise>
                    </c:choose>
                    <div>

                        <h1>Titulo: ${product.title}</h1>
                        <p>Localidad: ${product.productLocation}</p>
                        <p>Precio: ${product.price}</p>
                        <p>Descripcion: ${product.productDescription}</p>
                    </div>
                </div>
                <div>
                    <c:if test="${userInSession.id == product.creator.id}">

                        <a href="/store/product/${id}/edit" class="btn btn-info mt-1">Editar</a>
                    </c:if>

                    <c:if test="${userInSession.id == product.creator.id}">
                        <a href="/store/product/${id}/delete" class="btn btn-info mt-1">Borrar</a>
                    </c:if>
                </div>
                <div class="row">
                    <c:if test="${userInSession.id != product.creator.id}">

                        <a href="#" class="btn btn-info mt-1">Enviar mensaje</a>
                    </c:if>
                </div>

            </div>



            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
        </body>

        </html>