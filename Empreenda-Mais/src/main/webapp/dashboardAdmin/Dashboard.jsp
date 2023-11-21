<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard ADM</title>

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

<link rel="stylesheet" href="./css/estiloDash.css">

<script>
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

			// Define um temporizador para esconder o aviso após 5 segundos (5000 milissegundos)
			setTimeout(function() {
				aviso.style.display = 'none';
				var urlSemParametro = window.location.href.split('?')[0];
				window.history
						.replaceState({}, document.title, urlSemParametro);
			}, 5000);
		}
	});
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
					<a href="#" class="navbar-brand"> <span class="mx-5">Emprega + </span>Dashboard de ADM </a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse flex-row-reverse"
						id="navbarContent">
						<ul class="navbar-nav d-flex align-items-center">
							<li class="nav-item"><a href="#" class="nav-link active">
									<i class="fas fa-home"></i> Home
							</a></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fas fa-users"></i><span class="ms-1 d-none d-sm-inline">Usuários</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Empreenda-Mais/ListarUsuariosAdmin">Listar</a></li>
									<li><a class="dropdown-item" href="./CadastroUsuario.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i class="fs-5 fas fa-icons"></i><span
									class="ms-1 d-none d-sm-inline">Postagens</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="/Empreenda-Mais/ListarPostagensAdmin">Listar</a></li>
									<li><a class="dropdown-item" href="./CadastroPostagem.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="nav-item"><a href="/Empreenda-Mais/Index"
								class="nav-link" target="_blank"> <i class="fas fa-external-link-alt"></i>
									Ver o Sistema Principal
							</a></li>

							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="fas fa-sign-out-alt"></i> Sair
							</a></li>

						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div class="container-fluid conteudo mb-3">
			<main class="row overflow-auto mb-3">
				<div class="col pt-4 pb-4">
					<h1>Dashboard de Administrador</h1>
					<p class="lead">Acesse os campos por aqui ou pelo menu</p>
					<hr />
					
					<div class="row d-flex flex-wrap justify-content-center my-3">
					  <div class="col-sm-5 mb-3">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title">Usuários</h5>
					        <p class="card-text">Acesse dados referentes aos usuários. Atualize, delete ou cadastre novos</p>
					        <div class="d-flex justify-content-center">
					         	<a href="/Empreenda-Mais/ListarUsuariosAdmin" class="btn btn-primary mx-2">Lista de Usuários</a>
					        	<a href="./CadastroUsuario.jsp" class="btn btn-primary mx-2">Cadastro de Usuário</a>
					        </div>
					       
					      </div>
					    </div>
					  </div>
					  <div class="col-sm-5">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title">Postagens</h5>
					        <p class="card-text">Acesse dados referentes às postagens </p>
					        <div class="d-flex justify-content-center">
					         	<a href="/Empreenda-Mais/ListarPostagensAdmin" class="btn btn-primary mx-2">Lista de Postagens</a>
					        	<a href="./CadastroPostagem.jsp" class="btn btn-primary mx-2">Fazer Postagem</a>
					        </div>
					       
					      </div>
					    </div>
					  </div>
					</div>
					
					<div class="row d-flex flex-wrap justify-content-center">
					  <div class="col-sm-5">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title">Cursos</h5>
					        <p class="card-text">Acesse dados referentes aos cursos.</p>
					        <div class="d-flex justify-content-center">
					         	<a href="#" class="btn btn-primary mx-2">Lista de Cursos</a>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
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