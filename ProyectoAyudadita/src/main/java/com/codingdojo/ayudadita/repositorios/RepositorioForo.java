package com.codingdojo.ayudadita.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.ForoCarrera;

@Repository
public interface RepositorioForo extends CrudRepository<ForoCarrera, Long> {

	//Para que traiga mis carreras
	List<ForoCarrera> findByCarreraForo(String carrera);
	//Para que traiga otras carreras
	List<ForoCarrera> findByCarreraForoIsNot(String carrera);
	//Para que traiga mi facultad
	List<ForoCarrera> findByFacultadForo(String facultad);
	//Para que traigas otras facultades
	List<ForoCarrera> findByFacultadForoIsNot(String facultad);
}
