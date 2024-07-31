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
	
	public Usuario chequeo(String email, String password) {
		
		
		Usuario UsuarioEdit = RepoU.findByEmail(email);
		if(password == null || password == "") {
			UsuarioEdit.setContrasenna(null);
			return UsuarioEdit;
		}
		if(password.length() < 6 || password == null || password == "") {
			UsuarioEdit.setContrasenna("lessSize");
			return UsuarioEdit;
		}
		
		if(BCrypt.checkpw(password, UsuarioEdit.getContrasenna())) {
			return UsuarioEdit;
		}	
		return null;
	}
	
	public List<Usuario> usuariosDeMiCarrera(String carrera)
	{
		return RepoU.findByCarrera(carrera);
	}
	
	public List<Usuario> usuariosDeMiFacultad(String facultad)
	{
		return RepoU.findByFacultad(facultad);
	}
}
