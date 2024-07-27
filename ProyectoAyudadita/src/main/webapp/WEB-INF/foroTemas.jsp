<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Foros</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
        <div class="container-fluid">
            <a class="navbar-brand" href="/principal">
                <span class="material-icons-outlined">
                    home
                </span>
                <span class="d-lg-none ms-2">Home</span> <!-- Texto para dispositivos pequeños -->
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
                                        Cerrar sesi�n
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
                            <li>
                                <a class="dropdown-item" href="/editarPerfil">
                                    <span class="material-icons-outlined">
                                       Editar Perfil
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
		<div class="col-6">
			<h2>Foros</h2>
			<div class="border mb-3">
				<h1>Foros de tu carrera</h1>
				<c:forEach items="${forosTuCarrera}" var="foroTuCarrera">
    				<a href="/foro/tema/${foroTuCarrera.id}" class="btn btn-success">${foroTuCarrera.nombreForo}</a><br>
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
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>