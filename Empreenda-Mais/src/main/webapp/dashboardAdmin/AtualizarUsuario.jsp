<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Atualizar Cliente</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./dashboardAdmin/css/estiloDash.css">

<script src="./dashboardAdmin/plugins/jquery.js"></script>
<script src="./dashboardAdmin/plugins/jquery-mask/jquery.mask.min.js"></script>
<script src="./dashboardAdmin/plugins/select2/js/select2.full.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		$('#documentoCliente').mask('000.000.000-00', {
			reverse : true,
			placeholder : "___.___.___-__"
		});

		$('#telefone1Usuario').mask('(00) 0000-0000', {
			placeholder : "(__) ____-____"
		});

		$('#telefone2Usuario').mask('(00) 00000-0000', {
			placeholder : "(__) _____-____"
		});

		$('#cepCliente').mask('00000-000', {
			placeholder : "CEP: _____-___"
		});
	});

	document.addEventListener('DOMContentLoaded', function() {
		// Função para obter os parâmetros da URL
		function obterParametrosUrl() {
			var params = {};
			window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(
					str, key, value) {
				params[key] = value;
			});
			return params;
		}

		var parametros = obterParametrosUrl();
		if (parametros.atualizado === 'true') {
			var aviso = document.getElementById('avisoPerfil');
			aviso.style.display = 'block';
			aviso.addEventListener('click', function() {
				aviso.style.display = 'none';
				var urlSemParametro = window.location.href.split('?')[0];
				window.history
						.replaceState({}, document.title, urlSemParametro);
			});

			setTimeout(function() {
				aviso.style.display = 'none';
				var urlSemParametro = window.location.href.split('?')[0];
				window.history
						.replaceState({}, document.title, urlSemParametro);
			}, 5000);
		}
	});

	function togglePasswordVisibility(icon) {
		var passwordInput = icon.nextElementSibling;
		if (passwordInput.type === 'password') {
			passwordInput.type = 'text';
		} else {
			passwordInput.type = 'password';
		}
	}
</script>


