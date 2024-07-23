package com.codingdojo.ayudadita.servicios;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.ayudadita.modelos.Usuario;
import com.codingdojo.ayudadita.repositorios.RepositorioUsuario;

@Service
public class ServUsuario {
	
	@Autowired
	private RepositorioUsuario RepoU;
	
	public Usuario register(Usuario newUser, BindingResult result) {
		
		String password = newUser.getContrasenna();
		String confirm = newUser.getConfirmar();
		if(!password.equals(confirm)) {
			result.rejectValue("confirmar", "Matches", "La contraseña no esta confirmada");
		}
		String email = newUser.getEmail();
		Usuario userExist = RepoU.findByEmail(email);
		if(userExist != null) {
			result.rejectValue("email", "Unique", "Ya existe este correo");
		}
		
		if(result.hasErrors()) {
			return null;
		} else {
			String pass_hash = BCrypt.hashpw(password, BCrypt.gensalt());
			newUser.setContrasenna(pass_hash);
			return RepoU.save(newUser);
		}
		
	}
	
	public Usuario login(String email, String password) {
		//Revisamos que el correo exista en BD
		Usuario userTryingLogin = RepoU.findByEmail(email); //Objeto User o NULL
		
		if(userTryingLogin == null) {
			return null;
		}
		
		//Comparar las contraseñas
		//BCrypt.checkpw(Contra NO encriptada, Contra SI encriptada) -> True o False
		if(BCrypt.checkpw(password, userTryingLogin.getContrasenna())) {
			return userTryingLogin;
		} else {
			return null;
		}		
	}
	
	public Usuario findUser(Long id) {
		return RepoU.findById(id).orElse(null);
	}
	public List<Usuario> findAllUsers(){
		return (List<Usuario>) RepoU.findAll();
		
	}
	
	public void save(Usuario user) {
		RepoU.save(user);
	}
	
	public Usuario chequeo(String email, String password, BindingResult result) {
	    if (password == null || password.isEmpty()) {
	        result.rejectValue("contrasenna", "Size.usuario.contrasenna", "La contraseña no puede estar vacía");
	        return null;
	    }
	    
	    Usuario usuarioEdit = RepoU.findByEmail(email);
	    
	    if (usuarioEdit == null) {
	        // Manejo de usuario no encontrado
	        return null;
	    }
	    
	    if (password.length() < 6) {
	    	System.out.println("Si la contraseña es demasiado corta lo dirá en la consola");
	        result.rejectValue("contrasenna", "Size.usuario.contrasenna", "La contraseña requiere al menos 6 caracteres");
	        return null;
	    }
	    
	    if (!BCrypt.checkpw(password, usuarioEdit.getContrasenna())) {
	        // La contraseña no coincide con la almacenada
	        return null;
	    }
	    
	    return usuarioEdit;
	}
}
