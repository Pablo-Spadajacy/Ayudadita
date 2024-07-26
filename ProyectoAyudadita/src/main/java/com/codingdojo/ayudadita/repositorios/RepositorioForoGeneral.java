package com.codingdojo.ayudadita.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.ForoGeneral;

@Repository
public interface RepositorioForoGeneral extends CrudRepository <ForoGeneral, Long>{
	
	ForoGeneral findByNombre(String nombre);
}