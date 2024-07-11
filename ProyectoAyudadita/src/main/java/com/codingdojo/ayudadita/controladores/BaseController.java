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

import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ServUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BaseController {
	
	@Autowired
	private ServUsuario us;
	
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") Usuario newUser, Model model) {
		
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") Usuario newUser,
						   BindingResult result, HttpSession session,
						   Model model) {
		
		us.register(newUser, result);
		
		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			session.setAttribute("userInSession", newUser);
			return "dashboard.jsp";
		}
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email") String email,
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
			return "redirect:/tasks";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInSession");
		return "redirect:/";
	}
}
