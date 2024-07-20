<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Wall</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    .avatar-img {
        width: 30px; /* Ajusta el tamaño del avatar */
        height: 30px; /* Ajusta el tamaño del avatar */
        border-radius: 50%; /* Hace que la imagen sea redonda */
        margin-right: 10px; /* Espacio entre la imagen y el nombre */
    }
    .message-container {
        margin-bottom: 15px; /* Espacio entre los mensajes */
    }
</style>
</head>
<body>
    <div class="container">
        <div class="col-6">
            <a class="btn btn-danger" href="/logout">Cerrar sesión</a>
            <a href="/foro/temas/" class="btn btn-dark">Volver a foros</a>
            <a href="/principal" class="btn btn-dark">Volver al principio</a>
            <h2>Message Wall</h2>
            <div class="border mb-3">
                <!-- mostrar mensajes -->
                <c:forEach items="${foro.foroMensajes}" var="msg">
                    <div class="message-container">
                        <p>
                            <a href="/perfil/${msg.autor.id}">
                                <!-- Muestra el avatar del autor -->
                                <c:choose>
                                    <c:when test="${not empty msg.autor.avatar}">
                                        <img src="/img/${msg.autor.avatar}" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/default-avatar.png" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
                                    </c:otherwise>
                                </c:choose>
                                ${msg.autor.nombre}
                            </a> dice:
                            <c:choose>
                                <c:when test="${not empty msg.urlFotoForo}">
                                    <img src="/img/${msg.urlFotoForo}" alt="Imagen enviada" class="img-fluid" />
                                </c:when>
                                <c:otherwise>
                                    ${msg.contenido}
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </c:forEach>
            </div>

           <form:form action="/crear/mensaje" method="post" modelAttribute="mensaje" enctype="multipart/form-data">
			    <form:errors path="contenido" class="text-danger" />
			    <form:label path="contenido">Añadir comentario:</form:label>
			    <form:textarea path="contenido" class="form-control"></form:textarea>
			    <form:hidden path="autor.id" value="${userInSession.id}" />
			    <form:hidden path="foroCarrera.id" value="${foro.id}" />
			    <input type="submit" value="Enviar" class="btn btn-info">
			    <br/><br/>
			    <input type="file" name="file" accept="image/*">
			</form:form>
        </div>
    </div>
</body>
</html>