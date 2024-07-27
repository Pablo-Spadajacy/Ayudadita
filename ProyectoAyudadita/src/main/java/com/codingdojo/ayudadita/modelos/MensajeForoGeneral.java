package com.codingdojo.ayudadita.modelos;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "mensajesForoGeneral")
public class MensajeForoGeneral {

	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String contenido;

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "autor_id")
	    private Usuario autorForoGeneral;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "foroGeneral_id")
		private ForoGeneral foroGeneral;
	    
	    private String urlFotoForo;
	    
	    @Column(updatable=false)
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date createdAt;

	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date updatedAt;

	    public MensajeForoGeneral() {
		}
	    
		public Long getId() {
			return id;
		}



		public void setId(Long id) {
			this.id = id;
		}



		public String getContenido() {
			return contenido;
		}



		public void setContenido(String contenido) {
			this.contenido = contenido;
		}



		



		

		public Usuario getAutorForoGeneral() {
			return autorForoGeneral;
		}

		public void setAutorForoGeneral(Usuario autorForoGeneral) {
			this.autorForoGeneral = autorForoGeneral;
		}

		public Usuario getAutor() {
			return autorForoGeneral;
		}

		public void setAutor(Usuario autor) {
			this.autorForoGeneral = autor;
		}

		public ForoGeneral getForoGeneral() {
			return foroGeneral;
		}

		public void setForoGeneral(ForoGeneral foroGeneral) {
			this.foroGeneral = foroGeneral;
		}

		public String getUrlFotoForo() {
			return urlFotoForo;
		}



		public void setUrlFotoForo(String urlFotoForo) {
			this.urlFotoForo = urlFotoForo;
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
	    
}
