<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Perfil de ${usuario.nombre}</title>
<style>
	.avatar-img {
        width: 600px; /* Ajusta el tamaño del avatar */
        height: 600px; /* Ajusta el tamaño del avatar */
        border-radius: 50%; /* Hace que la imagen sea redonda */
        margin-right: 10px; /* Espacio entre la imagen y el nombre */
    }
    .avatarNoDefault {
    	width: 800px;
    	margin-right: 10px;
    }
</style>
</head>
<body>
	<div class = "container">
		<a class="btn btn-danger" href="/logout" >Cerrar sesion</a>
		<h1>Nombre: ${usuario.nombre} ${usuario.apellido}</h1>
		<h2>Facultad: ${usuario.facultad}</h2>
		<h3>Carrera: ${usuario.carrera}</h3>
		<c:choose>
			<c:when test="${not empty usuario.avatar}">
				<h4>Avatar del Usuario</h4>
				<img src="/img/${usuario.avatar}" alt="${usuario.avatar}" class="avatarNoDefault">
			</c:when>
			<c:otherwise>
              <c:if test="${usuario.id == 1}">
              	  <h4>Este admin no tiene foto</h4>
                  <img src="/img/adminBlank.jpg" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
              </c:if>
              <c:if test="${usuario.id > 1}">
          	    <h4>Este usuario no tiene foto</h4>
              	<img src="/img/studentBlank.jpg" alt="Avatar de ${msg.autor.nombre}" class="avatar-img"/>
              </c:if>
            </c:otherwise>
		</c:choose>
		<br>
		<a href = "/foro/temas/"class = "btn btn-dark">Volver a foros</a>
		<a href = "/principal" class = "btn btn-dark">Volver al principio</a>
	</div>
</body>
</html>