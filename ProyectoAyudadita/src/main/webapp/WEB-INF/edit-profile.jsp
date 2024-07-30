<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>edit profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <%@ page isErrorPage="true" %>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #835448;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/principal">
                <span class="material-icons-outlined">
                    home
                </span>
                <span class="d-lg-none ms-2">Home</span> <!-- Texto para dispositivos pequeÃ±os -->
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
                <a href="/principal" class="btn btn-danger">Cancelar</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="principal">
                            <span class="material-symbols-outlined">
                                home
                            </span>
                            <span class="d-lg-none">Home</span>

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/foro/temas">
                            <span class="material-symbols-outlined">
                                groups
                            </span>
                            <span class="d-lg-none">Grupos</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/">
                            <span class="material-symbols-outlined">
                                store
                            </span>
                            <span class="d-lg-none">Tienda</span>
                        </a>
                    </li>                    
                    <li class="nav-item">
                        <a class="nav-link" href="/messenges">
                            <span class="material-symbols-outlined">
                                chat
                            </span>
                            <span class="d-lg-none">Chat</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="material-symbols-outlined">
                                account_circle
                            </span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item" href="#">
                                    <span class="material-icons-outlined">
                                        cerrar Sesion
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">
                                    <span class="material-icons-outlined">
                                        Perfil
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<div class="container justify-content-between">
    <div class="row">
	    <div class="col-6">
		<form:form action="/editarPerfil" method="post" modelAttribute="usuario">
		<input type="hidden" name="_method" value="PUT">
		<input type="hidden" name="email" value="${usuario.email}">
	    <input type="hidden" name="id" value="${userInSession.id}">
	    <input type="hidden" name="avatar" value="${usuario.avatar}">
			<div>
				<form:label path="nombre">Nombre:</form:label>
				<form:input path="nombre" class="form-control" />
				<form:errors path="nombre" class="text-danger" />
			</div>
			<div>
				<form:label path="apellido">Apellido:</form:label>
				<form:input path="apellido" class="form-control" />
				<form:errors path="apellido" class="text-danger" />
			</div>
			<div>
				<form:label path="facultad">Facultad:</form:label>
				<form:select path="facultad" class="form-select">
					<c:forEach items="${listaFacultades}" var="facultad">
						<form:option value="${facultad}">${facultad}</form:option>
					</c:forEach>
				</form:select>
				<p class="text-danger">AVISO: Si no quires cambiar de facultad elije la actual</p>
			</div>
			<div>
				<form:label path="carrera">Carrera:</form:label>
				<form:select path="carrera" class="form-select">
					<c:forEach items="${listaCarreras}" var="carrera">
						<form:option value="${carrera}">${carrera}</form:option>
					</c:forEach>
				</form:select>
				<p class="text-danger">AVISO: Si no quires cambiar la carrera elije la actual</p>
				<form:errors path="facultad" class="text-danger"/>
			</div>
			
			<div>
				<form:label path="contrasenna">Debes colocar tu contraseña para verificar</form:label>
				<input type="password" class="form-control" name="contrasenna"/>
				<form:errors path="contrasenna" class="text-danger"/>
			</div>
			<p class="text-danger">${errorContra}</p>
			<p class="text-danger">${size}</p>
			<input type="submit" value="Guardar Perfil" class="btn btn-success mt-1">
		</form:form>	
	    
	    
		</div>
		<div class="col-6">
			<h2>¿No te gusta tu avatar? ¡Cambialo!</h2>
			<form action="/imagen" method="post" enctype="multipart/form-data">
		        <input type="file" name="file" accept="image/*" required />
		        <br/><br/>
	        <button type="submit">Cargar Imagen</button>
		</form>	
		</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>