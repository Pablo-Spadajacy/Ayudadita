package com.codingdojo.ayudadita.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.MensajeForoGeneral;

@Repository
public interface RepositorioMensajeGeneral extends CrudRepository<MensajeForoGeneral, Long> {

	List<MensajeForoGeneral> findByForoGeneralId(Long foroId);
	
}
