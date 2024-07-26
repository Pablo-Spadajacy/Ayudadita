package com.codingdojo.ayudadita.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.Mensaje;

@Repository
public interface RepositorioMensaje extends CrudRepository<Mensaje, Long> {
	
	//List<Mensaje> findByChat(Chat chat);
}
