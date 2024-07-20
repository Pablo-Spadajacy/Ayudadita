<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class = "container">
		<form:form action = "/crear/foro" method = "POST" modelAttribute = "foro">
			<div>
				<form:label  path = "nombreForo">Nombre del foro:</form:label>
				<form:input class = "form-control" path = "nombreForo"/>
				<form:errors  path = "nombreForo" class = "text-danger"/>
			</div>
			<div>
				<form:select path="carreraForo" class="form-select mt-3">
					<c:forEach items="${listaCarreras}" var="carrera">
						<form:option value="${carrera}">${carrera}</form:option>
					</c:forEach>
				</form:select>
				<form:errors path="carreraForo" class="text-danger"/>
			</div>
			<div>
				<form:select path="facultadForo" class="form-select mt-3">
					<c:forEach items="${listaFacultades}" var="facultad">
								<form:option value="${facultad}">${facultad}</form:option>
					</c:forEach>
				</form:select>
				<form:errors path="facultadForo" class="text-danger"/>
				<form:hidden value="${usuario.id}" path="admin" />
				<input type="submit" class="btn btn-success mt-3" value="Save" >
			</div>
		</form:form>
	</div>
</body>
</html>