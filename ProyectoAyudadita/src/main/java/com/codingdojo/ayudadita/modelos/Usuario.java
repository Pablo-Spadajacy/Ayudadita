package com.codingdojo.ayudadita.modelos;


import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Se requiere un nombre")
	@Size(min = 2, message= "El nombre requiere de al menos 2 caracteres")
	private String nombre;
	
	@NotEmpty(message = "Se requiere un apellido")
	@Size(min = 2, message= "El apellido requiere de al menos 2 caracteres")
	private String apellido;
	
	@NotEmpty(message="Correo requerido")
	@Email(message="Correo invalido")
	private String email;
	
	@NotEmpty(message="Se requiere contraseña")
	//@Size(min= 6, message="La contraseña requiere al menos 6 caracteres")
	private String contrasenna;
	
	@OneToMany(mappedBy = "autor", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Mensaje> mensajes;
	
	@OneToMany(mappedBy = "autorForoGeneral", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<MensajeForoGeneral> mensajesForoGeneral;
	
	/*@OneToMany(mappedBy = "autorMensaje", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Mensaje> mensajesChat;*/
	
	@Transient
	private String confirmar;
	
	//private String confirmarContraseñaEditar;
	
	@NotEmpty(message= "Se requiere una facultad")
	private String facultad;
	
	@NotEmpty(message= "Se requiere una carrera")
	private String carrera;
	
	private String avatar;

	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@OneToMany(mappedBy = "admin", fetch = FetchType.LAZY)
	private List<ForoCarrera> forosCreados;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	/*@OneToMany(mappedBy = "usuario1", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Chat> chatsComoUsuario1;
	@OneToMany(mappedBy="author", fetch=FetchType.LAZY)
	private List<Foro> Foro;
	
	
	public List<Foro> getForo() {
		return Foro;
	}

	@OneToMany(mappedBy = "usuario2", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Chat> chatsComoUsuario2;
	*/
	
	@OneToMany(mappedBy="creator", fetch=FetchType.LAZY)
	private List<Product> myProducts;

	public Usuario() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	
	
	/*public List<Chat> getChatsComoUsuario1() {
		return chatsComoUsuario1;
	}

	public void setChatsComoUsuario1(List<Chat> chatsComoUsuario1) {
		this.chatsComoUsuario1 = chatsComoUsuario1;
	}

	public List<Chat> getChatsComoUsuario2() {
		return chatsComoUsuario2;
	}

	public void setChatsComoUsuario2(List<Chat> chatsComoUsuario2) {
		this.chatsComoUsuario2 = chatsComoUsuario2;
	}
   */

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
	
	/*public List<Mensaje> getMensajesChat() {
		return mensajesChat;
	}

	public void setMensajesChat(List<Mensaje> mensajesChat) {
		this.mensajesChat = mensajesChat;
	}*/

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
	public List<MensajeForoGeneral> getMensajesForoGeneral() {
		return mensajesForoGeneral;
	}

	public void setMensajesForoGeneral(List<MensajeForoGeneral> mensajesForoGeneral) {
		this.mensajesForoGeneral = mensajesForoGeneral;
	}

	/*public String getConfirmarContraseñaEditar() {
		return confirmarContraseñaEditar;
	}

	public void setConfirmarContraseñaEditar(String confirmarContraseñaEditar) {
		this.confirmarContraseñaEditar = confirmarContraseñaEditar;
	}
*/
	public String getContrasenna() {
		return contrasenna;
	}

	public List<ForoCarrera> getForosCreados() {
		return forosCreados;
	}

	public void setForosCreados(List<ForoCarrera> forosCreados) {
		this.forosCreados = forosCreados;
	}

	public void setContrasenna(String contrasenna) {
		this.contrasenna = contrasenna;
	}

	public String getConfirmar() {
		return confirmar;
	}

	public void setConfirmar(String confirmar) {
		this.confirmar = confirmar;
	}	
	
	public String getFacultad() {
		return facultad;
	}

	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}

	public String getCarrera() {
		return carrera;
	}

	public void setCarrera(String carrera) {
		this.carrera = carrera;
	}
	
	
	
	public List<Mensaje> getMensajes() {
		return mensajes;
	}

	public void setMensajes(List<Mensaje> mensajes) {
		this.mensajes = mensajes;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

	public List<Product> getMyProducts() {
		return myProducts;
	}

	public void setMyProducts(List<Product> myProducts) {
		this.myProducts = myProducts;
	}
	
}
