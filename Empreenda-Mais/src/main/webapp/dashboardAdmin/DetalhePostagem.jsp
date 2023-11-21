<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Detalhe da Postagem</title>

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

<style>
iframe, #media {
	margin-left: auto;
	margin-right: auto;
	display: inline;
	inline-size: -webkit-fill-available;
}
</style>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var dataConvertElements = document.querySelectorAll('.dataConvert');

		dataConvertElements.forEach(function(element) {
			var dataSQL = element.textContent;
			var partesData = dataSQL.split('-');
			var dataFormatada = partesData[2] + '/' + partesData[1] + '/'
					+ partesData[0];
			element.textContent = dataFormatada;
		});
	});
</script>

<style>
</style>

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
								class="nav-link dropdown-toggle" id="dropdown"
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
								class="nav-link dropdown-toggle active" id="dropdown"
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
		<div class="container-fluid mb-3 conteudo">

			<main class="col pt-2 pb-4">
				<jstl:forEach items="${postagem}" var="postagem">
					<h1>Dados da Postagem</h1>
					<hr>
					<div class="col-lg-8 mx-auto">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">ID da Postagem</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${postagem.id}</p>
									</div>
								</div>

								<hr>
								<div class="row gx-2">
									<div class="col-sm-3 gx-2">
										<p class="mb-0">Usuário</p>
									</div>
									<div class="col-sm-9 gx-2">
										<a
											href="/Empreenda-Mais/DetalheUsuario?idUsuario=${postagem.usuario_id.id}"
											id="nomeUsuario" target="_blank" data-bs-toggle="tooltip"
											data-bs-placement="top" title="Ver Perfil">${postagem.nome_usuario}</a>
									</div>
									<div class="col-sm-9"></div>
								</div>
								<hr>

								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Título e Corpo da Postagem</p>
									</div>
									<div class="col-sm-9">
										<label for="inputTituloPostagem" class="form-label fs-4">${postagem.titulo}</label>
										<div class="mb-3">
											<p>${postagem.corpo}</p>
										</div>
									</div>
								</div>
								<hr>
								<jstl:if test="${not empty postagem.media_url}">
									<div class="row">
										<div class="col-sm-3">
											<p class="mb-0">Mídia Externa</p>
										</div>
										<div class="col-sm-9">
											<div class="mb-3 d-flex justify-content-start">
												<img src="${postagem.media_url}" class="img-fluid w-50 mx-50">
											</div>
										</div>
									</div>
									<hr>
								</jstl:if>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Data da Postagem</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0 dataConvert">${postagem.data_postagem}</p>
									</div>
								</div>
								<hr>

								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Categoria</p>
									</div>
									<div class="col-sm-9">
										<jstl:choose>
											<jstl:when test="${empty postagem.categoria}">
												<span class="px-2 py-1 bg-warning rounded text-dark">Dado
													não encontrado</span>
											</jstl:when>
											<jstl:otherwise>
												<span class="px-2 py-1 bg-success rounded text-white">${postagem.categoria}</span>
											</jstl:otherwise>
										</jstl:choose>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</jstl:forEach>

				<div class="d-flex justify-content-center my-3">
					<a href="/Empreenda-Mais/ListarPostagensAdmin"
						class="btn btn-lg btn-success"> Voltar </a>
				</div>
			</main>


		</div>
	</div>
	<footer class="row container-fluid footer mt-3">
		<div class="col col-md-8">&reg; Recode Viagens - 2023</div>
		<div class="col col-6 col-md-4 d-flex justify-content-end">Versão
			- 2.0</div>
	</footer>


</body>
</html>