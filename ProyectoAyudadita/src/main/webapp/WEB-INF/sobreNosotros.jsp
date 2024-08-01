<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
                    rel="stylesheet">
                <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ayu22.png"
                    alt="logo-ayudadita">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
                <title>Ayudadita</title>
            </head>

            <body>
                <div>
                    <header>
                        <img src="${pageContext.request.contextPath}/images/ayu.png" alt="logo-ayudadita" class="logo">
                        <nav class="navegacion">
							<a href="/">Inicio</a>
							<a href="/sobreNosotros">Sobre nosotros</a>
							<button class="btn-subb">Iniciar Sesión</button>
						</nav>
					</header>

					<div class="fondo position-absolute top-50 start-50 translate-middle">
						<span class="icono-cerrar"><i class="fa-solid fa-xmark"></i></span>
						<div class="contenedor-form login active-form">
							<h2>Iniciar sesión</h2>
							<form action="/login" method="POST">
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-envelope"></i></span>
									<input type="email" class="form-control" name="correo" required placeholder="Correo">
								</div>
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-lock"></i></span>
									<input type="password" class="form-control" name="password" required placeholder="Contraseña">
								</div>
								<p class="text-danger">${errorLogin}</p>
								<div class="recordar d-flex justify-content-between">
									<label for="#"><input type="checkbox">Recordar sesión</label>
									<a href="#">¿Olvidaste la contraseña?</a>
								</div>
								<input type="submit" class="btn-subb" value="Iniciar sesion">
								<div class="registrar">
									<p>¿No tenés cuenta? <a href="#" class="registrar-link">Registrarse</a></p>
								</div>
							</form>
						</div>





						<div class="contenedor-form registrar">
							<h2>Registrarse</h2>

							<form:form action="/register" method="post" modelAttribute="newUser">
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-user"></i></span>
									<form:input path="nombre" class="form-control" placeholder="Nombre"/>
									<form:errors path="nombre" class="text-danger" />
								</div>
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-user"></i></span>
									<form:input path="apellido" class="form-control" placeholder="Apellido" />
									<form:errors path="apellido" class="text-danger" />
								</div>
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-envelope"></i></span>
									<form:input path="email" class="form-control" placeholder="Correo"/>
									<form:errors path="email" class="text-danger" />
								</div>
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-lock"></i></span>
									<form:password path="contrasenna" class="form-control" placeholder="Contraseña"/>
									<form:errors path="contrasenna" class="text-danger" />
								</div>
								<div class="contenedor-input">
									<span class="icono"><i class="fa-solid fa-lock"></i></span>
									<form:password path="confirmar" class="form-control" placeholder="Contraseña"/>
									<form:errors path="confirmar" class="text-danger" />
								</div>
								<div class="contenedor-input">
									<form:select path="facultad" class="form-select">
										<c:forEach items="${listaFacultades}" var="facultad">
											<form:option value="${facultad}">${facultad}</form:option>
										</c:forEach>
									</form:select>
									<form:errors path="facultad" class="text-danger" />
								</div>
								<div class="contenedor-input">
									<form:select path="carrera" class="form-select">
										<c:forEach items="${listaCarreras}" var="carrera">
											<form:option value="${carrera}">${carrera}</form:option>
										</c:forEach>
									</form:select>
									<form:errors path="facultad" class="text-danger" />
								</div>
								<input type="submit" class="btn-subb" value="Registro">
								<div class="registrar">
									<p>¿Tienes una cuenta? <a href="#" class="login-link">Iniciar sesión</a></p>
								</div>
							</form:form>
                        </div>
                    </div>

                    <section class="sobre-nosotros">
                        <h1 class="text-center mb-5">Sobre Nosotros</h1>

                        <div class="historia mb-5">
                            <h2>Historia del Proyecto</h2>
                            <p>
                                Ayudadita nació durante un bootcamp de Java + Spring Boot. Identificamos la necesidad de
                                una
                                plataforma donde los estudiantes pudieran compartir recursos académicos de manera
                                sencilla y
                                eficiente. Este proyecto fue diseñado para abordar esa necesidad y proporcionar una
                                herramienta útil para la comunidad estudiantil.
                            </p>
                        </div>

                        <div class="equipo">
                            <h2>Nuestro Equipo</h2>
                            <div class="row">
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/cande.png"
                                        class="img-fluid rounded-circle mb-3" alt="Cande Valente">
                                    <h4><a href="https://www.linkedin.com/in/candela-valente/" target="_blank">Cande
                                            Valente</a></h4>
                                    <p>Frontend / Backend</p>
                                </div>
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/fede.png"
                                        class="img-fluid rounded-circle mb-3" alt="Fede Bobruk">
                                    <h4><a href="https://www.linkedin.com/in/federico-bobruk-b64987295/"
                                            target="_blank">Federico Bobruk</a></h4>
                                    <p>Backend</p>
                                </div>
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/david.png"
                                        class="img-fluid rounded-circle mb-3" alt="David Villarte">
                                    <h4><a href="https://www.linkedin.com/in/fernando-david-villarte-alvarez-759282237/"
                                            target="_blank">David Villarte</a></h4>
                                    <p>Backend</p>
                                </div>
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/lucas.png"
                                        class="img-fluid rounded-circle mb-3" alt="Lucas Flores">
                                    <h4><a href="https://www.linkedin.com/in/lucas-matias-flores-899369316/"
                                            target="_blank">Lucas Flores</a></h4>
                                    <p>Backend</p>
                                </div>
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/pablo.png"
                                        class="img-fluid rounded-circle mb-3" alt="Pablo Quiroga">
                                    <h4><a href="https://www.linkedin.com/in/pablo-francisco-quiroga/"
                                            target="_blank">Pablo
                                            Quiroga</a></h4>
                                    <p>Backend</p>
                                </div>
                                <div class="col-md-4 text-center mb-4">
                                    <img src="${pageContext.request.contextPath}/images/vanina.png"
                                        class="img-fluid rounded-circle mb-3" alt="Vanina Vilte">
                                    <h4><a href="https://www.linkedin.com/in/vanina-vilte/" target="_blank">Vanina
                                            Vilte</a>
                                    </h4>
                                    <p>Frontend</p>
                                </div>
                            </div>
                        </div>

                        <div class="vision-mision mb-5">
                            <h2>Visión y Misión</h2>
                            <p>
                                Nuestra visión es convertirnos en la plataforma de referencia para estudiantes
                                universitarios que buscan recursos académicos y colaboración. Nuestra misión es
                                facilitar el
                                intercambio de conocimientos y crear una comunidad sólida de apoyo mutuo.
                            </p>
                        </div>

                        <div class="proceso mb-5">
                            <h2>Proceso de Desarrollo</h2>
                            <p>
                                El desarrollo de Ayudadita comenzó con la identificación de la problemática y la
                                propuesta
                                de soluciones innovadoras. A través de varias fases de diseño, desarrollo y pruebas,
                                logramos lanzar una plataforma funcional y efectiva. Cada miembro del equipo aportó su
                                experiencia y habilidades para hacer de Ayudadita una realidad.
                            </p>
                        </div>
                    </section>
                    <footer>
                        <div class="footer-container">
                            <div class="footer-section">
                                <h5>Contacto</h5>
                                <p>Email: <a href="mailto:info@ayudadita.com" target="_blank">info@ayudadita.com</a></p>
                                <p>Teléfono: <a href="tel:+1160331521" target="_blank">011 4567 8910</a></p>
                                <p>Dirección: <a href="https://maps.app.goo.gl/6BvpgxMJzFM9auxe6" target="_blank">24 de
                                        Noviembre
                                        2120, Cdad. Autónoma de Buenos Aires</a></p>
                            </div>
                            <div class="footer-section">
                                <h5>Síguenos</h5>
                                <a href="https://www.twitter.com/ayudadita" target="_blank" class="social-icon"><i
                                        class="fab fa-twitter"></i></a>
                                <a href="https://www.instagram.com/ayudadita" target="_blank" class="social-icon"><i
                                        class="fab fa-instagram"></i></a>
                                <a href="https://www.linkedin.com/company/ayudadita" target="_blank"
                                    class="social-icon"><i class="fab fa-linkedin"></i></a>
                                <ul>
                                    <li><a href="#" data-toggle="modal" data-target="#termsModal">Términos y
                                            Condiciones</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <p>&copy; 2024 Ayudadita. Todos los derechos reservados.</p>
                        </div>
                    </footer>

                    <!-- Términos y Condiciones Modal -->
                    <div class="modal fade" id="termsModal" tabindex="-1" role="dialog"
                        aria-labelledby="termsModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="termsModalLabel">Términos y Condiciones</h5>
                                </div>
                                <div class="modal-body">
                                    <!-- Insertar aquí el texto de Términos y Condiciones -->
                                    <p>
                                        Bienvenido a Ayudadita. Al usar nuestra aplicación, aceptas cumplir con los
                                        siguientes
                                        términos y condiciones.
                                    </p>
                                    <h5>1. Uso de la Aplicación</h5>
                                    <p>
                                        Ayudadita está destinada a proporcionar una plataforma para que los estudiantes
                                        universitarios compartan apuntes, formen grupos de estudio y participen en foros
                                        de
                                        discusión. Los usuarios deben usar la aplicación de manera responsable y
                                        respetuosa.
                                    </p>
                                    <h5>2. Contenidos</h5>
                                    <p>
                                        Los usuarios son responsables de los contenidos que comparten en la plataforma.
                                        Ayudadita no
                                        se hace responsable por la exactitud o fiabilidad de los contenidos
                                        proporcionados
                                        por los
                                        usuarios.
                                    </p>
                                    <h5>3. Privacidad</h5>
                                    <p>
                                        Respetamos tu privacidad y protegemos tus datos personales de acuerdo con
                                        nuestra
                                        política
                                        de privacidad.
                                    </p>
                                    <h5>4. Exención de Responsabilidad</h5>
                                    <p>
                                        Ayudadita no se hace responsable de ningún daño, pérdida o perjuicio que pueda
                                        resultar del
                                        uso de la aplicación o de la interacción entre los usuarios, incluyendo, pero no
                                        limitado a,
                                        reuniones personales organizadas a través de la plataforma. Los usuarios son
                                        responsables de
                                        tomar las precauciones necesarias al interactuar con otros usuarios.
                                    </p>
                                    <h5>5. Modificaciones</h5>
                                    <p>
                                        Nos reservamos el derecho de modificar estos términos y condiciones en cualquier
                                        momento.
                                        Los cambios serán efectivos inmediatamente después de su publicación en la
                                        aplicación.
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="${pageContext.request.contextPath}/app.js"></script>
                <script src="https://kit.fontawesome.com/1f08a9747b.js" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
            </body>

            </html>