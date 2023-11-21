<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Link CSS Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<!-- Link JavaScript Bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<!-- Link Font-Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="./assets/css/stylePerfil.css">

<script async src="./assets/script/script.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
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
				window.history.replaceState({}, document.title, urlSemParametro);
			});

			// Define um temporizador para esconder o aviso após 5 segundos (5000 milissegundos)
			setTimeout(function() {
				aviso.style.display = 'none';
				var urlSemParametro = window.location.href.split('?')[0];
				window.history.replaceState({}, document.title, urlSemParametro);
			}, 5000);
		}
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    var dataConvertElements = document.querySelectorAll('.dataConvert');
	
	    dataConvertElements.forEach(function(element) {
	        var dataSQL = element.textContent;
	        var partesData = dataSQL.split('-');
	        var dataFormatada = partesData[2] + '/' + partesData[1] + '/' + partesData[0];
	        element.textContent = dataFormatada;
	    });
	});

	

// 	var myModal = document.getElementById('modalSenha')
// 	var myInput = document.getElementById('myInput')

// 	myModal.addEventListener('shown.bs.modal', function() {
// 		myInput.focus()
// 	});
</script>


<title>Editar Perfil</title>
</head>

<body style="margin-top: 0 !important;">

	<div class="toast align-items-center top-25 avisoPerfil"
		id="avisoPerfil" style="display: none;" aria-live="assertive"
		aria-atomic="true" role="alert">
		<div
			class="toast-body p-3 bg-info text-white d-flex justify-content-center align-items-center">
			<i class="fas fa-info-circle fs-1"></i>
			<p class="px-2 text-white">
				Dados atualizados com sucesso! <br> Clique para fechar
			</p>

		</div>
	</div>
	<!-- Menu Principal -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="MainLogado">Empreenda <span
				class="tituloMais">+</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="MainLogado"> <i class="fas fa-home"></i> Página Principal
					</a></li>
					<li class="nav-item"><a class="nav-link" href="cursos.html">
							<i class="fas fa-book-open"></i> Cursos
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fas fa-envelope"></i> Mensagens
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fas fa-bell"></i> Notificações
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link active dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Perfil </a>
						<ul class="dropdown-menu text-center"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#"><i
									class="fas fa-user-circle fs-4 px-1"></i> <span>${sessionScope.nomeCliente}</span></a></li>
							<li><a class="dropdown-item" href="Perfil"><button
										class="btn border" id="btnPerfil">Ver Perfil</button></a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Configurações</a></li>
							<li><a class="dropdown-item" href="#">Ajuda</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="Logout">Sair</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search"
						placeholder="Pesquisar Assunto" aria-label="Search">
					<button class="btn btn-outline-light" type="submit">Pesquisar</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="main-body">
			<div class="row gutters-sm">
				<div class="col mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<form action="EditarInfo1" method="post">

									<c:forEach items="${perfil}" var="perfil">
										<div class="rounded imgPerfilUsuario p-0 border m-auto">
											<img src="${perfil.foto_url}"
												class="img-fluid imgPerfilUsuario2" />
										</div>

										<div class="mt-3">
											<div class="form-group">
												<label for="inputImg" class="fw-semibold">Imagem por
													Link</label>
												<div class="input-group input-group-sm mb-3 mt-1">

													<span class="input-group-text" id="inputImg">Link:</span> <input
														type="text" name="foto_url" class="form-control">
												</div>
												<label for="inputOcup" class="fw-semibold">Profissão</label>
												<input class="form-control form-control-md mb-2"
													id="inputOcup" type="text" value="${perfil.ocupacao}"
													placeholder="Profissão ou Ocupação" name="ocupacao"
													aria-label="profissão"> <label for="inputBio"
													class="fw-semibold">Bio</label>
												<textarea class="form-control mb-2" id="inputBio" rows="3"
													placeholder="Digite sua Bio (Até 150 caracteres)"
													name="bio" maxlength="150"></textarea>
												<div class="text-muted my-2">
													<small> Sua Bio atual: ${perfil.bio}</small>
												</div>

												<input type="submit" class="btn btn-primary px-3"
													value="Salvar Mudanças">
											</div>
										</div>
									</c:forEach>
								</form>
							</div>
						</div>
					</div>
					<form action="EditarInfo4" method="post">
						<c:forEach items="${perfil}" var="perfil">
							<div class="card mt-3 p-2">
								<h5 class="text-center text-muted">Redes de Contato</h5>
								<ul class="list-group list-group-flush">
									<li
										class="list-group-item d-flex justify-content-between flex-wrap">
										<h6 class="mb-0">
											<i class="fas fa-store" style="font-size: 20px;"></i> <span
												class="bulletContato">&#x2022;</span> Loja
										</h6> <label for="basic-url" class="form-label">URL da sua
											loja</label>
										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon3">seusite.com.br</span>
											<input type="text" class="form-control" name="contato1"
												value="${perfil.contato1}" id="basic-url"
												aria-describedby="basic-addon3">
										</div>
									</li>
									<li
										class="list-group-item d-flex justify-content-between flex-wrap">
										<h6 class="mb-0">
											<i class="fab fa-instagram" style="font-size: 20px;"></i> <span
												class="bulletContato">&#x2022;</span> Instagram
										</h6>
										<div class="input-group flex-nowrap my-2">
											<span class="input-group-text" id="addon-wrapping">@</span> <input
												type="text" class="form-control" name="contato2"
												value="${perfil.contato2}" placeholder="Nome de Usuário"
												aria-label="Username" aria-describedby="addon-wrapping">
										</div>
									</li>
									<li
										class="list-group-item d-flex justify-content-between flex-wrap">
										<h6 class="mb-0">
											<i class="fab fa-twitter" style="font-size: 20px;"></i> <span
												class="bulletContato">&#x2022;</span> Twitter
										</h6>
										<div class="input-group flex-nowrap my-2">
											<span class="input-group-text" id="addon-wrapping">@</span> <input
												type="text" class="form-control" name="contato3"
												value="${perfil.contato3}" placeholder="Nome de Usuário"
												aria-label="Username" aria-describedby="addon-wrapping">
										</div>
									</li>
									<li
										class="list-group-item d-flex justify-content-between flex-wrap">
										<h6 class="mb-0">
											<i class="fab fa-facebook" style="font-size: 20px;"></i> <span
												class="bulletContato">&#x2022;</span> Facebook
										</h6>
										<div class="input-group flex-nowrap my-2">
											<span class="input-group-text" id="addon-wrapping">@</span> <input
												type="text" class="form-control" name="contato4"
												value="${perfil.contato4}" placeholder="Nome de Usuário"
												aria-label="Username" aria-describedby="addon-wrapping">
										</div>
									</li>
									<li
										class="list-group-item d-flex justify-content-center flex-wrap">
										<input type="submit" class="btn btn-primary"
										value="Salvar Mudanças">
									</li>
								</ul>
							</div>
						</c:forEach>
					</form>
				</div>
				<div class="col-lg-8">
					<form action="EditarInfo2" method="post">
						<div class="card mb-3">

							<div class="card-body">
								<c:forEach items="${usuario}" var="usuario">
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Nome Completo</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" name="nome" class="form-control"
												value="${usuario.nome}">
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Email</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" class="form-control"
												value="${usuario.email}" disabled>
											<div class="form-check float-end pt-1">
												<span class="text-muted mx-3">Compartilhar esse dado?
												</span>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_email" id="compart1" value="true" required> <label
														class="form-check-label" for="compart1">Sim</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_email" id="compart2" value="false" required> <label
														class="form-check-label" for="compart2">Não</label>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<c:forEach items="${perfil}" var="perfil">
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Telefone</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" class="form-control" name="telefone1"
												id="telefoneUsuario" value="${perfil.telefone1}">
											<div class="form-check float-end pt-1">
												<span class="text-muted mx-3">Compartilhar esse dado?
												</span>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_telefone1" id="compart3" value="true" required> <label
														class="form-check-label" for="compart3">Sim</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_telefone1" id="compart4" value="false" required> <label
														class="form-check-label" for="compart4">Não</label>
												</div>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Celular</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" id="telefoneUsuario2" name="telefone2"
												class="form-control" value="${perfil.telefone2}">
											<div class="form-check float-end pt-1">
												<span class="text-muted mx-3">Compartilhar esse dado?
												</span>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_telefone2" id="compart5" value="true" required> <label
														class="form-check-label" for="compart5">Sim</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_telefone2" id="compart6" value="false" required> <label
														class="form-check-label" for="compart6">Não</label>
												</div>
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Endereço</h6>
										</div>
										<div class="col-sm text-secondary">
											<input type="text" class="form-control"
												value="${perfil.logradouro}" name="logradouro"
												placeholder="Rua Exemplo, 000">
											<div class="row d-flex justify-content-start my-2">
												<div class="col-auto">
													<input type="text" name="cep" class="form-control"
														id="cepUsuario" value="${perfil.cep}">
												</div>
												<div class="col-auto">
													<input type="text" name="cidade" class="form-control"
														placeholder="Cidade" value="${perfil.cidade}">
												</div>
											</div>

											<select id="estado"
												class="form-control form-select w-25 my-1" name="uf">
												<option value="${perfil.uf}">${perfil.uf}</option>
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

											<div class="form-check float-end pt-1">
												<span class="text-muted mx-3">Compartilhar esses
													dados? </span>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_endereco" id="compart7" value="true" required> <label
														class="form-check-label" for="compart7">Sim</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio"
														name="compartilhar_endereco" id="compart8" value="false" required> <label
														class="form-check-label" for="compart8">Não</label>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-9 text-secondary">
										<input type="submit" class="btn btn-primary px-4"
											value="Salvar Mudanças"> <a type="button"
											class="btn btn-info text-white px-3 float-end"
											data-bs-toggle="modal" data-bs-target="#modalSenha">
											Trocar Senha </a>
									</div>
								</div>
							</div>
						</div>

					</form>
					<!-- Modal -->
					<div class="modal fade" id="modalSenha" tabindex="-1"
						aria-labelledby="modalSenhaLabel" aria-hidden="true">
						<form action="TrocarSenha" class="requires-validation" novalidate
							id="formCadastro" method="post">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="modalSenhaLabel">Mudança de
											Senha</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="text-danger text-center mb-1 error"
											id="senhasInco"></div>
										<div class="col mb-4 text-center mx-1">
											<div class="form-outline">
												<input type="password" class="form-control w-100"
													id="senha1Cadastro" required> <label
													for="senha1Cadastro" class="form-label mt-1">Insira
													uma Senha (*)</label>
											</div>
										</div>
										<div class="col mb-4 text-center">
											<div class="form-outline">
												<input type="password" class="form-control w-100"
													name="senha" id="senha2Cadastro" required> <label
													for="senha2Cadastro" class="form-label mt-1">Re-insira
													a senha (*)</label>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Fechar</button>
										<button type="submit" class="btn btn-primary">Salvar</button>
									</div>
								</div>
							</div>
						</form>
					</div>

					<!-- Dados Extras -->
					<div class="card mb-3">
						<div class="p-3">
							<h5>Dados Extras</h5>
							<p class="text-muted">
								<i class="fas fa-info-circle fs-4 mx-1"></i> Esses dados serão
								usados somente por nossos colaboradores para uso nas inscrições
								dos cursos e demais verificações. Nenhum dado será exposto,
								fique tranquilo(a)!
							</p>
						</div>
						<form action="EditarInfo5" method="post">
							<div class="card-body">
								<c:forEach items="${perfil}" var="perfil">
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Data de Nascimento</h6>
										</div>
										<div class="col-sm-9 w-50 text-secondary">
											<input type="date" name="data_nas" class="form-control">
											<span>Dado Cadastrado: <span class="dataConvert">${perfil.data_nas}</span></span>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-sm-3">
											<h6 class="mb-0">Escolaridade</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<select id="escolaridade"
												class="form-control form-select w-50 my-1"
												name="escolaridade">
												<option value="" disabled selected>Selecione</option>
												<option value="Nao Alfabetizado">Não Alfabetizado</option>
												<option value="Ensino Fundamental Completo">Ensino
													Fundamental Completo</option>
												<option value="Ensino Medio Completo">Ensino Médio
													Completo</option>
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
										<div class="col-sm-3">
											<h6 class="mb-0">Renda</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<select id="renda" class="form-control form-select w-50 my-1"
												name="renda">
												<option value="" disabled selected>Selecione</option>
												<option value="Nenhuma Renda">Nenhuma Renda</option>
												<option value="0 a 1 Salario Minimo">Até 1 Salário
													Mínimo</option>
												<option value="1 a 3 Salarios Minimos">De 1 a 3
													Salários Mínimos</option>
												<option value="3 a 5 Salarios Minimos">De 3 a 5
													Salários Mínimos</option>
												<option value="Mais que 5 Salários">Mais que 5
													Salários Mínimos</option>
											</select> <span>Dado Cadastrado: ${perfil.renda }</span>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3"></div>
										<div class="col-sm-9 text-secondary">
											<input type="submit" class="btn btn-primary px-4"
												value="Salvar Mudanças">
										</div>
									</div>
								</c:forEach>
							</div>
						</form>
					</div>


					<div class="row gutters-sm">
						<div class="col-sm-6 mb-3">
							<div class="card h-100 p-3 cardMeio">
								<h5 class="text-center text-muted">Interesses</h5>
								<div class="mb-3" style="height: 5px">
									<c:forEach items="${perfil}" var="perfil">
										<form action="EditarInfo3" method="post">
											<div class="form-group cardMeio">
												<input class="form-control form-control-md mb-2" type="text"
													placeholder="Adicione um interesse" name="interesse1"
													value="${perfil.interesse1}" aria-label="interesse">
												<input class="form-control form-control-md mb-2" type="text"
													placeholder="Adicione um interesse" name="interesse2"
													value="${perfil.interesse2}" aria-label="interesse">
												<input class="form-control form-control-md mb-2" type="text"
													placeholder="Adicione um interesse" name="interesse3"
													value="${perfil.interesse3}" aria-label="interesse">
												<input type="submit" class="btn btn-primary px-3"
													value="Salvar Mudanças">
											</div>
										</form>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-sm-6 mb-3">
							<div class="card h-100">
								<div class="card-body">
									<div
										class="text-muted border rounded position-absolute bg-white mx-1 mt-1"
										id="tagAds">Ads</div>
									<div id="bannerDivulgação">
										<img src="./assets/image/ads-itau.jpg" alt=""
											class="img-fluid">
									</div>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>

		</div>
	</div>

	<script src="./assets/script/plugins/jquery-mask/jquery.mask.min.js"></script>
	<script src="./assets/script/plugins/select2/js/select2.full.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			$('#documentoUsuario').mask('000.000.000-00', {
				reverse : true,
				placeholder : "___.___.___-__"
			});

			$('#telefoneUsuario2').mask('(00) 00000-0000', {
				placeholder : "(__) _____-____"
			});

			$('#telefoneUsuario').mask('(00) 0000-0000', {
				placeholder : "(__) ____-____"
			});

			$('#cepUsuario').mask('00000-000', {
				placeholder : "_____-___"
			});
		});
	</script>


</body>

</html>