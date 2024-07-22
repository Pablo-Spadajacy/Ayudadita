package com.codingdojo.ayudadita.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.Foro;

@Repository
public interface RepositorioForoGeneral extends CrudRepository <Foro , Long>{
	
}