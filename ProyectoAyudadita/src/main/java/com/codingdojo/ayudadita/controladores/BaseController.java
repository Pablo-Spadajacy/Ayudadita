package com.codingdojo.ayudadita.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.ayudadita.modelos.Carrera;
import com.codingdojo.ayudadita.modelos.Facultad;
import com.codingdojo.ayudadita.modelos.ForoGeneral;
import com.codingdojo.ayudadita.modelos.MensajeForoGeneral;
import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ServUsuario;
import com.codingdojo.ayudadita.servicios.ServicioForoGeneral;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BaseController {
	
	@Autowired
	private ServUsuario us;
	
	@Autowired
	private ServicioForoGeneral servGeneral;
	
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") Usuario newUser, Model model) {
		
		model.addAttribute("listaFacultades", Facultad.Facultades);
		model.addAttribute("listaCarreras", Carrera.Carreras);
		
		return "index.jsp";
	}
	@GetMapping("/sobreNosotros")
	public String sobreNosotros(@ModelAttribute("newUser") Usuario newUser, Model model) {
			
		model.addAttribute("listaFacultades", Facultad.Facultades);
		model.addAttribute("listaCarreras", Carrera.Carreras);
		
		return "sobreNosotros.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") Usuario newUser,
						   BindingResult result, HttpSession session,
						   Model model) {
		
		if (newUser.getContrasenna().length() < 6)
		{
			result.rejectValue("contrasenna", "Length", "La contraseña debe tener al menos 6 caracteres");
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			return "index.jsp";
		}
		
		us.register(newUser, result);
		
		
		if(result.hasErrors()) {
			model.addAttribute("listaFacultades", Facultad.Facultades);
			model.addAttribute("listaCarreras", Carrera.Carreras);
			return "index.jsp";
		} else {
			ForoGeneral foroGeneral = servGeneral.buscarForoPorNombre("Foro General");
		    model.addAttribute("foro", foroGeneral);
		    model.addAttribute("mensajeForoGeneral", new MensajeForoGeneral());
			session.setAttribute("userInSession", newUser);
			model.addAttribute("listaAlumnos", us.findAllUsers());
			return "dashboard.jsp";
		}
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("correo") String email,
						@RequestParam("password") String password,
						RedirectAttributes redirectAttributes, /*usar mensajes de Flash*/   
						HttpSession session){
		
		
		
		Usuario userTryingLogin = us.login(email, password); //Obj User o null
		
		if(userTryingLogin == null) {
			//Tiene algo mal
			redirectAttributes.addFlashAttribute("errorLogin", "Contraseña o correo incorrecto");
			return "redirect:/";
		} else {
			session.setAttribute("userInSession", userTryingLogin); //Guardando en sesión el objeto de User
			return "redirect:/principal";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInSession");
		return "redirect:/";
	}
}
