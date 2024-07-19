<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Foros</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<a class="btn btn-danger" href="/logout" >Cerrar sesion</a>
		<div class="col-6">
			<h2>Foros</h2>
			<div class="border mb-3">
				<h1>Foros de tu carrera</h1>
				<c:forEach items="${forosTuCarrera}" var="foroTuCarrera">
					<a href="/foro/tema/${foroTuCarrera.id}" class = "btn btn-success">${foroTuCarrera.nombreForo}</a><br>
				</c:forEach>
			</div>
			<div class="border mb-3">
				<h1>Foros de otras carreras</h1>
				<c:forEach items="${foroOtrasCarreras}" var="foroOtraCarrera">
					<a href="/foro/tema/${foroOtraCarrera.id}" class="btn btn-primary">${foroOtraCarrera.nombreForo}</a><br>
				</c:forEach>
			</div>
			<div class="border mb-3">
				<h1>Foros de mi facultad</h1>
				<c:forEach items="${forosTuFacultad}" var="foroTuFacultad">
					<a href="/foro/tema/${foroTuFacultad.id}" class="btn btn-success">${foroTuFacultad.nombreForo}</a><br>
				</c:forEach>
			</div>
			<div class="border mb-3">
				<h1>Foros de otras facultades</h1>
				<c:forEach items="${foroOtrasFacultades}" var="foroOtraFacultad">
					<a href="/foro/tema/${foroOtraFacultad.id}" class="btn btn-primary">${foroOtraFacultad.nombreForo}</a><br>
				</c:forEach>
			</div>
			<c:if test="${userInSession.id == 1}">
				<a href="/crear/foro" class="btn btn-success">Crear foro</a>
			</c:if>
		</div>
		<a href = "/principal" class = "btn btn-dark">Volver al principio</a>
	</div>
</body>
</html>