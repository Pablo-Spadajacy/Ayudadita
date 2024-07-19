<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class = "container">
		<a class="btn btn-danger" href="/logout" >Cerrar sesion</a>
		<h1>Nombre: ${usuario.nombre} ${usuario.apellido}</h1>
		<h2>Facultad: ${usuario.facultad}</h2>
		<h3>Carrera: ${usuario.carrera}</h3>
		<h4>Foto: <img src="/img/${usuario.avatar}" alt="${usuario.avatar}"></h4>
		<a href = "/foro/temas/"class = "btn btn-dark">Volver a foros</a>
		<a href = "/principal" class = "btn btn-dark">Volver al principio</a>
	</div>
</body>
</html>