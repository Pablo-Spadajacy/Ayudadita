package com.codingdojo.ayudadita.servicios;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.ayudadita.modelos.Usuario;

@Service
public class ImgServicio {
	
	@Autowired
	private ServUsuario us;
	
	public String guardarImg(MultipartFile file, Long id) throws Exception {
		
		
		try {
		    byte[] bytes = file.getBytes();
		    
		    String nombreOriginal = file.getOriginalFilename();
		    String nombreUnico = generarNombreUnico(nombreOriginal);
		    Path path = Paths.get("src/main/webapp/img/" + nombreUnico);
		    Files.write(path, bytes);
		    
		    Usuario usuario = us.findUser(id);
		    usuario.setAvatar(nombreUnico);
		    us.save(usuario);
		    
		    return nombreUnico;
		} catch (Exception e) {
		    e.printStackTrace(); // o loguea el error para análisis
		    return "error";
		}
	    
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
