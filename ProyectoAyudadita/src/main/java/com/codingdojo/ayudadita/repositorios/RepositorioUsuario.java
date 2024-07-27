package com.codingdojo.ayudadita.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.Usuario;

@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario, Long>{
	
	Usuario findByEmail(String email);
	
	List<Usuario> findByFacultad(String facultad);
	List<Usuario> findByCarrera(String carrera);
	
	List<Usuario> findAll();
	
}
