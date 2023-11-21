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

<script
	src="https://cdn.tiny.cloud/1/8svz9148gua03293my7b0e5drfls3zdv5h5b52vt4dbntdgt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>

<script>
	tinymce
			.init({
				selector : '#textArea',
				plugins : 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
				toolbar : 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
				height : 250,
				menubar : 'file edit view'
			});
</script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./dashboardColab/css/estiloDash.css">

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
					<a href="/Empreenda-Mais/dashboardColab/Dashboard.jsp" class="navbar-brand"> <span class="mx-5">Emprega
							+ </span>Colaborador
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
							<li class="nav-item"><a href="/Empreenda-Mais/dashboardColab/Dashboard.jsp" class="nav-link"> <i
									class="fas fa-home"></i> Home
							</a></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle active" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-book-open"></i><span
									class="ms-1 d-none d-sm-inline">Cursos</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Empreenda-Mais/ListarCursosColab">Listar</a></li>
									<li><a class="dropdown-item" href="./CadastroCurso.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-pencil-alt"></i><span
									class="ms-1 d-none d-sm-inline">Inscrições</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Empreenda-Mais/ListarInscricoesColab">Listar</a></li>
									<li><a class="dropdown-item"
										href="./CadastroInscricao.jsp">Cadastrar</a></li>
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
												<form class="mx-1 mx-md-4" action="AtualizarCursoColab"
													id="formPerfil" method="post">
													<jstl:forEach items="${curso}" var="curso">
														<h1 class="text-center">Atualizar Dados</h1>
														<p class="text-center h1 fw-bold mb-5 mt-4">
															<span style="color: #8AA6A3 !important;">${curso.titulo}
															</span>
														</p>
														<input value="${curso.id}" name="id" hidden />

														<div
															class="d-flex flex-row row gx-2 flex-wrap align-items-center mb-4">
															<div
																class="form-outline flex-md-wrap flex-fill mb-0 w-50">
																<label class="form-label fs-5" for="tituloCurso">Título</label>
																<input type="text" id="tituloCurso" class="form-control"
																	name="titulo" value="${curso.titulo}" required />
															</div>
														</div>
														<div
															class="d-flex flex-row row gx-2 flex-wrap align-items-center mb-4">
															<div
																class="form-outline flex-md-wrap flex-fill mb-0 w-50">
																<label class="form-label fs-5" for="categoria">Categoria
																	do Curso</label> <select id="categoria" class="form-control"
																	name="categoria" required>
																	<option selected disabled>Categoria</option>
																	<option value="Cursos">Educação Financeira</option>
																	<option value="Vagas">Desenvolvimento Pessoal</option>
																	<option value="Perguntas">Gestão de Empresa</option>
																	<option value="Dicas">MEI - Primeiros Passos</option>
																	<option value="Outros">Leis</option>
																	<option value="Outros">Tecnologia</option>
																	<option value="Outros">Outros</option>
																</select> <span>Categoria atual: ${curso.categoria}</span>
															</div>

														</div>

														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="textArea">Descrição
																	do Curso: </label>
																<textarea id="textArea" name="descricao"
																	maxlength="4500"
																	placeholder="Insira a descrição do curso"></textarea>
															</div>
														</div>



														<div class="col form-outline border border-info p-2 rounded flex-fill mb-0 me-2">
															<label class="form-label fs-5" for="txt">Descrição Atual: <small>(Se não mudou, favor insira novamente)</small></label>
															<div class="input-group input-group mb-1" id="txt">
																<p class="text-muted px-2">
																	${curso.descricao}
																</p>
															</div>
														</div>

														<div
															class="d-flex justify-content-center flex-column align-items-center fs-6 mt-3 mb-2">
															<label class="form-label fs-5" for="foto">Foto de Capa Atual:</label>
															<div class="row mb-2" id="foto">
																<img src="${curso.foto_capa}" style="">
															</div>
															<div class="row">
																<div class="input-group input-group mb-3">
																	<span class="input-group-text"><i
																		class="far fa-image"></i></span> <input type="text"
																		class="form-control" size="100" name="foto_capa"
																		value="${curso.foto_capa}" placeholder="http://imagem">
																</div>
															</div>
														</div>
														
														<div class="form-outline flex-fill mx-2">
														<h5>Conteúdo do Curso</h5>
														<h6 class="px-2 text-muted mx-1">Conteúdo Atual <small>(Se não mudou, favor insira novamente)</small></h6>
														<div class="row mb-2">
															${curso.media_url}
														</div>
															<div class="input-group mb-3">
																<span class="input-group-text" id="basic-addon3"><i
																	class="far fa-image"></i></span> 
																	<input type="text"
																	class="form-control" name="media_url" id="basic-url"
																	aria-describedby="basic-addon3" placeholder="<iframe.....">
															</div>
														</div>
														
													</jstl:forEach>
													<div
														class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
														<button type="submit" class="btn btn-primary btn-lg">Atualizar
															Dados</button>
													</div>

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
	</div>
	<footer class="row container-fluid footer">
		<div class="col col-md-8">&reg; Empreenda + | 2023</div>
		<div class="col col-6 col-md-4 d-flex justify-content-end">Versão
			- 2.0</div>
	</footer>


</body>
</html>