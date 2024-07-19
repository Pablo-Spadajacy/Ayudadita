<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Bienvenido ${userInSession.nombre}</title>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between">
			<h1>Bienvenido ${userInSession.nombre} !</h1>
			<a class="btn btn-danger" href="/logout" >Cerrar sesion</a>
		</header>
		<div>
			<h2 class="mb-5">Compañeros de tu facultad</h2>			
			<c:forEach items="${listaAlumnos}" var="alumno">
					<c:if test="${userInSession.facultad == alumno.facultad}">
						<h3>-Nombre: ${alumno.nombre} ${alumno.apellido}</h3>
						<h3>-Facultad/Universidad: ${alumno.facultad}</h3>
						<h3>-Carrera: ${alumno.carrera}</h3>
					</c:if>
			</c:forEach>
			<h2 class="mb-5 mt-5">Compañeros de tu carrera</h2>
				<c:forEach items="${listaAlumnos}" var="alumno">
					<c:if test="${userInSession.carrera == alumno.carrera}">
						<h3>-Nombre: ${alumno.nombre} ${alumno.apellido}</h3>
						<h3>-Facultad/Universidad: ${alumno.facultad}</h3>
						<h3>-Carrera: ${alumno.carrera}</h3>
					</c:if>
			</c:forEach>
		</div>
	</div>
	<div>
		<a href = "/foro/temas/" class = "btn btn-success">Foros</a>
	</div>
	<div>
		<h2> Prueba de guardado de imagen</h2>
		<form action="/prueba" method="post" enctype="multipart/form-data">
	        <input type="file" name="file" accept="image/*" required />
	        <br/><br/>
	        <button type="submit">Cargar Imagen</button>
  			</form>
	</div>
	<h4>${userInSession.avatar}</h4>
	<img src="/img/${userInSession.avatar}" alt="${userInSession.avatar}">
</body>
</html>