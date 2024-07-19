<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class = "container">
		<div class="col-6">
		<a class="btn btn-danger" href="/logout" >Cerrar sesion</a>
		<a href = "/foro/temas/"class = "btn btn-dark">Volver a foros</a>
		<a href = "/principal" class = "btn btn-dark">Volver al principio</a>
				<h2>Message Wall</h2>
				<div class="border mb-3">
					<!-- mostrar mensajes -->
					<c:forEach items="${foro.foroMensajes}" var="msg">
						<p>
							<a href = "/perfil/${msg.autor.id}">${msg.autor.nombre}</a> dice: ${msg.contenido}
						</p>
					</c:forEach>
				</div>
				
				<form:form action="/crear/mensaje" method="post" modelAttribute="mensaje">
					<form:errors path="contenido" class="text-danger" />
					<form:label path="contenido">Añadir comentario:</form:label>
					<form:textarea path="contenido" class="form-control"></form:textarea>
					<form:hidden path="autor.id" value="${userInSession.id}" />
					<form:hidden path="foroCarrera.id" value="${foro.id}" />
					<input type="submit" value="Enviar" class="btn btn-info" >
				</form:form>
			</div>
	</div>
</body>
</html>