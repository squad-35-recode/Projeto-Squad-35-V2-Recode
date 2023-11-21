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

<!-- Link Tiny MCE -->
<script
	src="https://cdn.tiny.cloud/1/8svz9148gua03293my7b0e5drfls3zdv5h5b52vt4dbntdgt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>

<link rel="stylesheet" href="assets/css/style.css">

<style>
iframe, #media {
	margin-left: auto;
	margin-right: auto;
	display: inline;
	inline-size: -webkit-fill-available;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="assets/script/scriptModal.js"></script>

<title>Página Principal</title>

<script>
	tinymce
			.init({
				selector : 'textarea',
				plugins : 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
				toolbar : 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
				height : 250,
				menubar : 'file edit view'
			});

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


</head>
<body>
	<!-- Menu Principal -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top shadow-sm">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Empreenda <span
				class="tituloMais">+</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"> <i class="fas fa-home"></i>
							Página Principal
					</a></li>
					<li class="nav-item"><a class="nav-link" href="ListarCursos"> <i
							class="fas fa-book-open"></i> Cursos
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
		</div>
	</nav>

	<main>
		<!-- Carousel Banners -->
		<section class="container-full containerCarousel">
			<div id="carouselBanner" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselBanner"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselBanner"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselBanner"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="https://www.cursoemvideo.com/" target="_blank"><img
							src="assets/image/cursos-gratuito-em-video.png"
							class="d-block w-100"
							alt="mais de 100 cursos gratuitos no sebrae"></a>
					</div>
					<div class="carousel-item">
						<a
							href="https://www.sebrae.com.br/sites/PortalSebrae/cursoseeventoseducacao?uf=SP"
							target="_blank"><img
							src="assets/image/mais-de-100-cursos-gratuitos-sebrae.png"
							class="d-block w-100" alt="desenhos de personagens estudando"></a>
					</div>
					<div class="carousel-item">
						<img src="assets/image/desenhos-de-personagens-estudando.png"
							class="d-block w-100" alt="cursos gratuitos em vídeo">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselBanner" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Anterior</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselBanner" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Próximo</span>
				</button>
			</div>
		</section>

		<section class="container mx-auto d-flex flex-lg-row">

			<section class="col col-md-9">
				<section class="jumbotron border rounded bg-white my-3 p-3">
					<h1 class="display-4">Olá!</h1>
					<p class="lead">Precisa de ajuda para melhorar seus negócios ou
						de um caminho a seguir?</p>
					<hr class="my-4">
					<p>Cadastre-se ou acesse sua conta na plataforma para interagir
						com a comunidade, pedir ajuda, ajudar, anunciar vaga ou curso e
						muito mais!</p>

					<div>
						<a class="btn btn-primary btn-lg mx-4" href="./cadastro.html"
							role="button">Cadastre-se</a> <a
							class="btn btn-white btn-lg border" href="./login.html"
							role="button" id="btLoginJumbo">Fazer Login</a>
					</div>
				</section>
				<div class="container">
					<div class="row">
						<h3 class="text-center">Feed</h3>
					</div>
					<div class="row d-flex justify-content-end">
						<div class="dropdown d-flex justify-content-end">
							<button class="btn dropdown-toggle menuCategoria" type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false">Filtrar Categoria</button>
							<ul class="dropdown-menu px-2 corpoMenuCategoria"
								aria-labelledby="dropdownMenuButton1">
								<li><a
									class="dropdown-item bg-primary text-light rounded text-center mt-1 btnCategoria pt-0"
									href="#">Vagas</a></li>
								<li><a
									class="dropdown-item bg-success text-light rounded text-center mt-1 btnCategoria pt-0"
									href="#">Cursos</a></li>
								<li><a
									class="dropdown-item bg-warning text-light rounded text-center mt-1 btnCategoria pt-0"
									href="#">Dúvidas</a></li>
								<li><a
									class="dropdown-item bg-info text-light rounded text-center mt-1 btnCategoria pt-0"
									href="#">Dicas</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Área de Posts -->
				<section>
					<!-- Postagens -->
					<c:forEach items="${postagens}" var="postagem">
						<div class="container my-3 border rounded p-4 bg-white">
							<div class="mb-3 row row-cols-auto">
								<!-- Perfil do Usuário -->
								<div class="col float-start mb-3">
									<c:choose>
										<c:when test="${empty postagem.foto_perfil}">
											<a class="" href="VerPerfil?id=${postagem.usuario_id.id}">
												<img src="https://i.postimg.cc/T3G5j2KW/user-standard.png"
												alt="Foto de perfil padrão" id="imgPerfilFeed"
												class="img-fluid rounded-circle shadow-sm"
												style="width: 100px; height: 100px;">
											</a>
										</c:when>
										<c:otherwise>
											<a class="" href="VerPerfil?id=${postagem.usuario_id.id}">
												<img src="${postagem.foto_perfil}" alt="Foto de perfil"
												id="imgPerfilFeed" class="img-fluid rounded-circle shadow-sm"
												style="width: 100px; height: 100px;">
											</a>
										</c:otherwise>
									</c:choose>

								</div>
								<!-- Informações do Usuário -->
								<div class="col py-4">
									<a href="VerPerfil?id=${postagem.usuario_id.id}"
										id="nomeUsuario">${postagem.nome_usuario}</a> <br> <span
										class="text-muted dataConvert">${postagem.data_postagem}</span>
									<br>
									<div
										class="border rounded position-absolute bg-success mt-2 text-white px-2 py-0 catPost">${postagem.categoria}</div>
								</div>
								<div class="col-1"></div>
							</div>
							<div class="mb-3">
								<label for="inputTituloPostagem" class="form-label fs-4">${postagem.titulo}</label>
							</div>
							<div class="mb-3">
								<p>${postagem.corpo}</p>
							</div>
							<div class="mb-3 d-flex justify-content-center">
								<c:if test="${not empty postagem.media_url}">
									<img src="${postagem.media_url}"
										class="img-fluid w-50 h-25 mx-50">
								</c:if>
							</div>
							<div>
								<button class="btn bg-primary text-light">
									<i class="fas fa-thumbs-up"></i> Gostei
								</button>
								<button data-post-id="${postagem.id}"
									class="btn fs-4 detalhePostagem" data-bs-toggle="modal"
									data-bs-target="#exampleModal" title="Ver Detalhes">
									<i class="fab fa-sistrix"></i>
								</button>
								<div class="float-end">
									<form action="DenunciaPostagem" method="post">
										<input type="hidden" name="idPost" value="${postagem.id}">
										<button type="submit" class="btn ">
											<i class="fas fa-exclamation-circle fs-4 text-danger"
												title="Denunciar Postagem"></i>
										</button>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</section>

				<!-- Modal -->
				<div class="modal modal-lg fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title mr-2" id="modalTitle"></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body" id="modal-body">
								<div class="row">
									<div class="col col-lg-2">
										<img src="fotoPerfil" id="fotoPerfil" alt="Foto do Perfil"
											style="width: 100px; height: 100px;"
											class="img-fluid rounded-circle shadow-sm">
									</div>
									<div class="col">
										<p>
											<a id="linkPerfil"><span id="nomeUsuarioAj"
												style="text-decoration: none;"></span></a>
										</p>
										<p>
											<span id="dataPost"></span>
										</p>
										<p>
											<span id="categoria"
												class="bg-success text-white shadow-sm px-1 rounded"></span>
										</p>
									</div>
								</div>
								<p></p>

								<p id="corpo"></p>
								<p>
									<img src="media" id="media">
								</p>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fechar</button>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- Área Lateral -->
			<aside class="col-4 mx-3 position-fixed-top" id="areaLateral">
				<section class="my-3 border rounded p-3 bg-white">
					<div
						class="text-muted border rounded position-absolute bg-white mx-1 mt-1"
						id="tagAds">Ads</div>
					<div id="bannerDivulgação">
						<img src="assets/image/ads-itau.jpg" alt="" class="img-fluid">
					</div>
				</section>

				<!-- <section class="container my-3 border rounded p-4 bg-white w-100">
					<label for="bannerDivulgação"
						class="fw-semibold mb-3 fs-4 text-start text-muted">
						Recomendações </label>
					<div id="bannerDivulgação">
						<div class="row mb-3">
							<div class="col">
								<a href="#"> <img src="./image/pessoas/pessoa-2.jpg" alt=""
									id="imgPerfilFeed" class="img-fluid rounded-circle"
									style="width: 90px; height: 90px;">
								</a>
							</div>
							<div class="col text-start mt-3">
								<a href="#" class="linkRecomedacoes">Como Divulgar sua
									empresa?</a>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col">
								<a href="#"> <img src="./image/pessoas/pessoa-3.jpg" alt=""
									id="imgPerfilFeed" class="img-fluid rounded-circle"
									style="width: 90px; height: 90px; position: relative;">
								</a>
							</div>
							<div class="col text-start mt-3">
								<a href="#" class="linkRecomedacoes">Como fazer os cálculos
									de vendas?</a>
							</div>
						</div>
					</div>
				</section> -->
			</aside>
		</section>
	</main>


</body>
</html>