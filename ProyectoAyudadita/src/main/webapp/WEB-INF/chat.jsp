<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Mensajes</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/style2.css">
            </head>

            <body>
                <div class="container">
                    <h1>Chat con ${otroUsuario.nombre} ${otroUsuario.apellido}</h1>

                    <div class="chat-mensajes">
                        <c:forEach var="mensaje" items="${mensajes}">
                            <div class="mensaje">
                                <strong>${mensaje.autor.nombre} ${mensaje.autor.apellido}:</strong>
                                <p>${mensaje.contenido}</p>
                                <small>${mensaje.createdAt}</small>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="enviar-mensaje">
                        <form action="/usuario/chat/${otroUsuario.id}/enviar" method="post">
                            <div class="form-group">
                                <textarea name="contenido" class="form-control"
                                    placeholder="Escribe tu mensaje aqu�"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </form>
                    </div>
                </div>
            </body>

            </html>