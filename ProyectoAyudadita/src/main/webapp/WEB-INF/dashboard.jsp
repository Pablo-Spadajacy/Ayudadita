<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Bienvenido ${userInSession.nombre}</title>
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
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
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
                        <a class="nav-link" href="#">
                            <span class="material-symbols-outlined">
                                groups
                            </span>
                            <span class="d-lg-none">Grupos</span>
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
                        <a class="nav-link" href="./add-friend.html">
                            <span class="material-symbols-outlined">
                                person_add
                            </span>
                            <span class="d-lg-none">agregar persona</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./notifications.html">
                            <span class="material-symbols-outlined">
                                notifications
                            </span>
                            <span class="d-lg-none">Notificaciones</span>
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
                                        log out
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">
                                    <span class="material-icons-outlined">
                                        events
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/editarPerfil">
                                    <span class="material-icons-outlined">
                                        edit profile
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
		<header class="d-flex justify-content-between">
			<h1>Bienvenido ${userInSession.nombre} !</h1>
			
		</header>
		<div>
			<h2 class="mb-5">Compañeros de tu facultad</h2>			
			<c:forEach items="${listaAlumnos}" var="alumno">
					<c:if test="${userInSession.facultad == alumno.facultad}">
						<h3>-Nombre: ${alumno.nombre} ${alumno.apellido}</h3>
						<h3>-Facultad/Universidad: ${alumno.facultad}</h3>
						<h3>-Carrera: ${alumno.carrera}</h3>
					</c:if>
			</c:forEach><!-- MAXIMO 3 ALUMNOS  -->
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
	
	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>