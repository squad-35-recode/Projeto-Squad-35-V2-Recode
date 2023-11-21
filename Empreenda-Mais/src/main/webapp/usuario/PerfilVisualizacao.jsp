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

<c:forEach items="${usuario}" var="usuario">
	<title>Perfil de ${usuario.nome}</title>
</c:forEach>


<script async src="./assets/script/perfilScript.js"></script>

<script>
	window.onscroll = function() {
		let botaoTopo = document.getElementById("botao-topo");
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			botaoTopo.style.display = "block";
		} else {
			botaoTopo.style.display = "none";
		}
	};

	function scrollToTop() {
		window.scrollTo({
			top : 0,
			behavior : 'smooth'
		});
	};
</script>

</head>

<body style="margin-top: 0 !important;">
	<!-- Menu Principal -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="topo">
		<div class="container-fluid">
				<c:choose>
					<c:when test="${empty sessionScope.email}">
						<a class="navbar-brand" href="Index">Empreenda <span
							class="tituloMais">+</span></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link"
									aria-current="page" href="Index"> <i class="fas fa-home"></i>
										Página Principal
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#"> <i
										class="fas fa-book-open"></i> Cursos
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="./cadastro.html"> Cadastrar</a></li>
								<li class="nav-item"><a class="nav-link"
									href="./login.html"> Entrar</a></li>
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
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link"
									aria-current="page" href="MainLogado"> <i
										class="fas fa-home"></i> Página Principal
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
					</c:otherwise>
				</c:choose>
			</div>
	</nav>
	<div class="container">
		<a href="#topo" id="botao-topo" title="Voltar ao Topo"> <i
			class="fas fa-chevron-up text-primary fs-2 rounded-circle bg-light px-3 py-3 shadow-sm float-end position-fixed bottom-0 end-0 m-3"></i>
		</a>
		<div class="main-body">
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<c:forEach items="${perfil}" var="perfil">
									<div class="rounded imgPerfilUsuario p-0 shadow-sm">
										<img src="${perfil.foto_url}"
											class="img-fluid imgPerfilUsuario2" />
									</div>
								</c:forEach>
								<div class="mt-3">
									<c:forEach items="${usuario}" var="usuario">
										<h4>${usuario.nome}</h4>
									</c:forEach>
									<c:forEach items="${perfil}" var="perfil">
										<p class="text-secondary mb-1">
											<span id="ocup">${perfil.ocupacao}</span>
										</p>
										<p class="text-muted font-size-sm">
											<span>${perfil.cidade}</span>/ <span>${perfil.uf}</span>
										</p>
										<button class="btn btn-primary">Seguir</button>
										<button class="btn btn-outline-primary">Enviar
											Mensagem</button>
										<div class="mt-3">
											<h3 class="text-muted">Bio</h3>
											<p id="bio">
												<span class="fs-1 ">"</span> ${perfil.bio} <span
													class="fs-1">"</span>
											</p>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<!-- Card Lateral - Redes de Contato -->
					<c:forEach items="${perfil}" var="perfil">
						<div class="card mt-3 p-2">
							<h5 class="text-center text-muted">Redes de Contato</h5>
							<ul class="list-group list-group-flush text-center">
								<li
									class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0">
										<i class="fas fa-store" style="font-size: 20px;"></i> <span
											class="bulletContato">&#x2022;</span> Loja
									</h6> <a href="${perfil.contato1}"> ${perfil.contato1}</a>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0">
										<i class="fab fa-instagram" style="font-size: 20px;"></i> <span
											class="bulletContato">&#x2022;</span> Instagram
									</h6> <a href="${perfil.contato2}">${perfil.contato2}</a>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0">
										<i class="fab fa-twitter" style="font-size: 20px;"></i> <span
											class="bulletContato">&#x2022;</span> Twitter
									</h6> <a href="${perfil.contato3}">${perfil.contato3}</a>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0">
										<i class="fab fa-facebook" style="font-size: 20px;"></i> <span
											class="bulletContato">&#x2022;</span> Facebook
									</h6> <a href="${perfil.contato4}">${perfil.contato4}</a>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>

				<!-- Dados Usuário -->
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<c:forEach items="${usuario}" var="usuario">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Nome Completo</h6>
									</div>


									<div class="col-sm-9 text-secondary">${usuario.nome}</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Email</h6>
									</div>
									<c:choose>
										<c:when test="${usuario.compartilhar_email eq true}">
											<div class="col-sm-9 text-secondary">${usuario.email}</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-9 text-secondary">O usuário optou
												por não compartilhar esse dado</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
							<hr>
							<c:forEach items="${perfil}" var="perfil">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Telefone</h6>
									</div>
									<c:choose>
										<c:when test="${perfil.compartilhar_telefone1 eq true}">
											<div class="col-sm-9 text-secondary" id="telefone1">${perfil.telefone1}</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-9 text-secondary">O usuário optou
												por não compartilhar esse dado</div>
										</c:otherwise>
									</c:choose>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Celular</h6>
									</div>
									<c:choose>
										<c:when test="${perfil.compartilhar_telefone2 eq true}">
											<div class="col-sm-9 text-secondary" id="telefone2">${perfil.telefone2}</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-9 text-secondary">O usuário optou
												por não compartilhar esse dado</div>
										</c:otherwise>
									</c:choose>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Endereço</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<c:choose>
											<c:when test="${perfil.compartilhar_endereco eq true}">
												<div class="col-sm-9 text-secondary" id="telefone1">${perfil.logradouro}</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
										<span id="cidade">${perfil.cidade}</span>/ <span id="uf">${perfil.uf}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="row gutters-sm">
						<div class="col-sm-6 mb-3">
							<div class="card h-100 p-3">
								<h5 class="text-center text-muted">Interesses</h5>
								<div class="mb-3">
									<c:forEach items="${perfil}" var="perfil">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">${perfil.interesse1}</li>
											<li class="list-group-item">${perfil.interesse2}</li>
											<li class="list-group-item">${perfil.interesse3}</li>
										</ul>
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
									</section>
								</div>
							</div>
						</div>
					</div>
					<!-- begin timeline -->
					<c:forEach items="${postagens}" var="postagem">
						<ul class="timeline">
							<li>
								<!-- begin timeline-time -->
								<div class="timeline-time">
									<span class="date">Postado em</span> <span
										class="date dataConvert">${postagem.data_postagem}</span>
								</div> <!-- end timeline-time --> <!-- begin timeline-icon -->
								<div class="timeline-icon">
									<a href="javascript:;">&nbsp;</a>
								</div> <!-- end timeline-icon --> <!-- begin timeline-body -->
								<div class="timeline-body">
									<div class="timeline-header">
										<span class="userimage"><img
											src="${postagem.foto_perfil}" alt=""></span> <span
											class="username"><a href="javascript:;">${postagem.nome_usuario}</a>
											<small></small></span> <span class="pull-right text-muted">320
											Visualizações</span>
										<div class="timeline-time-post">
											<span class="date">hoje</span> <span class="time">04:20</span>
										</div>
									</div>
									<div class="timeline-content">
										<p>${postagem.corpo}</p>
										<div class="mb-3 d-flex justify-content-center">
											<c:if test="${not empty postagem.media_url}">
												<img src="${postagem.media_url}"
													class="img-fluid w-50 h-25 mx-50">
											</c:if>
										</div>
									</div>
									<div class="timeline-likes">
										<div class="stats-right">
											<span class="stats-text">0 Compartilhamentos</span> <span
												class="stats-text">0 Comentários</span>
										</div>
										<div class="stats">
											<span class="fa-stack fa-fw stats-icon"> <i
												class="fa fa-circle fa-stack-2x text-primary"></i> <i
												class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
											</span> <span class="stats-total">0</span>
										</div>
									</div>
									<div class="timeline-footer">
										<a href="javascript:;" class="m-r-15 text-inverse-lighter"><i
											class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comentar</a> <a
											href="javascript:;" class="m-r-15 text-inverse-lighter"><i
											class="fa fa-share fa-fw fa-lg m-r-3"></i> Compartilhar</a>
									</div>
								</div> <!-- end timeline-body -->
							</li>
						</ul>
					</c:forEach>
					<!-- end timeline -->
				</div>
				<!-- end #profile-post tab -->
			</div>
			<!-- end tab-content -->
		</div>
		<!-- end profile-content -->


	</div>
	</div>

	</div>
	</div>


</body>

</html>