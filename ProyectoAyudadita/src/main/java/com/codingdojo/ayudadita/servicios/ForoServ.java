package com.codingdojo.ayudadita.servicios;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.ayudadita.modelos.Foro;
import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.repositorios.RepositorioForoGeneral;

@Service
public class ForoServ {

    @Autowired
    private RepositorioForoGeneral rpg;

    public Foro crearForo( Usuario author) {
        Foro nuevoForo = new Foro();
        nuevoForo.setAuthor(author);
        return rpg.save(nuevoForo);
    }

	

}
