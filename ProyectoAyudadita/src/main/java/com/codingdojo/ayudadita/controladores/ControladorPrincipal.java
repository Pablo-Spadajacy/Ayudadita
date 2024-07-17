package com.codingdojo.ayudadita.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ServUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorPrincipal {
	
	@Autowired
	private ServUsuario us;
	
	
	@GetMapping("/principal")
	public String principal(Model model, HttpSession session) {
		
		Usuario userTemp = (Usuario) session.getAttribute("userInSession");
		if(userTemp == null) {
			return "redirect:/";
		}
		model.addAttribute("listaAlumnos", us.findAllUsers());
		return "dashboard.jsp";
	}
}
