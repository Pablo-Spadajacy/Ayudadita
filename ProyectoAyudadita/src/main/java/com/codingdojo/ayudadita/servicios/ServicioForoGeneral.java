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

import com.codingdojo.ayudadita.modelos.ForoGeneral;
import com.codingdojo.ayudadita.modelos.MensajeForoGeneral;
import com.codingdojo.ayudadita.repositorios.RepositorioForoGeneral;
import com.codingdojo.ayudadita.repositorios.RepositorioMensajeGeneral;

@Service
public class ServicioForoGeneral {

	@Autowired
	RepositorioForoGeneral rf;
	
	@Autowired
	RepositorioMensajeGeneral rm;
	
	public ForoGeneral buscarForoPorNombre(String nombre)
	{
		return rf.findByNombre(nombre);
	}
	
	
	public MensajeForoGeneral saveMessage(MensajeForoGeneral mensaje) {
		return rm.save(mensaje);
	}
	
	public ForoGeneral buscarForo(Long foroId)
	{
		return rf.findById(foroId).orElse(null);
	}
	
	public ForoGeneral guardarForo(ForoGeneral foro)
	{
		return rf.save(foro);
	}
	
	public String guardarImg(MultipartFile file, Long mensajeId) {
	    try {
	        byte[] bytes = file.getBytes();
	        String nombreOriginal = file.getOriginalFilename();
	        String nombreUnico = generarNombreUnico(nombreOriginal);
	        Path path = Paths.get("src/main/webapp/img/" + nombreUnico);
	        Files.write(path, bytes);
	        
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
    
    public MensajeForoGeneral buscarMensaje(Long id)
    {
    	return rm.findById(id).orElse(null);
    }
    
    public List<MensajeForoGeneral> buscarMensajesPorForo(Long foroId) {
        return rm.findByForoGeneralId(foroId);
    }
    
    public void init()
    {
    	if (rf.count() == 0)
    	{
    		ForoGeneral foroGeneral = new ForoGeneral();
    		foroGeneral.setNombre("Foro General");
    		rf.save(foroGeneral);
    	}
    }
    
}
