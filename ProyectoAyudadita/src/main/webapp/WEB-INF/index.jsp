<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Register and Login</title>
</head>
<body>
	<div class="container justify-content-between">
		<div class="row">
			<div class="col-6">
				<h2>Register</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div>
						<form:label path="nombre">Nombre</form:label>
						<form:input path="nombre" class="form-control"/>
						<form:errors path="nombre" class="text-danger"/>
					</div>
					<div>
						<form:label path="apellido">Apellido</form:label>
						<form:input path="apellido" class="form-control"/>
						<form:errors path="apellido" class="text-danger"/>
					</div>
					<div>
						<form:label path="correo">Correo</form:label>
						<form:input path="correo" class="form-control"/>
						<form:errors path="correo" class="text-danger"/>
					</div>
					<div>
						<form:label path="contrasenna">Contraseña</form:label>
						<form:password path="contrasenna" class="form-control"/>
						<form:errors path="contrasenna" class="text-danger"/>
					</div>
					<div>
						<form:label path="confirmar">Confirmar contraseña</form:label>
						<form:password path="confirmar" class="form-control"/>
						<form:errors path="confirmar" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-primary" value="Registro">
				</form:form>
			</div>
			<div class="col-6">
				<h2>Iniciar sesion</h2>
				<p class="text-danger">${errorLogin}</p>
				<form action="/login" method="POST">
					<div>
						<label>Correo:</label>
						<input type="email" class="form-control" name="correo" >
					</div>
					<div>
						<label>Contraseña:</label>
						<input type="password" class="form-control" name="contraseña" >
					</div>
					<input type="submit" class="btn btn-info mt-3" value="Iniciar sesion" >
				</form>
			</div>
		</div>	
	</div>
</body>
</html>