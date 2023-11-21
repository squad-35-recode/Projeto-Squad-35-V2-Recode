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


<script src="./usuario/script/deleteInscricao.js"></script>

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
	
	document.addEventListener("DOMContentLoaded", function() {
	    var dataConvertElements = document.querySelectorAll('.dataConvert');

	    dataConvertElements.forEach(function(element) {
	        var dataSQL = element.textContent;
	        var partesData = dataSQL.split('-');
	        var dataFormatada = partesData[2] + '/' + partesData[1] + '/' + partesData[0];
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
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="MainLogado"> <i class="fas fa-home"></i>
							Página Principal
					</a></li>
					<li class="nav-item"><a class="nav-link" href="ListarCursos"> <i
							class="fas fa-book-open"></i> Cursos
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="fas fa-envelope"></i> Mensagens
					</a></li>
					<li class="nav-item"><a class="nav-link active" href="#"> <i class="fas fa-book-reader"></i> Meus Cursos
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
	<div class="container">
		<a href="#topo" id="botao-topo" title="Voltar ao Topo"> <i
			class="fas fa-chevron-up text-primary fs-2 rounded-circle bg-light px-3 py-3 shadow-sm float-end position-fixed bottom-0 end-0 m-3"></i>
		</a>
		<div class="main-body mt-50">
			<div class="container-fluid conteudo">
			<main>
				<h1> <i class="fas fa-book-open px-3 py-4"> </i>Lista de Inscrições</h1>
				<form>
					<div class="table-responsive">
						<table class="table table-hover text-left">
							<thead>
								<tr>
									<td scope="col" class="headerTable bg-success text-white">#</td>
									<td scope="col" class="headerTable bg-success text-white">Titulo</td>
									<td scope="col" class="headerTable bg-success text-white">Data da Inscrição</td>
								</tr>
							</thead>
							<c:forEach items="${inscricoes}" var="inscricao">
								<tbody>
									<tr scope="row">
										<td>${inscricao.id}</td>
										<td>${inscricao.titulo}</td>
										<td><span class="dataConvert">${inscricao.data_inscricao}</span></td>
										<td>
											<div class="d-flex justify-content-center">
												<a
													href="/Empreenda-Mais/DetalheCurso?id=${inscricao.id_curso.id}&origem=listagem"
													style="cursor: pointer;"
													class="text-white bg-primary px-2 py-1 mx-1 rounded"
													data-toggle="tooltip" data-placement="top"
													title="Ver Conteúdo"> <i class="fas fa-external-link-alt"></i>
												</a>
												<a href="#" onclick="confirmarDeletar(${inscricao.id})"
													style="cursor: pointer;"
													class="text-white bg-danger px-2 py-1 rounded"
													data-toggle="tooltip" data-placement="top"
													title="Excluir Cliente"> <i class="fas fa-window-close"></i>
												</a>
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</form>
			</main>


		</div>


	</div>
	</div>

	</div>
	</div>


</body>

</html>