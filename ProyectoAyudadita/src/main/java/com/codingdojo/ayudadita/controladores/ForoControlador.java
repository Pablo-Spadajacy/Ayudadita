package com.codingdojo.ayudadita.controladores;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.codingdojo.ayudadita.modelos.Usuario;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/foro")
public class ForoControlador{

    /*@Autowired
    private ForoServ foroServicio;

    public ForoServ getForoServicio() {
		return foroServicio;
	}

	public void setForoServicio(ForoServ foroServicio) {
		this.foroServicio = foroServicio;
	}

	@GetMapping("/crear")
    public String mostrarFormularioCreacion(HttpSession session, Model model) {
        Usuario usuario = (Usuario) session.getAttribute("userInSession");
        if (usuario == null) {
            return "redirect:/"; 
        }
       
        return "crear-foro.jsp"; 
    }

    @PostMapping("/crear")
    public String crearForo(@ModelAttribute("usuario") Usuario author){
        Foro nuevoForo = new Foro();
        nuevoForo.setAuthor(author);
        return "redirect:/foro/crear"; 
    }
    */
 
}


