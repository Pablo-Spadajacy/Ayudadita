package com.codingdojo.ayudadita.controladores;




import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.ayudadita.modelos.Carrera;
import com.codingdojo.ayudadita.modelos.Facultad;
import com.codingdojo.ayudadita.modelos.ForoCarrera;
import com.codingdojo.ayudadita.modelos.ForoGeneral;
import com.codingdojo.ayudadita.modelos.Mensaje;
import com.codingdojo.ayudadita.modelos.MensajeForoGeneral;
import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ImgServicio;
import com.codingdojo.ayudadita.servicios.ServUsuario;
import com.codingdojo.ayudadita.servicios.ServicioForoGeneral;
import com.codingdojo.ayudadita.servicios.ServicioForos;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPrincipal {
	
	@Autowired
	private ServUsuario us;
	
	@Autowired
	private ImgServicio is;
	
	@Autowired
	private ServicioForos sf;
	
	@Autowired
	private ServicioForoGeneral servGeneral;
	
	//@Autowired
	//private ServicioChat sc;
	
	//@Autowired
	//private RepositorioMensaje rm;
	
	@GetMapping("/principal")
	public String principal(Model model, HttpSession session, @ModelAttribute("mensajeForoGeneral") MensajeForoGeneral mensaje) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		servGeneral.init();
		
		ForoGeneral foroGeneral = servGeneral.buscarForoPorNombre("Foro General");
		List<MensajeForoGeneral> mensajesForoGeneral = servGeneral.buscarMensajesPorForo(foroGeneral.getId());
	    model.addAttribute("foro", foroGeneral);
	    model.addAttribute("listaAlumnos", us.findAllUsers());
	    model.addAttribute("mensajeForoGeneral", new MensajeForoGeneral());
	    model.addAttribute("mensajesForoGeneral", mensajesForoGeneral);
	    return "dashboard.jsp";
	}
	
	@PostMapping("/imagen")
	public String cargarAvatar(@RequestParam("file") MultipartFile file,
							HttpSession session,
			                Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
				
		Long id = userTemp.getId();
		String nombreArchivo;
		try {
			nombreArchivo = is.guardarImg(file, id);
			userTemp.setAvatar(nombreArchivo);
			session.setAttribute("userInSession", userTemp);
			
			
			if(nombreArchivo.equals("error")) {
				model.addAttribute("listaAlumnos", us.findAllUsers());
				System.out.println("error en el guardado");
				return "dashboard.jsp";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/principal";
	}
	
	@GetMapping("/foro/temas/")
	public String foroTemas(HttpSession session, Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		Usuario buscarUsuario = us.findUser(userTemp.getId());
		//Foros de mi carrera
		
		List<ForoCarrera> forosTuCarrera = sf.forosDeMiCarrera(buscarUsuario.getCarrera());
		
		//Foros de otras carreras
		List<ForoCarrera> foroOtrasCarreras = sf.ForoDeOtrasCarreras(buscarUsuario.getCarrera());
		
		//Foros de mi facultad
		List<ForoCarrera> forosTuFacultad = sf.ForosDeMiFacultad(buscarUsuario.getFacultad());
		
		//Foros de otras facultades
		List<ForoCarrera> forosOtrasFacultades = sf.ForosOtrasFacultades(buscarUsuario.getFacultad());
		
		model.addAttribute("usuario", buscarUsuario);
		model.addAttribute("forosTuCarrera", forosTuCarrera);
		model.addAttribute("foroOtrasCarreras", foroOtrasCarreras);
		model.addAttribute("forosTuFacultad", forosTuFacultad);
		model.addAttribute("foroOtrasFacultades", forosOtrasFacultades);
		return "foroTemas.jsp";
	}
	
	@GetMapping("/crear/foro")
	public String crearForoInicio(HttpSession session, @ModelAttribute("foro") ForoCarrera nuevoForo, Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		if (userTemp.getId() == 1)
		{
			Usuario buscarUsuario = us.findUser(userTemp.getId());
			List<ForoCarrera> forosTuCarrera = sf.forosDeMiCarrera(buscarUsuario.getCarrera());
			List<ForoCarrera> foroOtrasCarreras = sf.ForoDeOtrasCarreras(buscarUsuario.getCarrera());
			model.addAttribute("usuario", buscarUsuario);
			model.addAttribute("forosTuCarrera", forosTuCarrera);
			model.addAttribute("foroOtrasCarreras", foroOtrasCarreras);
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			return "crearForo.jsp";
		}
		else
		{
			model.addAttribute("listaAlumnos", us.findAllUsers());
			return "dashboard.jsp";
		}
		
	}
	
	@PostMapping("/crear/foro")
	public String crearForo(HttpSession session, @Valid @ModelAttribute("foro") ForoCarrera nuevoForo, BindingResult result, Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		if (result.hasErrors())
		{
			Usuario buscarUsuario = us.findUser(userTemp.getId());
			List<ForoCarrera> forosTuCarrera = sf.forosDeMiCarrera(buscarUsuario.getCarrera());
			List<ForoCarrera> foroOtrasCarreras = sf.ForoDeOtrasCarreras(buscarUsuario.getCarrera());
			model.addAttribute("usuario", buscarUsuario);
			model.addAttribute("forosTuCarrera", forosTuCarrera);
			model.addAttribute("foroOtrasCarreras", foroOtrasCarreras);
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			return "crearForo.jsp";
		}
		else
		{
			sf.guardarForo(nuevoForo);
			return "redirect:/foro/temas/";
		}
	}
	
	@GetMapping("/foro/tema/{id}")
	public String foroCarrera(@PathVariable("id") Long id, HttpSession session, 
							Model model, 
							@ModelAttribute("mensaje") Mensaje mensaje)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		ForoCarrera foroBuscado = sf.buscarForo(id);
		model.addAttribute("foro", foroBuscado);
		mensaje.setForoCarrera(foroBuscado);
		return "foro.jsp";
		
	}
	
	@PostMapping("/crear/mensaje")
	public String crearMensaje(@RequestParam(value = "file", required = false) MultipartFile file,
	                           @Valid @ModelAttribute("mensaje") Mensaje mensaje,
	                           BindingResult result,
	                           HttpSession session,
	                           Model model) {
	    Usuario userTemp = (Usuario) session.getAttribute("userInSession");
	    if (userTemp == null) {
	        return "redirect:/";
	    }

	    // Verifica que al menos uno de los campos (contenido o imagen) esté presente
	    if ((mensaje.getContenido() == null || mensaje.getContenido().trim().isEmpty()) && (file == null || file.isEmpty())) {
	        result.rejectValue("contenido", "error.mensaje", "Debes ingresar un mensaje o subir una imagen.");
	        Long foroId = mensaje.getForoCarrera().getId();
	        ForoCarrera foroBuscado = sf.buscarForo(foroId);
	        model.addAttribute("foro", foroBuscado);
	        mensaje.setForoCarrera(foroBuscado);
	    }

	    if (result.hasErrors()) {
	        model.addAttribute("userInSession", userTemp);
	        model.addAttribute("foro", mensaje.getForoCarrera());
	        return "foro.jsp";
	    }

	    // Primero guarda el mensaje
	    Mensaje mensajeGuardado = sf.saveMessage(mensaje);

	    // Luego maneja el archivo (si existe)
	    if (file != null && !file.isEmpty()) {
	        // Guarda la imagen y obtiene el nombre del archivo
	        String nombreArchivo = sf.guardarImg(file, mensajeGuardado.getId());
	        if (!"error".equals(nombreArchivo)) {
	            mensajeGuardado.setUrlFotoForo(nombreArchivo);
	            sf.saveMessage(mensajeGuardado); // Actualiza el mensaje con la URL de la imagen
	        } else {
	            model.addAttribute("error", "Error al guardar la imagen");
	            // Aunque haya un error, puedes optar por redirigir al usuario a la misma página
	        }
	    }

	    return "redirect:/foro/tema/" + mensaje.getForoCarrera().getId();
	}
	
	@GetMapping("/chats")
	public String chats(HttpSession session, Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		List<Usuario> todosUsuarios = us.findAllUsers();
		List<Usuario> usuariosDeMiFacultad = us.usuariosDeMiFacultad(userTemp.getFacultad());
		List<Usuario> usuariosDeMiCarrera = us.usuariosDeMiCarrera(userTemp.getCarrera());
		
		model.addAttribute("todosUsuarios", todosUsuarios);
		model.addAttribute("usuariosMiFacultad", usuariosDeMiFacultad);
		model.addAttribute("usuariosMiCarrera", usuariosDeMiCarrera);
		
		return "chats.jsp";
	}
	
	@GetMapping("/chats/filtrado")
	public String chatFiltrado(HttpSession session, Model model, @RequestParam("tipoFiltrado")String tipoFiltrado)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		List<Usuario> todosUsuarios = us.findAllUsers();
		List<Usuario> usuariosDeMiFacultad = us.usuariosDeMiFacultad(userTemp.getFacultad());
		List<Usuario> usuariosDeMiCarrera = us.usuariosDeMiCarrera(userTemp.getCarrera());
		
		if ("facultad".equals(tipoFiltrado))
		{
			model.addAttribute("usuariosMiFacultad", usuariosDeMiFacultad);
		}
		else if ("carrera".equals(tipoFiltrado))
		{
			model.addAttribute("usuariosMiCarrera", usuariosDeMiCarrera);
		}
		else if ("todos".equals(tipoFiltrado))
		{
			model.addAttribute("todosUsuarios", todosUsuarios);
		}
		
		return "chats.jsp";
	}
	
	/*@GetMapping("/usuario/chat/{id}")
	public String usuarioChat(@PathVariable("id") Long id,HttpSession session, Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		Usuario otroUsuario = us.findUser(id);
		
		Chat chat = sc.iniciarChat(userTemp, otroUsuario);
		
		List<Mensaje> mensajes = sc.todosLosMensajesDelChat(chat);
		
		model.addAttribute("chat", chat);
		model.addAttribute("mensajes", mensajes);
		model.addAttribute("otroUsuario", otroUsuario);
		
		return "chat.jsp";
		
	}
	
	@PostMapping("/usuario/chat/{id}/enviar")
    public String enviarMensaje(@PathVariable("id") Long id, @RequestParam("contenido") String contenido, HttpSession session) {
        Usuario userTemp = (Usuario) session.getAttribute("userInSession");
        if (userTemp == null) {
            return "redirect:/";
        }

        Usuario otroUsuario = us.findUser(id);
        if (otroUsuario == null) {
            return "redirect:/chats";
        }

        Chat chat = sc.iniciarChat(userTemp, otroUsuario);
        sc.enviarMensaje(chat, userTemp, contenido);

        return "redirect:/usuario/chat/" + id;
    }
    */
	
	
	@GetMapping("/perfil/{id}")
	public String perfil(@PathVariable("id")Long id, HttpSession session, 
			Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		ForoGeneral foroGeneral = servGeneral.buscarForoPorNombre("Foro General");
		model.addAttribute("foro", foroGeneral);
		
		Usuario perfilUsuario = us.findUser(id);
		
		model.addAttribute("usuario", perfilUsuario);
		
		return "perfil.jsp";
		
		
		
		
		
	}
	@GetMapping("/home")//PENDIENTE 
	public String home(HttpSession session,
		               Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		return "home.jsp";
	}//PENDIENTE
	
	
	
	
	@GetMapping("/editarPerfil")
	public String editProfile(@ModelAttribute("usuario") Usuario usuario, HttpSession session,
							  Model model,
							  BindingResult result) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		userTemp.setContrasenna("");
		model.addAttribute("usuario", us.findUser(userTemp.getId()));
		
		model.addAttribute("listaFacultades", Facultad.Facultades);
		model.addAttribute("listaCarreras", Carrera.Carreras);
		
		
		
		return "edit-profile.jsp";
	}
	@PutMapping("/editarPerfil")
	public String actualizarPerfil(@Valid @ModelAttribute("usuario") Usuario usuario, HttpSession session,
								   Model model, 
								   BindingResult result) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		Usuario UsuarioCheck = us.chequeo(usuario.getEmail(), usuario.getContrasenna());
		
		if(result.hasErrors()) {
			
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			
			userTemp.setContrasenna("");
			model.addAttribute("usuario", us.findUser(userTemp.getId()));
			
			model.addAttribute("errorContra", "La contraseña no es correcta");
			return "edit-profile.jsp";
		}
		
		if(UsuarioCheck == null) {
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			
			userTemp.setContrasenna("");
			model.addAttribute("usuario", us.findUser(userTemp.getId()));
			
			model.addAttribute("errorContra", "La contraseña es erronea");
			return "edit-profile.jsp";
		}
		
		if(UsuarioCheck.getContrasenna() == "lessSize") {
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			
			userTemp.setContrasenna("");
			model.addAttribute("usuario", us.findUser(userTemp.getId()));
			
			model.addAttribute("size", "La contraseña es demasiado corta");
			return "edit-profile.jsp";
		}
		else {
			String contra = usuario.getContrasenna();
			String pass_hash = BCrypt.hashpw(contra, BCrypt.gensalt());
			usuario.setContrasenna(pass_hash);
			System.out.println("aquí");
			us.save(usuario);
			userTemp = usuario;
			session.setAttribute("userInSession", userTemp);
		}
		
		return "redirect:/principal";
	}
	
	@PostMapping("/crear/mensaje/foroGeneral")
	public String crearMensajeForoGeneral(@RequestParam(value = "foto", required = false) MultipartFile file,
	                                      @Valid @ModelAttribute("mensajeForoGeneral") MensajeForoGeneral mensaje,
	                                      BindingResult result,
	                                      HttpSession session,
	                                      Model model) {
	    Usuario userTemp = (Usuario) session.getAttribute("userInSession");
	    if (userTemp == null) {
	        return "redirect:/";
	    }

	    // Verifica que al menos uno de los campos (contenido o imagen) esté presente
	    if ((mensaje.getContenido() == null || mensaje.getContenido().trim().isEmpty()) && (file == null || file.isEmpty())) {
	        result.rejectValue("contenido", "error.mensaje", "Debes ingresar un mensaje o subir una imagen.");
	    }

	    if (result.hasErrors()) {
	        model.addAttribute("userInSession", userTemp);
	        model.addAttribute("mensajeForoGeneral", mensaje);
	        return "dashboard.jsp";
	    }

	    // Asigna el foro general al mensaje
	    ForoGeneral foroGeneral = servGeneral.buscarForoPorNombre("Foro General");
	    if (foroGeneral == null) {
	        model.addAttribute("error", "Foro General no encontrado");
	        return "dashboard.jsp";
	    }
	    mensaje.setForoGeneral(foroGeneral);
	    mensaje.setAutorForoGeneral(userTemp);

	    // Primero guarda el mensaje
	    MensajeForoGeneral mensajeGuardado = servGeneral.saveMessage(mensaje);

	    // Luego maneja el archivo (si existe)
	    if (file != null && !file.isEmpty()) {
	        // Guarda la imagen y obtiene el nombre del archivo
	        String nombreArchivo = servGeneral.guardarImg(file, mensajeGuardado.getId());
	        if (!"error".equals(nombreArchivo)) {
	            mensajeGuardado.setUrlFotoForo(nombreArchivo);
	            servGeneral.saveMessage(mensajeGuardado); // Actualiza el mensaje con la URL de la imagen
	        } else {
	            model.addAttribute("error", "Error al guardar la imagen");
	            // Aunque haya un error, puedes optar por redirigir al usuario a la misma página
	        }
	    }

	    return "redirect:/principal";
	}
}

