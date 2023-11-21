package br.com.empreenda.model;

import java.util.Objects;

public class Usuario {
	
	private int id;
	
	private String nome;
	
	private String email;
	
	private String senha;
	
	private String tipo_usuario;
	
	private boolean compartilhar_email;
	
	public Usuario() {
		
	}

	public Usuario(int id, String nome, String email, String senha, String tipo_usuario, boolean compartilhar_email) {
		super();
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.tipo_usuario = tipo_usuario;
		this.compartilhar_email = compartilhar_email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTipo_usuario() {
		return tipo_usuario;
	}

	public void setTipo_usuario(String tipo_usuario) {
		this.tipo_usuario = tipo_usuario;
	}

	public boolean isCompartilhar_email() {
		return compartilhar_email;
	}

	public void setCompartilhar_email(boolean compartilhar_email) {
		this.compartilhar_email = compartilhar_email;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nome=" + nome + ", email=" + email + ", senha=" + senha + ", tipo_usuario="
				+ tipo_usuario + ", compartilhar_email=" + compartilhar_email + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(compartilhar_email, email, id, nome, senha, tipo_usuario);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		return compartilhar_email == other.compartilhar_email && Objects.equals(email, other.email) && id == other.id
				&& Objects.equals(nome, other.nome) && Objects.equals(senha, other.senha)
				&& Objects.equals(tipo_usuario, other.tipo_usuario);
	}

	
	
}
