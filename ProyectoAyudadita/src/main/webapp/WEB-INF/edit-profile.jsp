<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage="true" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar perfil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
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
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/home">
                            <span class="material-symbols-outlined">
                                home
                            </span>
                            <span class="d-lg-none">Home</span>

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/foro/temas/">
                            <span class="material-symbols-outlined">
                                groups
                            </span>
                            <span class="d-lg-none">Foros</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./store.html">
                            <span class="material-symbols-outlined">
                                store
                            </span>
                            <span class="d-lg-none">Tienda</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./messenges.html">
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
                                <a class="dropdown-item" href="/logout">
                                    <span class="material-icons-outlined">
                                        Cerrar sesión
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/perfil/${userInSession.id}">
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
	<div class="container">
    <!-- fin de nav inicio de codigo-->
	<form action="/editarPerfil" method="post">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="email" value="${usuario.email}">
    <input type="hidden" name="id" value="${userInSession.id}">
	    
	    <div>
	        <label for="nombre">Nombre:</label>
	        <input type="text" id="nombre" name="nombre" class="form-control" value="${usuario.nombre}">
	        <span class="text-danger">${errors.nombre}</span>
	    </div>
	    
	    <div>
	        <label for="apellido">Apellido:</label>
	        <input type="text" id="apellido" name="apellido" class="form-control" value="${usuario.apellido}">
	        <span class="text-danger">${errors.apellido}</span>
	    </div>
	    
	    <div>
	        <p class="text-danger">AVISO: Si no quieres cambiar de facultad elije la actual</p>
	        <label for="facultad">Facultad:</label>
	        <select id="facultad" name="facultad" class="form-select mt-1">
	            <c:forEach items="${listaFacultades}" var="facultad">
	                <option value="${facultad}" ${usuario.facultad == facultad ? 'selected' : ''}>${facultad}</option>
	            </c:forEach>
	        </select>
	    </div>
	    
	    <div>
	        <p class="text-danger">AVISO: Si no quieres cambiar la carrera elije la actual</p>
	        <label for="carrera">Carrera:</label>
	        <select id="carrera" name="carrera" class="form-select mt-1">
	            <c:forEach items="${listaCarreras}" var="carrera">
	                <option value="${carrera}" ${usuario.carrera == carrera ? 'selected' : ''}>${carrera}</option>
	            </c:forEach>
	        </select>
	    </div>
	    
	    <div>
	        <label for="contrasenna">Debes colocar tu contraseña para verificar:</label>
	        <input type="password" id="contrasenna" name="contrasenna" class="form-control">
	        <span class="text-danger">${errors.contrasenna}</span>
	    </div>
	    
	    <p class="text-danger">${errorContra}</p>
	    
	    <input type="submit" value="Guardar Perfil" class="btn btn-success mt-3">
	</form>

	
	</div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>