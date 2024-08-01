<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
					integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
					crossorigin="anonymous">
				<link rel="stylesheet" href="${pageContext.request.contextPath}/style2.css">
			</head>

			<body>

				<script>
					function filtrar(tipo) {
						document.getElementById("tipoFiltrado").value = tipo;
						document.getElementById("filtradoForm").submit()
						if (tipo === "facultad") {
							document.getElementyById("facultadUsuarios").style.display = "block";
							document.getElementyById("carreraUsuarios").style.display = "none";
							document.getElementById("todosUsuarios").style.display = "none";
						}
						else if (tipo === "carrera") {
							document.getElementById("facultadUsuarios").style.display = "none";
							document.getElementById("carreraUsuarios").style.display = "block";
							document.getElementById("todosUsuarios").style.display = "none";
						}
						else if (tipo === "todos") {
							document.getElementById("facultadUsuarios").style.display = "none";
							document.getElementById("carreraUsuarios").style.display = "none";
							document.getElementById("todosUsuarios").style.display = "block";
						}
					}
				</script>
				<div class="container">
					<div class="botones">
						<h1>Buscar por: </h1>
						<form id="filtradoForm" action="/chats/filtrado" method="GET">
							<button type="button" class="btn btn-success" onClick="filtrar('facultad')">Mi
								facultad</button>
							<button type="button" class="btn btn-success" onClick="filtrar('carrera')">Mi
								carrera</button>
							<button type="button" class="btn btn-success" onClick="filtrar('todos')">Todos</button>
							<input type="hidden" id="tipoFiltrado" name="tipoFiltrado" />
						</form>
					</div>

					<div id="todosUsuarios">
						<h1>Todos los usuarios</h1>
						<c:forEach items="${todosUsuarios}" var="usuario">
							<c:if test="${userInSession.id != usuario.id}">
								<a href="/usuario/chat/${usuario.id}">
									<h3>${usuario.nombre} ${usuario.apellido} <img src="/img/${usuario.avatar}"
											alt="Avatar de ${usuario.nombre}" class="avatar-img" /></h3>
								</a>
								<h4>${usuario.facultad} ${usuario.carrera}</h4>
							</c:if>
						</c:forEach>
					</div>
					<div id="facultadUsuarios">
						<h1>Usuarios de tu facultad</h1>
						<c:forEach items="${usuariosMiFacultad}" var="usuario">
							<c:if test="${userInSession.id != usuario.id}">
								<a href="/usuario/chat/${usuario.id}">
									<h3>${usuario.nombre} ${usuario.apellido} <img src="/img/${usuario.avatar}"
											alt="Avatar de ${usuario.nombre}" class="avatar-img" /></h3>
								</a>
							</c:if>
						</c:forEach>
					</div>
					<div id="carreraUsuarios">
						<h1>Usuarios de tu carrera</h1>
						<c:forEach items="${usuariosMiCarrera}" var="usuario">
							<c:if test="${userInSession.id != usuario.id}">
								<a href="/usuario/chat/${usuario.id}">
									<h3>${usuario.nombre} ${usuario.apellido} <img src="/img/${usuario.avatar}"
											alt="Avatar de ${usuario.nombre}" class="avatar-img" /></h3>
								</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</body>

			</html>