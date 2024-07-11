<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between">
			<h1>Welcome ${userInSession.nombre} !</h1>
			<a class="btn btn-danger" href="/logout" >Cerrar sesion</a>
		</header>
	</div>
</body>
</html>