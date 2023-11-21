package br.com.empreenda.model;

import java.util.Date;

public class InscricaoCurso {
	private int id;
	private Date data_inscricao;
	private Usuario id_usuario;
	private Curso id_curso;
	
	private String nomeUsuario;
	private String emailUsuario;
	
	private String titulo;
	private String descricao;
	private Date data_criacao;
	private String categoria;
	private String media_url;
	private Usuario id_colaborador;
	private String foto_capa;
	private String nome_colab;
	
	public InscricaoCurso() {
		
	}

	public InscricaoCurso(int id, Date data_inscricao, Usuario id_usuario, Curso id_curso, String nomeUsuario,
			String emailUsuario, String titulo, String descricao, Date data_criacao, String categoria, String media_url,
			Usuario id_colaborador, String foto_capa, String nome_colab) {
		super();
		this.id = id;
		this.data_inscricao = data_inscricao;
		this.id_usuario = id_usuario;
		this.id_curso = id_curso;
		this.nomeUsuario = nomeUsuario;
		this.emailUsuario = emailUsuario;
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

	public Date getData_inscricao() {
		return data_inscricao;
	}

	public void setData_inscricao(Date data_inscricao) {
		this.data_inscricao = data_inscricao;
	}

	public Usuario getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(Usuario id_usuario) {
		this.id_usuario = id_usuario;
	}

	public Curso getId_curso() {
		return id_curso;
	}

	public void setId_curso(Curso id_curso) {
		this.id_curso = id_curso;
	}

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String getEmailUsuario() {
		return emailUsuario;
	}

	public void setEmailUsuario(String emailUsuario) {
		this.emailUsuario = emailUsuario;
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
