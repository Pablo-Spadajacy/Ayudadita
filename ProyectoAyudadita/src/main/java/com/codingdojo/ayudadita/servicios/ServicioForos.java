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

import com.codingdojo.ayudadita.modelos.ForoCarrera;
import com.codingdojo.ayudadita.modelos.Mensaje;
import com.codingdojo.ayudadita.repositorios.RepositorioForo;
import com.codingdojo.ayudadita.repositorios.RepositorioMensaje;

@Service
public class ServicioForos {

	@Autowired
	RepositorioForo rf;
	
	@Autowired
	RepositorioMensaje rm;
	
	public List<ForoCarrera> forosDeMiCarrera(String carrera) {
		
		return rf.findByCarreraForo(carrera);
	}
	
	public List<ForoCarrera> ForoDeOtrasCarreras(String carerra){
		return rf.findByCarreraForoIsNot(carerra);
	}
	
	public List<ForoCarrera> ForosDeMiFacultad(String facultad)
	{
		return rf.findByFacultadForo(facultad);
	}
	
	public List<ForoCarrera> ForosOtrasFacultades(String facultad)
	{
		return rf.findByFacultadForoIsNot(facultad);
	}
	
	public Mensaje saveMessage(Mensaje mensaje) {
		return rm.save(mensaje);
	}
	
	public ForoCarrera buscarForo(Long foroId)
	{
		return rf.findById(foroId).orElse(null);
	}
	
	public ForoCarrera guardarForo(ForoCarrera foro)
	{
		return rf.save(foro);
	}
	
	public String guardarImg(MultipartFile file, Long id) {
		
		
	    try {
	        byte[] bytes = file.getBytes();
	        
	        String nombreOriginal = file.getOriginalFilename();
	        String nombreUnico = generarNombreUnico(nombreOriginal);
	        Path path = Paths.get("src/main/webapp/img/" + nombreUnico);
	        Files.write(path, bytes);
	        
	        Mensaje mensajeForo = rm.findById(id).orElse(null);
	        mensajeForo.setUrlFotoForo(nombreUnico);
	        rm.save(mensajeForo);
	        
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
    
    public Mensaje buscarMensaje(Long id)
    {
    	return rm.findById(id).orElse(null);
    }
    
    
    
}
