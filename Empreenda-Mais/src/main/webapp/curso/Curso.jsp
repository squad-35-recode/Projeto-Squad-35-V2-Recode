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

<link rel="stylesheet" href="./assets/css/styleCursos.css">

<style>
@media ( max-width : 770px) {
	.fotoCapa {
		display: inline;
		inline-size: -webkit-fill-available;
	}
}

iframe, #media {
	margin-left: auto;
	margin-right: auto;
	display: inline;
	inline-size: -webkit-fill-available;
	height: 450px;
}
</style>

<%
String origemParam = request.getParameter("origem");
%>

<title>Detalhes do Curso</title>
</head>
<body class="mt-0">
	<!-- Menu Principal -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="topo">
		<div class="container-fluid">
			<c:choose>
				<c:when test="${empty sessionScope.email}">
					<a class="navbar-brand" href="Index">Empreenda <span
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
								href="Index"> <i class="fas fa-home"></i> Página Principal
							</a></li>
							<li class="nav-item"><a class="nav-link active" href="#">
									<i class="fas fa-book-open"></i> Cursos
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="./cadastro.html"> Cadastrar</a></li>
							<li class="nav-item"><a class="nav-link" href="./login.html">
									Entrar</a></li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Pesquisar Assunto" aria-label="Search">
							<button class="btn btn-outline-light" type="submit">Pesquisar</button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
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
								href="MainLogado"> <i class="fas fa-home"></i> Página
									Principal
							</a></li>
							<li class="nav-item"><a class="nav-link active" href="ListarCursos">
									<i class="fas fa-book-open"></i> Cursos
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <i
									class="fas fa-envelope"></i> Mensagens
							</a></li>
							<li class="nav-item"><a class="nav-link" href="ListagemCursosUsuario">
									<i class="fas fa-book-reader"></i> Meus Cursos
							</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Perfil </a>
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
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

	<div class="container-fluid conteudo">
		<main class="container-fluid mb-6">
			<section class="vh-75 mt-5">
				<div class="container h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-lg-12 col-xl-11">
							<div class="card text-black">
								<div class="card-body p-md-5">
									<div class="row justify-content-center">
										<div>
											<c:forEach items="${curso}" var="curso">
												<div class="d-flex justify-content-center">
													<img src="${curso.foto_capa}" class="fotoCapa">
												</div>
												<div
													class="d-flex flex-row flex-wrap align-items-center mb-4 mt-3">
													<div class="form-outline flex-fill mx-1 mb-0">
														<h1 class="text-center">${curso.titulo}</h1>
													</div>
												</div>

												<div class="d-flex flex-row align-items-start mb-4">
													<div class="form-outline flex-fill mb-0">
														<h4 class="text-muted">Educador: ${curso.nome_colab}</h4>
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<h4>Descrição do Curso</h4>
														<p>${curso.descricao}</p>
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														${curso.media_url}</div>
												</div>
												<%
												if (origemParam != null && origemParam.equals("listagem")) {
												%>
												<%
												} else {
												%>
												<c:choose>
													<c:when test="${empty sessionScope.email}">
														<div
															class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
															<a href="./login.html" class="btn btn-primary btn-lg">Fazer
																Login</a>
														</div>

													</c:when>
													<c:otherwise>
														<form action="InscricaoCurso?id=${curso.id}" method="post">
															<div
																class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
																<button type="submit" class="btn btn-success btn-lg">Fazer
																	Inscrição</button>
															</div>
														</form>
													</c:otherwise>
												</c:choose>
												<%
												}
												%>
											</c:forEach>
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
</body>
</html>