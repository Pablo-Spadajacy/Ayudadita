<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>store</title>
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
            <div class="container mt-4">

                <a href="/store/product/new" class="btn  position-fixed bottom-0 end-0 m-3 btn-info">
                    <span class="material-symbols-outlined">
                        add_circle
                    </span>
                </a>
                <div class="row">
                    <!-- modelo de card -->
                    <c:forEach items="${store}" var="product">
                        <div class="col-md-4 mb-3">
                            <a href="/store/product/${product.id}" class="text-decoration-none">
                                <div class="card ">
                                    <c:if test="${empty product.img}">
                                        <img src="../img/test.png" alt="imagen del producto"
                                            class="card-img-top img-fluid img-thumbnail"
                                            style="height: 200px; object-fit: cover;" />
                                    </c:if>
                                    <c:if test="${not empty product.img}">
                                        <img src="../img/${product.img}" alt="Imagen del producto"
                                            class="card-img-top img-thumbnail"
                                            style="height: 200px; object-fit: cover;" />
                                    </c:if>
                                    <div class="card-body">
                                        <p class="card-text">Precio: ${product.price}</p>
                                        <h5 class="card-title">${product.title}</h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous">
                </script>

        </body>

        </html>