package br.com.empreenda.model;

import java.time.LocalDate;

public class PerfilUsuario {

	private int id;
	
	private Usuario idUsuario;
	
	private String telefone1;
	
	private String telefone2; 

    private String bio;
	
	private String renda;
	
	private String escolaridade;
	
	private String logradouro;
	
	private String cidade;
	
	private String cep;
	
	private String uf;
		
	private String foto_url;
	
	private String ocupacao;
	
	private LocalDate data_nas;
	
	private String interesse1;
	private String interesse2;
	private String interesse3;
	
	private String contato1;
	private String contato2;
	private String contato3;
	private String contato4;
	
	private boolean compartilhar_telefone1;
	private boolean compartilhar_telefone2;
	private boolean compartilhar_endereco;
	
	public PerfilUsuario() {

	}

	public PerfilUsuario(int id, Usuario idUsuario, String telefone1, String telefone2, String bio, String renda,
			String escolaridade, String logradouro, String cidade, String cep, String uf, String foto_url,
			String ocupacao, LocalDate data_nas, String interesse1, String interesse2, String interesse3,
			String contato1, String contato2, String contato3, String contato4, boolean compartilhar_telefone1,
			boolean compartilhar_telefone2, boolean compartilhar_endereco) {
		super();
		this.id = id;
		this.idUsuario = idUsuario;
		this.telefone1 = telefone1;
		this.telefone2 = telefone2;
		this.bio = bio;
		this.renda = renda;
		this.escolaridade = escolaridade;
		this.logradouro = logradouro;
		this.cidade = cidade;
		this.cep = cep;
		this.uf = uf;
		this.foto_url = foto_url;
		this.ocupacao = ocupacao;
		this.data_nas = data_nas;
		this.interesse1 = interesse1;
		this.interesse2 = interesse2;
		this.interesse3 = interesse3;
		this.contato1 = contato1;
		this.contato2 = contato2;
		this.contato3 = contato3;
		this.contato4 = contato4;
		this.compartilhar_telefone1 = compartilhar_telefone1;
		this.compartilhar_telefone2 = compartilhar_telefone2;
		this.compartilhar_endereco = compartilhar_endereco;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Usuario idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getRenda() {
		return renda;
	}

	public void setRenda(String renda) {
		this.renda = renda;
	}

	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getFoto_url() {
		return foto_url;
	}

	public void setFoto_url(String foto_url) {
		this.foto_url = foto_url;
	}

	public String getOcupacao() {
		return ocupacao;
	}

	public void setOcupacao(String ocupacao) {
		this.ocupacao = ocupacao;
	}

	public LocalDate getData_nas() {
		return data_nas;
	}

	public void setData_nas(LocalDate data_nas) {
		this.data_nas = data_nas;
	}

	public String getInteresse1() {
		return interesse1;
	}

	public void setInteresse1(String interesse1) {
		this.interesse1 = interesse1;
	}

	public String getInteresse2() {
		return interesse2;
	}

	public void setInteresse2(String interesse2) {
		this.interesse2 = interesse2;
	}

	public String getInteresse3() {
		return interesse3;
	}

	public void setInteresse3(String interesse3) {
		this.interesse3 = interesse3;
	}

	public String getContato1() {
		return contato1;
	}

	public void setContato1(String contato1) {
		this.contato1 = contato1;
	}

	public String getContato2() {
		return contato2;
	}

	public void setContato2(String contato2) {
		this.contato2 = contato2;
	}

	public String getContato3() {
		return contato3;
	}

	public void setContato3(String contato3) {
		this.contato3 = contato3;
	}

	public String getContato4() {
		return contato4;
	}

	public void setContato4(String contato4) {
		this.contato4 = contato4;
	}

	public boolean isCompartilhar_telefone1() {
		return compartilhar_telefone1;
	}

	public void setCompartilhar_telefone1(boolean compartilhar_telefone1) {
		this.compartilhar_telefone1 = compartilhar_telefone1;
	}

	public boolean isCompartilhar_telefone2() {
		return compartilhar_telefone2;
	}

	public void setCompartilhar_telefone2(boolean compartilhar_telefone2) {
		this.compartilhar_telefone2 = compartilhar_telefone2;
	}

	public boolean isCompartilhar_endereco() {
		return compartilhar_endereco;
	}

	public void setCompartilhar_endereco(boolean compartilhar_endereco) {
		this.compartilhar_endereco = compartilhar_endereco;
	}

	@Override
	public String toString() {
		return "PerfilUsuario [id=" + id + ", idUsuario=" + idUsuario + ", telefone1=" + telefone1 + ", telefone2="
				+ telefone2 + ", bio=" + bio + ", renda=" + renda + ", escolaridade=" + escolaridade + ", logradouro="
				+ logradouro + ", cidade=" + cidade + ", cep=" + cep + ", uf=" + uf + ", foto_url=" + foto_url
				+ ", ocupacao=" + ocupacao + ", data_nas=" + data_nas + ", interesse1=" + interesse1 + ", interesse2="
				+ interesse2 + ", interesse3=" + interesse3 + ", contato1=" + contato1 + ", contato2=" + contato2
				+ ", contato3=" + contato3 + ", contato4=" + contato4 + ", compartilhar_telefone1="
				+ compartilhar_telefone1 + ", compartilhar_telefone2=" + compartilhar_telefone2
				+ ", compartilhar_endereco=" + compartilhar_endereco + "]";
	}
	
	


	
}
