package com.codingdojo.ayudadita.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.ayudadita.modelos.Product;

@Repository
public interface RepositorioProductos extends CrudRepository<Product, Long>{

}
