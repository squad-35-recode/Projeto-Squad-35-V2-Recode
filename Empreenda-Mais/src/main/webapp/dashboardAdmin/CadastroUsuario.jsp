<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Cadastro de Cliente</title>

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

<script src="./plugins/jquery.js"></script>
<script src="./plugins/jquery-mask/jquery.mask.min.js"></script>
<script src="./plugins/select2/js/select2.full.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		$('#documentoCliente').mask('000.000.000-00', {
			reverse : true,
			placeholder : "___.___.___-__"
		});

		$('#telefone1').mask('(00) 0000-0000', {
			placeholder : "(__) ____-____"
		});
		
		$('#telefone2').mask('(00) 00000-0000', {
			placeholder : "(__) _____-____"
		});

		$('#cepCliente').mask('00000-000', {
			placeholder : "_____-___"
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
		if (parametros.criado === 'true') {
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
</script>

</head>
<body>
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
									<li><a class="dropdown-item" href="./CadastroUsuario.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-icons"></i><span
									class="ms-1 d-none d-sm-inline">Postagens</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="#">Listar</a></li>
									<li><a class="dropdown-item" href="./CadastroDestino.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-book-open"></i><span
									class="ms-1 d-none d-sm-inline">Cursos</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Agencia-Viagem-V2/ListarReservas">Listar</a></li>
									<li><a class="dropdown-item"
										href="/Agencia-Viagem-V2/CadastroReservaAdm">Cadastrar</a></li>
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
		<div class="container conteudo">

			<main class="col pt-2 pb-4">
				<h1 class="text-center">Cadastro de Usuário</h1>

				<form class="mx-1 mx-md-4"
					action="<%=request.getContextPath()%>/CadastroUsuarioAdmin"
					id="formPerfil" method="post">

					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="nomeCliente">Nome (*)</label> <input
								type="text" id="nomeCliente" class="form-control" name="nome" placeholder="João dos Santos"
								required />
						</div>
					</div>

					<div class="d-flex flex-row justify-content-between mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="emailCliente">E-mail (*)</label> <input
								type="text" id="emailCliente" class="form-control" name="email" placeholder="joao@email.com"
								required />
						</div>
					</div>

					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mx-1 mb-0">
							<label class="form-label" for="senhaCliente">Senha (*)</label> <input
								type="password" class="form-control" name="senha" placeholder="********" required />
						</div>
						<div class="form-outline mx-1 flex-fill mb-0">
							<label class="form-label" for="tipoUsuario">Tipo de
								Usuário (*)</label> <select id="tipoUsuario" class="form-control"
								name="tipo_usuario" required>
								<option value="" selected disabled>Selecione</option>
								<option value="USER">USER</option>
								<option value="ADMIN">ADMIN</option>
								<option value="COLAB">COLAB</option>
							</select>
						</div>
					</div>

					<p>
						Os outros dados são inseridos na tela de <a href="/Empreenda-Mais/ListarUsuariosAdmin" class="link-light badge bg-primary text-wrap py-1 px-2 rounded"><i class="fas fa-users"></i> Listagem de Usuários</a>, na parte de edição. 
					</p>

					<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
						<button type="submit" class="btn btn-primary btn-lg">Cadastrar
							Cliente</button>
					</div>
				</form>
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