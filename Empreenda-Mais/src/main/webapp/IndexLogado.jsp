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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="assets/script/scriptModal.js"></script>

<style>
iframe, #media {
	margin-left: auto;
	margin-right: auto;
	display: inline;
	inline-size: -webkit-fill-available;
}
</style>

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
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fas fa-envelope"></i> Mensagens
					</a></li>
					<li class="nav-item"><a class="nav-link" href="ListagemCursosUsuario"> <i class="fas fa-book-reader"></i> Meus Cursos
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Perfil </a>
						<ul class="dropdown-menu text-center"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#"><i
									class="fas fa-user-circle fs-4 px-1"></i> <span>${sessionScope.nomeCliente}
								</span></a></li>
							<li><a class="dropdown-item" href="Perfil"><button
										class="btn border" id="btnPerfil">Ver Perfil</button></a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Configurações</a></li>
							<li><a class="dropdown-item" href="#">Ajuda</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="Logout">Sair</a></li>
						</ul></li>
					<c:choose>
						<c:when test="${sessionScope.tipo_usuario == 'ADMIN'}">
							<li class="nav-item"><a class="nav-link"
								href="/Empreenda-Mais/dashboardAdmin/Dashboard.jsp"> <i
									class="fas fa-user-cog"></i> Dashboard ADM
							</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.tipo_usuario == 'COLAB'}">
									<li class="nav-item"><a class="nav-link"
										href="/Empreenda-Mais/dashboardColab/Dashboard.jsp"> <i
											class="fas fa-user"></i> Dashboard Colaborador
									</a></li>
								</c:when>
								<c:otherwise>
									<!-- Caso o tipo de usuário não seja ADMIN ou COLAB, você pode adicionar outra lógica ou deixar em branco -->
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
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
				<section class="col col-md">
					<!-- Input Postagem LOGADO -->
					<form action="Postagem" method="post">
						<section class="container my-3 border rounded p-3 bg-white">
							<label for="formPostagem" class="fw-semibold fs-3 mb-3">
								Faça uma postagem: </label>
							<div class="mb-3">
								<div class="row align-items-end">
									<div class="col-8">
										<label for="inputTituloPostagem" class="form-label fs-4">Título
											do Post</label> <input type="text" class="form-control"
											id="inputTituloPostagem" name="titulo"
											placeholder="Título da Postagem">
									</div>
									<div class="col-4">
										<select name="categoria"
											class="form-select form-select-sm py-1">
											<option selected disabled>Categoria</option>
											<option value="Cursos">Cursos</option>
											<option value="Vagas">Vagas</option>
											<option value="Perguntas">Perguntas</option>
											<option value="Dicas">Dicas</option>
											<option value="Outros">Outros</option>
										</select>
									</div>
								</div>

							</div>
							<div class="mb-3">
								<textarea class="form-control" name="corpo" id="areaTextoPost"
									rows="3" placeholder="Digite seu texto aqui"></textarea>
							</div>
							<div>
								<label for="basic-url" class="form-label">Insira o link
									de uma imagem</label>
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon3"><i
										class="far fa-image"></i></span> <input type="text"
										class="form-control" name="media_url" id="basic-url"
										aria-describedby="basic-addon3">
								</div>
							</div>
							<div>
								<button type="submit" class="btn bg-primary text-light">Postar</button>
								<button class="btn text-danger">Excluir</button>
							</div>
						</section>
					</form>
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
												id="imgPerfilFeed"
												class="img-fluid rounded-circle shadow-sm"
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
								<button type="button" class="btn btn-primary">Save
									changes</button>
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