<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Mensajes</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/style2.css">
                    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ayu22.png" alt="logo-ayudadita">
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
                    <h1>Chat con ${otroUsuario.nombre} ${otroUsuario.apellido}</h1>

                    <div class="chat-mensajes">
                        <c:forEach var="mensaje" items="${mensajes}">
                            <div class="mensaje">
                                <strong>${mensaje.autor.nombre} ${mensaje.autor.apellido}:</strong>
                                <p>${mensaje.contenido}</p>
                                <small>${mensaje.createdAt}</small>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="enviar-mensaje">
                        <form action="/usuario/chat/${otroUsuario.id}/enviar" method="post">
                            <div class="form-group">
                                <textarea name="contenido" class="form-control"
                                    placeholder="Escribe tu mensaje aquí"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </form>
                    </div>
                </div>
            </body>

            </html>