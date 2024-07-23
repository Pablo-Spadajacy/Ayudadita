<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Ayudadita</title>
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
						<form:label path="email">Correo</form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
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
					<div>
						<form:label path="facultad">Facultad:</form:label>
						<form:select path="facultad" class="form-select">
							<c:forEach items="${listaFacultades}" var="facultad">
								<form:option value="${facultad}">${facultad}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="facultad" class="text-danger"/>
					</div>
					<div>
						<form:label path="carrera">Carrera:</form:label>
						<form:select path="carrera" class="form-select">
							<c:forEach items="${listaCarreras}" var="carrera">
								<form:option value="${carrera}">${carrera}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="facultad" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-primary  mt-3" value="Registro">
				</form:form>
			</div>
			<div class="col-6">
				<h2>Iniciar sesion</h2>
				<form action="/login" method="POST">
					<div>
						<label>Correo:</label>
						<input type="email" class="form-control" name="correo" >
					</div>
					<div>
						<label>Contraseña:</label>
						<input type="password" class="form-control" name="password" >
					</div>
					<p class="text-danger">${errorLogin}</p>
					<input type="submit" class="btn btn-info mt-2" value="Iniciar sesion" >
				</form>
			</div>
		</div>	
	</div>
</body>
</html>