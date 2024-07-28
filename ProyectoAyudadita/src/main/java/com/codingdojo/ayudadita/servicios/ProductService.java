package com.codingdojo.ayudadita.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.ayudadita.modelos.Product;
import com.codingdojo.ayudadita.repositorios.RepositorioProductos;

@Service
public class ProductService {

	@Autowired
	private RepositorioProductos pr;

	public Product saveProduct(Product newProduct) {
		return pr.save(newProduct);
	}

	public Product findProduct(Long id) {
		return pr.findById(id).orElse(null);
	}

	public List<Product> getAllProducts() {
		return  (List<Product>) pr.findAll();
	}

    public void deleteProduct(Long id) {
      pr.deleteById(id);
    }

}
