package com.codingdojo.ayudadita.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.Usuario;

@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario, Long>{

}
