package com.codingdojo.ayudadita.servicios;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	
public String saveImg(MultipartFile file, Long id) {
		
		
	    try {
	        byte[] bytes = file.getBytes();
	        
	        String nombreOriginal = file.getOriginalFilename();
	        String nombreUnico = generarNombreUnico(nombreOriginal);
	        Path path = Paths.get("src/main/webapp/img/" + nombreUnico);
	        Files.write(path, bytes);
	        
	        Product product = findProduct(id);
	        product.setImg(nombreUnico);
	        pr.save(product);
	        
	        return nombreUnico;
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return "error";
	}
	
	private String generarNombreUnico(String nombreOriginal) {
        // Obtener la extensión del archivo
        String extension = obtenerExtension(nombreOriginal);

        // Generar un nombre único basado en el tiempo actual (en milisegundos) y la extensión del archivo
        String nombreUnico = Instant.now().toEpochMilli() + extension;

        return nombreUnico;
    }

    private String obtenerExtension(String nombreArchivo) {
        int lastIndex = nombreArchivo.lastIndexOf(".");
        if (lastIndex == -1) {
            return ""; // Archivos sin extensión
        }
        return nombreArchivo.substring(lastIndex); // Obtener la extensión (incluyendo el punto)
    }
    
}
