package br.com.empreenda.model;

import java.util.Date;

public class Curso {
	private int id;
	private String titulo;
	private String descricao;
	private Date data_criacao;
	private String categoria;
	private String media_url;
	private Usuario id_colaborador;
	private String foto_capa;
	private String nome_colab;
	
	public Curso() {
		
	}

	public Curso(int id, String titulo, String descricao, Date data_criacao, String categoria, String media_url,
			Usuario id_colaborador, String foto_capa, String nome_colab) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.descricao = descricao;
		this.data_criacao = data_criacao;
		this.categoria = categoria;
		this.media_url = media_url;
		this.id_colaborador = id_colaborador;
		this.foto_capa = foto_capa;
		this.nome_colab = nome_colab;
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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getData_criacao() {
		return data_criacao;
	}

	public void setData_criacao(Date data_criacao) {
		this.data_criacao = data_criacao;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getMedia_url() {
		return media_url;
	}

	public void setMedia_url(String media_url) {
		this.media_url = media_url;
	}

	public Usuario getId_colaborador() {
		return id_colaborador;
	}

	public void setId_colaborador(Usuario id_colaborador) {
		this.id_colaborador = id_colaborador;
	}

	public String getFoto_capa() {
		return foto_capa;
	}

	public void setFoto_capa(String foto_capa) {
		this.foto_capa = foto_capa;
	}

	public String getNome_colab() {
		return nome_colab;
	}

	public void setNome_colab(String nome_colab) {
		this.nome_colab = nome_colab;
	}
	
	
	
	
	
	
}
