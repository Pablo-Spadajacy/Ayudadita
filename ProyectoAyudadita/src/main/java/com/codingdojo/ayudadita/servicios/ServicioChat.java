package com.codingdojo.ayudadita.servicios;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.ayudadita.modelos.Mensaje;
import com.codingdojo.ayudadita.modelos.Usuario;
//import com.codingdojo.ayudadita.repositorios.RepositorioMensaje;

/*@Service
public class ServicioChat {
	
	@Autowired
	RepositorioMensaje rm;
	
	@Autowired
	RepositorioChat rc;
	
	public Chat iniciarChat(Usuario usuario1, Usuario usuario2) {
	    List<Chat> chatExistente = rc.findByUsuario1AndUsuario2(usuario1, usuario2);

	    if (chatExistente.isEmpty()) {
	        chatExistente = rc.findByUsuario2AndUsuario1(usuario2, usuario1);
	    }

	    if (!chatExistente.isEmpty()) {
	        return chatExistente.get(0);
	    }

	    Chat nuevoChat = new Chat();
	    nuevoChat.setUsuario1(usuario1);
	    nuevoChat.setUsuario2(usuario2);
	    nuevoChat.setCreatedAt(new Date()); // Establece la fecha de creación
	    return rc.save(nuevoChat);
	}
	
	public List<Mensaje> todosLosMensajesDelChat(Chat chat)
	{
		return rm.findByChat(chat);
	}
	
	public Mensaje enviarMensaje(Chat chat, Usuario autor ,String contenido)
	{
		Mensaje mensaje = new Mensaje();
		
		mensaje.setChat(chat);
		mensaje.setAutor(autor);
		mensaje.setContenido(contenido);
		
		return rm.save(mensaje);
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
}
*/