</head>
<body>
	<div class="toast align-items-center avisoPerfil" id="avisoPerfil"
		style="display: none;" aria-live="assertive" aria-atomic="true"
		role="alert">
		<div class="toast-body bg-success text-white">Dados atualizados
			com sucesso! Clique para fechar.</div>
	</div>

	<div class="container-fluid overflow-hidden">
		<header class="container">
			<nav class="navbar navbar-expand-lg fixed-top navbar-dark shadow-sm"
				id="menu">
				<div class="container-fluid">
					<a href="/Empreenda-Mais/dashboardAdmin/Dashboard.jsp"
						class="navbar-brand"> <span class="mx-5">Emprega + </span>Dashboard
						de ADM
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse flex-row-reverse"
						id="navbarContent">
						<ul class="navbar-nav d-flex align-items-center">
							<li class="nav-item"><a
								href="/Empreenda-Mais/dashboardAdmin/Dashboard.jsp"
								class="nav-link"> <i class="fas fa-home"></i> Home
							</a></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle active" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fas fa-users"></i><span class="ms-1 d-none d-sm-inline">Usuários</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Empreenda-Mais/ListarUsuariosAdmin">Listar</a></li>
									<li><a class="dropdown-item" href="/Empreenda-Mais/dashboardAdmin/CadastroUsuario.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-icons"></i><span
									class="ms-1 d-none d-sm-inline">Postagens</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="/Empreenda-Mais/ListarPostagensAdmin">Listar</a></li>
									<li><a class="dropdown-item" href="/Empreenda-Mais/dashboardAdmin/CadastroPostagem.jsp">Cadastrar</a></li>
								</ul></li>

							
							<li class="nav-item"><a href="/Empreenda-Mais/Index"
								class="nav-link" target="_blank"> <i
									class="fas fa-external-link-alt"></i> Ver o Sistema Principal
							</a></li>

							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="fas fa-sign-out-alt"></i> Sair
							</a></li>

						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div class="container-fluid conteudo mb-6">
			<main class="container-fluid mb-6">
				<section class="vh-75 mt-5">
					<div class="container w-100 h-100">
						<div
							class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<div class="card text-black" style="border-radius: 25px;">
									<div class="card-body p-md-5">
										<div class="row justify-content-center">
											<div>
												<form class="mx-1 mx-md-4" action="EditarUsuario"
													id="formPerfil" method="post">
													<jstl:forEach items="${usuario}" var="usuario">
														<h1 class="text-center">Atualizar Dados</h1>
														<p class="text-center h1 fw-bold mb-5 mt-4">
															<span style="color: #8AA6A3 !important;">${usuario.nome}
															</span>
														</p>



														<input value="${usuario.id}" name="id" hidden />

														<div
															class="d-flex flex-row row gx-2 flex-wrap align-items-center mb-4">
															<div
																class="form-outline flex-md-wrap flex-fill mb-0 w-50">
																<label class="form-label fs-5" for="nomeUsuario">Nome</label>
																<input type="text" id="nomeUsuario" class="form-control"
																	name="nome" value="${usuario.nome}" required />
															</div>
															<div
																class="form-outline flex-md-wrap flex-fill w-50 mb-0">
																<label class="form-label fs-5" for="emailUsuario">E-mail</label>
																<input type="text" id="emailUsuario"
																	class="form-control" name="email"
																	value="${usuario.email}" readonly />
															</div>
														</div>
														<div
															class="d-flex flex-row row gx-2 flex-wrap align-items-center mb-4">
															<div class="form-outline flex-md-wrap flex-fill mb-0 w-50">
																<label class="form-label fs-5" for="tipoUsuario">Tipo
																	de Usuário</label> 
																	<select id="tipoUsuario"
																	class="form-control"
																	name="tipo_usuario" required>
																	<option value="${usuario.tipo_usuario}" selected
																		disabled>Selecione</option>
																	<option value="USER">USER</option>
																	<option value="ADMIN">ADMIN</option>
																	<option value="COLAB">COLAB</option>
																</select> <span>Tipo atual:
																	${usuario.tipo_usuario}</span>
															</div>
															<div class="form-outline flex-md-wrap flex-fill mb-4 w-50">
																<label class="form-label fs-5" for="senhaUsuario">Senha</label>
																<i class="toggle-password fas fa-eye mx-2"
																	onclick="togglePasswordVisibility(this)"></i> <input
																	type="password" name="senha" class="pass form-control"
																	size="15" value="${usuario.senha}" />
															</div>

														</div>
													</jstl:forEach>
													<jstl:forEach items="${perfil}" var="perfil">
														<div
															class="d-flex flex-row row gx-2 flex-wrap align-items-center mb-4">
															<div
																class="form-outline col-sm-1 flex-md-wrap flex-fill mb-2">
																<label class="form-label fs-5" for="dataNasc">Data
																	de Nascimento</label> <input type="date" id="dataNasc"
																	class="form-control" name="data_nasc"
																	value="${perfil.data_nas}" required />
															</div>
															<div class="form-outline col-auto flex-fill mb-2">
																<label class="form-label fs-5" for="ocupacaoUsuario">Ocupação
																	e/ou Profissão</label> <input type="text" id="ocupacaoUsuario"
																	class="form-control " name="ocupacao"
																	value="${perfil.ocupacao}" />
															</div>
														</div>
														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label fs-5" for="logradouroUsuario">Endereço:
																</label> <input type="text" id="logradouroUsuario"
																	class="form-control" name="logradouro"
																	placeholder="Logradouro" value="${perfil.logradouro}" />

																<div class="d-flex flex-row align-items-center my-2">
																	<input type="text" id="cepCliente"
																		class="form-control w-25" name="cep"
																		value="${perfil.cep}" placeholder="CEP" /> <input
																		type="text" id="cidadeUsuario"
																		class="form-control w-50 mx-2" name="cidade"
																		value="${perfil.cidade}" placeholder="Cidade" /> <select
																		id="estado" class="form-control form-select w-25"
																		name="uf">
																		<option value="${perfil.uf}" disabled selected>UF</option>
																		<option value="AC">Acre</option>
																		<option value="AL">Alagoas</option>
																		<option value="AP">Amapá</option>
																		<option value="AM">Amazonas</option>
																		<option value="BA">Bahia</option>
																		<option value="CE">Ceará</option>
																		<option value="DF">Distrito Federal</option>
																		<option value="ES">Espírito Santo</option>
																		<option value="GO">Goiás</option>
																		<option value="MA">Maranhão</option>
																		<option value="MT">Mato Grosso</option>
																		<option value="MS">Mato Grosso do Sul</option>
																		<option value="MG">Minas Gerais</option>
																		<option value="PA">Pará</option>
																		<option value="PB">Paraíba</option>
																		<option value="PR">Paraná</option>
																		<option value="PE">Pernambuco</option>
																		<option value="PI">Piauí</option>
																		<option value="RJ">Rio de Janeiro</option>
																		<option value="RN">Rio Grande do Norte</option>
																		<option value="RS">Rio Grande do Sul</option>
																		<option value="RO">Rondônia</option>
																		<option value="RR">Roraima</option>
																		<option value="SC">Santa Catarina</option>
																		<option value="SP">São Paulo</option>
																		<option value="SE">Sergipe</option>
																		<option value="TO">Tocantins</option>
																		<option value="EX">Estrangeiro</option>
																	</select>
																</div>
															</div>
														</div>

														<div
															class="d-flex flex-row flex-wrap align-items-center mb-4">
															<div class="form-outline flex-fill mb-0 me-2">
																<label class="form-label fs-5" for="telefone1Usuario">Telefone
																	1</label> <input type="text" id="telefone1Usuario"
																	class="form-control" name="telefone1"
																	value="${perfil.telefone1}"
																	placeholder="(**) ****-****" />
															</div>
															<div class="form-outline flex-fill mb-0">
																<label class="form-label fs-5" for="telefone2Usuario">Telefone
																	2</label> <input type="text" id="telefone2Usuario"
																	class="form-control" name="telefone2"
																	value="${perfil.telefone2}"
																	placeholder="(**) *****-****" />
															</div>
														</div>

														<div
															class="d-flex flex-row flex-wrap border p-2 rounded align-items-center mb-2">
															<div class=" col form-outline flex-fill mb-2 me-2">
																<label class="form-label fs-5" for="interesses">Interesses</label>
																<input type="text" id="interesses"
																	class="form-control mb-1" name="interesse1"
																	value="${perfil.interesse1}" placeholder="Interesse 1" />
																<input type="text" class="form-control mb-1"
																	name="interesse2" placeholder="Interesse 2"
																	value="${perfil.interesse2}" /> <input type="text"
																	class="form-control" name="interesse3"
																	placeholder="Interesse 3" value="${perfil.interesse3}" />
															</div>

															<div class=" col form-outline flex-fill mb-0 me-2">
																<label class="form-label fs-5" for="contatos">Contatos</label>
																<div class="input-group  input-group mb-1">
																	<span class="input-group-text" id="contatos"><i
																		class="fas fa-store fs-5"></i></span> <input type="text"
																		class="form-control" name="contato1"
																		value="${perfil.contato1}"
																		placeholder="http://meusite.com">
																</div>
																<div class="input-group  input-group mb-1">
																	<span class="input-group-text"><i
																		class="fab fa-instagram fs-5 px-1"></i></span> <input
																		type="text" class="form-control" name="contato2"
																		value="${perfil.contato2}" placeholder="@usuario">
																</div>
																<div class="input-group  input-group mb-1">
																	<span class="input-group-text"><i
																		class="fab fa-twitter fs-5 px-1"></i></span> <input
																		type="text" class="form-control" name="contato3"
																		value="${perfil.contato3}" placeholder="@usuario">
																</div>
																<div class="input-group  input-group mb-1">
																	<span class="input-group-text"><i
																		class="fab fa-facebook fs-5 px-1"></i></span> <input
																		type="text" class="form-control" name="contato4"
																		value="${perfil.contato4}" placeholder="@usuario">
																</div>
															</div>
														</div>

														<div
															class="d-flex flex-row flex-wrap border p-3 rounded align-items-top mb-2">
															<div class=" col form-outline flex-fill mb-2 me-2">
																<label class="form-label fs-5" for="interesses">Bio</label>
																<div>
																	<span class="text-muted">Bio Atual</span>
																	<p>${perfil.bio}</p>
																</div>
															</div>

															<div class=" col form-outline flex-fill mb-0 me-2">
																<label class="form-label" for="txt">Insira uma
																	nova bio</label>
																<div class="input-group input-group mb-1" id="txt">
																	<textarea name="bio" class="form-control" rows="4"
																		cols="50" value="${perfil.bio}"></textarea>
																</div>
															</div>
														</div>

														<div
															class="d-flex flex-row flex-wrap border p-3 rounded align-items-top justify-content-center mb-2">
															<div class="row mb-3">
																<div class="col">
																	<h5 class="mb-0">Escolaridade</h5>
																</div>
																<div class="col-sm-9 text-secondary">
																	<select id="escolaridade"
																		class="form-control form-select my-1"
																		name="escolaridade" required>
																		<option value="${perfil.escolaridade}" disabled
																			selected>Selecione</option>
																		<option value="Não Informado">Não Informado</option>
																		<option value="Nao Alfabetizado">Não
																			Alfabetizado</option>
																		<option value="Ensino Fundamental Completo">Ensino
																			Fundamental Completo</option>
																		<option value="Ensino Medio Completo">Ensino
																			Médio Completo</option>
																		<option value="Ensino Superior Completo">Ensino
																			Superior Completo</option>
																		<option value="Ensino Fundamental Incompleto">Ensino
																			Fundamental Incompleto</option>
																		<option value="Ensino Medio Incompleto">Ensino
																			Médio Incompleto</option>
																		<option value="Ensino Superior Incompleto">Ensino
																			Superior Incompleto</option>
																	</select> <span>Dado Cadastrado: ${perfil.escolaridade}</span>
																</div>
															</div>
															<div class="row mb-3">
																<div class="col">
																	<h5 class="mb-0">Renda</h5>
																</div>
																<div class="col-sm-9 text-secondary">
																	<select id="renda"
																		class="form-control form-select my-1" name="renda" required>
																		<option value="${perfil.renda}" disabled selected>Selecione</option>
																		<option value="Não Informado">Não Informado</option>
																		<option value="Nenhuma Renda">Nenhuma Renda</option>
																		<option value="0 a 1 Salario Minimo">Até 1
																			Salário Mínimo</option>
																		<option value="1 a 3 Salarios Minimos">De 1 a
																			3 Salários Mínimos</option>
																		<option value="3 a 5 Salarios Minimos">De 3 a
																			5 Salários Mínimos</option>
																		<option value="Mais que 5 Salários">Mais que
																			5 Salários Mínimos</option>
																	</select> <span>Dado Cadastrado: ${perfil.renda}</span>
																</div>
															</div>
														</div>

														<div
															class="d-flex justify-content-center flex-column align-items-center fs-6 mb-2">
															<div class="row mb-2">
																<img src="${perfil.foto_url}" width="150px"
																	height="150px">
															</div>
															<div class="row">
																<div class="input-group input-group mb-3">
																	<span class="input-group-text"><i
																		class="far fa-image"></i></span> <input type="text"
																		class="form-control" size="100" name="foto_url"
																		value="${perfil.foto_url}" placeholder="http://imagem">
																</div>
															</div>
														</div>

														<div
															class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
															<button type="submit" class="btn btn-primary btn-lg">Atualizar
																Dados</button>
														</div>
													</jstl:forEach>
												</form>


											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</section>
			</main>

		</div>
	</div>
	<footer class="row container-fluid footer">
		<div class="col col-md-8">&reg; Empreenda + | 2023</div>
		<div class="col col-6 col-md-4 d-flex justify-content-end">Versão
			- 2.0</div>
	</footer>


</body>
</html>