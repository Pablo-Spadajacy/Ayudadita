package com.codingdojo.ayudadita.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorPrincipal {
	
	
	@GetMapping("/dashboard")
	public String dashboard() {
		
		return "dashboard.jsp";
	}
}
