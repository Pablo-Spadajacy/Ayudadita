package com.codingdojo.ayudadita.modelos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "forosCarreras")
public class ForoCarrera {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Event name is required")
	private String nombreForo;
	
	@NotEmpty
	private String facultadForo;
	
	@NotEmpty
	private String carreraForo;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@OneToMany(mappedBy = "foroCarrera", fetch = FetchType.LAZY)
	private List<Mensaje> foroMensajes;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_id")
	private Usuario admin;

	public ForoCarrera() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombreForo() {
		return nombreForo;
	}

	public void setNombreForo(String nombreForo) {
		this.nombreForo = nombreForo;
	}

	public String getFacultadForo() {
		return facultadForo;
	}

	public void setFacultadForo(String facultadForo) {
		this.facultadForo = facultadForo;
	}

	
	
	public Usuario getAdmin() {
		return admin;
	}

	public void setAdmin(Usuario admin) {
		this.admin = admin;
	}

	public String getCarreraForo() {
		return carreraForo;
	}

	public void setCarreraForo(String carreraForo) {
		this.carreraForo = carreraForo;
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

	public List<Mensaje> getForoMensajes() {
		return foroMensajes;
	}

	public void setForoMensajes(List<Mensaje> foroMensajes) {
		this.foroMensajes = foroMensajes;
	}
	
	@PrePersist
	protected void onCreate()
	{
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate()
	{
		this.updatedAt = new Date();
	}
	
}
