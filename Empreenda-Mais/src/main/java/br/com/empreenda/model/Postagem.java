package br.com.empreenda.model;

import java.util.Date;

public class Postagem {
	private int id;
	private String titulo;
	private String corpo;
	private String media_url;
	private String categoria;
	private int likes;
	private Date data_postagem;
	private PerfilUsuario perfil_id;
	
	private String foto_perfil;
	private String nome_usuario;
	private Usuario usuario_id;
	
	private int denuncia;
	
	public Postagem() {
		
	}

	public Postagem(int id, String titulo, String corpo, String media_url, String categoria, int likes,
			Date data_postagem, PerfilUsuario perfil_id, String foto_perfil, String nome_usuario, Usuario usuario_id, int denuncia) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.corpo = corpo;
		this.media_url = media_url;
		this.categoria = categoria;
		this.likes = likes;
		this.data_postagem = data_postagem;
		this.perfil_id = perfil_id;
		this.foto_perfil = foto_perfil;
		this.nome_usuario = nome_usuario;
		this.usuario_id = usuario_id;
		this.denuncia = denuncia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCorpo() {
		return corpo;
	}

	public void setCorpo(String corpo) {
		this.corpo = corpo;
	}

	public String getMedia_url() {
		return media_url;
	}

	public void setMedia_url(String media_url) {
		this.media_url = media_url;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Date getData_postagem() {
		return data_postagem;
	}

	public void setData_postagem(Date data_postagem) {
		this.data_postagem = data_postagem;
	}

	public PerfilUsuario getPerfil_id() {
		return perfil_id;
	}

	public void setPerfil_id(PerfilUsuario perfil_id) {
		this.perfil_id = perfil_id;
	}

	public String getFoto_perfil() {
		return foto_perfil;
	}

	public void setFoto_perfil(String foto_perfil) {
		this.foto_perfil = foto_perfil;
	}

	public String getNome_usuario() {
		return nome_usuario;
	}

	public void setNome_usuario(String nome_usuario) {
		this.nome_usuario = nome_usuario;
	}

	public Usuario getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(Usuario usuario_id) {
		this.usuario_id = usuario_id;
	}

	public int getDenuncia() {
		return denuncia;
	}

	public void setDenuncia(int denuncia) {
		this.denuncia = denuncia;
	}
	
	
	
}
