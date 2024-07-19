package com.codingdojo.ayudadita.controladores;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.ayudadita.modelos.Carrera;
import com.codingdojo.ayudadita.modelos.Facultad;
import com.codingdojo.ayudadita.modelos.ForoCarrera;
import com.codingdojo.ayudadita.modelos.Mensaje;
import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ImgServicio;
import com.codingdojo.ayudadita.servicios.ServUsuario;
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
	
	//@Autowired
	//private RepositorioMensaje rm;
	
	@GetMapping("/principal")
	public String principal(Model model, HttpSession session) {
		
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		model.addAttribute("listaAlumnos", us.findAllUsers());
		return "dashboard.jsp";
	}
	
	@PostMapping("/prueba")
	public String pruebaImg(@RequestParam("file") MultipartFile file,
			                HttpSession session,
			                Model model) {
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		Long id = userTemp.getId();
		String nombreArchivo = is.guardarImg(file, id);
		
		userTemp.setAvatar(nombreArchivo);
		session.setAttribute("userInSession", userTemp);
		
		if(nombreArchivo == "error") {
			model.addAttribute("listaAlumnos", us.findAllUsers());
			System.out.println("error flaco");
			return "dashboard.jsp";
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
	public String crearMensaje(HttpSession session, 
							Model model, 
							@Valid @ModelAttribute("mensaje") Mensaje mensaje, BindingResult result)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		if (result.hasErrors())
		{
	        model.addAttribute("userInSession", userTemp);
			model.addAttribute("foro", mensaje.getForoCarrera());
			return "foro.jsp";
		}
		else
		{
			mensaje.setAutor(userTemp);
			sf.saveMessage(mensaje);
			return "redirect:/foro/tema/" + mensaje.getForoCarrera().getId();
		}
	}
	
	@GetMapping("/perfil/{id}")
	public String perfil(@PathVariable("id")Long id, HttpSession session, 
			Model model)
	{
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		
		Usuario perfilUsuario = us.findUser(id);
		
		model.addAttribute("usuario", perfilUsuario);
		
		return "perfil.jsp";
		
	}
}
