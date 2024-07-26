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
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name="mensajes")
public class Mensaje {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String contenido;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "autor_id")
    private Usuario autor;
    
    /*@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "autorMensaje_id")
    private Usuario autorMensaje;*/
    
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "foroCarrera_id")
	private ForoCarrera foroCarrera;
    
    /*@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "chat_id")
	private Chat chat;
    */
    //private String urlFotoChat;
    
    private String urlFotoForo;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

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

    public Usuario getAutor() {
        return autor;
    }

    
    

	/*public Usuario getAutorMensaje() {
		return autorMensaje;
	}

	public void setAutorMensaje(Usuario autorMensaje) {
		this.autorMensaje = autorMensaje;
	}

	public Chat getChat() {
		return chat;
	}

	public void setChat(Chat chat) {
		this.chat = chat;
	}*/

	public String getUrlFotoForo() {
		return urlFotoForo;
	}

	public void setUrlFotoForo(String urlFotoForo) {
		this.urlFotoForo = urlFotoForo;
	}

	public void setAutor(Usuario autor) {
        this.autor = autor;
    }

    public ForoCarrera getForoCarrera() {
        return foroCarrera;
    }

    public void setForoCarrera(ForoCarrera foroCarrera) {
        this.foroCarrera = foroCarrera;
    }

    
    
    /*public String getUrlFotoChat() {
		return urlFotoChat;
	}

	public void setUrlFotoChat(String urlFotoChat) {
		this.urlFotoChat = urlFotoChat;
	}*/

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