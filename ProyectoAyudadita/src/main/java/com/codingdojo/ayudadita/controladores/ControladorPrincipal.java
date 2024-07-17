package com.codingdojo.ayudadita.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.servicios.ImgServicio;
import com.codingdojo.ayudadita.servicios.ServUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorPrincipal {
	
	@Autowired
	private ServUsuario us;
	
	@Autowired
	private ImgServicio is;
	
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
			return "dashboard.jsp";
		}
		
		
		return "redirect:/principal";
	}
}
