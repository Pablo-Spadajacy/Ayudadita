package com.codingdojo.ayudadita.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.ayudadita.modelos.ForoCarrera;
import com.codingdojo.ayudadita.modelos.Mensaje;
import com.codingdojo.ayudadita.repositorios.RepositorioForo;
import com.codingdojo.ayudadita.repositorios.RepositorioMensaje;

@Service
public class ServicioForos {

	@Autowired
	RepositorioForo rf;
	
	@Autowired
	RepositorioMensaje rm;
	
	public List<ForoCarrera> forosDeMiCarrera(String carrera) {
		
		return rf.findByCarreraForo(carrera);
	}
	
	public List<ForoCarrera> ForoDeOtrasCarreras(String carerra){
		return rf.findByCarreraForoIsNot(carerra);
	}
	
	public List<ForoCarrera> ForosDeMiFacultad(String facultad)
	{
		return rf.findByFacultadForo(facultad);
	}
	
	public List<ForoCarrera> ForosOtrasFacultades(String facultad)
	{
		return rf.findByFacultadForoIsNot(facultad);
	}
	
	public Mensaje saveMessage(Mensaje mensaje) {
		return rm.save(mensaje);
	}
	
	public ForoCarrera buscarForo(Long foroId)
	{
		return rf.findById(foroId).orElse(null);
	}
	
	public ForoCarrera guardarForo(ForoCarrera foro)
	{
		return rf.save(foro);
	}
}
