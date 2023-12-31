<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Link CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <!-- Link JavaScript Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <!-- Link Font-Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

    <link rel="stylesheet" href="../assets/css/styleCursos.css">

    

    <title>Cursos</title>
</head>
<body>
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
							<li class="nav-item"><a class="nav-link active" href="#"> <i
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
							<li class="nav-item"><a class="nav-link active" href="#">
									<i class="fas fa-book-open"></i> Cursos
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

	<section>
        <div class="container-fluid">
            <header class="blog-header py-3">
              <div class="row">
                <div class="col text-center">
                  <h1 class="text-dark text-center tituloCursos"> <i class="fas fa-book-open px-3"></i>Cursos</h1>
                </div>
                <div class="col">
                  <div class="input-group">
                    <input class="form-control border-end-0 border" type="search" value="Pesquisar" id="pesquisaCursos">
                    <span class="input-group-append">
                        <button class="btn bg-white border-start-0 border-bottom-0 border ms-n5" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
                </div>
              </div>
            </header>
          
            <nav class="navbar nav text-center py-3 mb-2 bg-white shadow-sm">
              <div class="container-fluid d-flex justify-content-center">
                <a class="p-2 link-secondary" href="#">Educação Financeira</a> <span class="bulletContato px-2">&#x2022;</span>
                <a class="p-2 link-secondary" href="#">Desenvolvimento Pessoal</a> <span class="bulletContato px-2">&#x2022;</span>
                <a class="p-2 link-secondary" href="#">Gestão de Empresa</a> <span class="bulletContato px-2">&#x2022;</span>
                <a class="p-2 link-secondary" href="#">MEI - Primeiros Passos</a> <span class="bulletContato px-2">&#x2022;</span>
                <a class="p-2 link-secondary" href="#">Leis</a> <span class="bulletContato px-2">&#x2022;</span>
                <a class="p-2 link-secondary" href="#">Eventos</a> <span class="bulletContato px-2">&#x2022;</span>
                <a class="p-2 link-secondary" href="#">Instituições Parceiras</a> 
              </div>
            </nav>
        </div>
    </section>

    <main>
      <div class="p-4 p-md-5 mb-4 text-white bg-info fundoHeroCursos">
        <div class="col-md-6 px-0">
          <h1 class="display-4 fst-italic text-white">Mude o seu futuro agora</h1>
          <p class="lead my-3 text-white">Seja no início do seu negócio, no andamento, em um momento de desespero ou com aquela sensação de estar perdido, podemos te ajudar! </p>
          <p class="lead mb-0"><a href="#cursosDisp" class="text-white fw-bold scrollto linkHero">Ver cursos</a></p>
        </div>
      </div>
        
     <!--  <div class="row mb-2">
        <div class="col-md-6">
          <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static bg-white">
              <strong class="d-inline-block mb-2 text-primary">Educação Financeira</strong>
              <h3 class="mb-0">Lucro Sobre Venda</h3>
              <div class="mb-1 text-muted">Ago 30</div>
              <p class="card-text mb-auto">Aprenda a base do Microsoft Excel para poder gerir seu lucro sobre vendas e alavancar seu negócio</p>
              <a href="#" class="stretched-link">Ver Conteúdo</a>
            </div>
            <div class="col-auto d-none d-lg-block">
              <img src="../image/cursos/sheet1-cropped-jpg.jpeg" alt="" class="img-fluid imgBanner1">
    
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static bg-white">
              <strong class="d-inline-block mb-2 text-success">Desenvolvimento Pessoal</strong>
              <h3 class="mb-0">Comunicação</h3>
              <div class="mb-1 text-muted">Nov 11</div>
              <p class="mb-auto">Aprenda como se portar com clientes, fornecedores e demais interessados no seu negócio</p>
              <a href="#" class="stretched-link">Ver Conteúdo</a>
            </div>
            <div class="col-auto d-none d-lg-block">
             <img src="../image/cursos/des-pes-cropped.jpg" alt="" class="img-fluid imgBanner1">
    
            </div>
          </div>
        </div>
      </div> -->
	
      <section class="container-full px-3 ">
        <div class="row g-5">
	          <div class="col-md-8">
	            <h3 class="pb-4 mb-4 fst-italic border-bottom" id="cursosDisp">
	              Cursos Disponíveis
	            </h3>
	            <div class="row position-sticky d-flex">
	            <c:forEach items="${cursos}" var="curso">
	              <div class="col-md-5 d-flex flex-column position-static">
	                <div class="card cardCurso mb-3">
	                  <img class="card-img-top h-100" src="${curso.foto_capa}" alt="Card image cap">
	                  <div class="card-body">
	                    <strong class="d-inline-block mb-2 text-primary">${curso.categoria}</strong>
	                    <h5 class="card-title">${curso.titulo}</h5>
	                    <p class="card-text">${curso.descricao}</p>
	                  </div>
	                  <div class="card-footer">
	                    <a href="DetalheCurso?id=${curso.id}" class="btn btn-primary">Acessar Curso</a>
	                  </div>
	                </div>
	              </div>
	              </c:forEach>
	          </div>
          </div>
          
          <div class="col-md-4">
            <div class="position-sticky" style="top: 2rem;">
              <div class="p-4 mb-3 bg-light rounded">
                <div class="text-muted border rounded position-absolute bg-white mx-1 mt-1" id="tagAds">Ads</div>
                <p class="mb-0"><img src="./assets/image/ads-itau.jpg" alt="" class="img-fluid"></p>
              </div>
              <div class="p-4">
                <h4 class="fst-italic">Encontre seu Tópico</h4>
                <ol class="list-unstyled mb-0">
                  <li><a href="#">Finanças</a></li>
                  <li><a href="#">Desenvolvimento Pessoal</a></li>
                  <li><a href="#">Abertura de Empresa</a></li>
                  <li><a href="#">Entenda seu Negócio</a></li>
                </ol>
              </div>
              <div class="p-4">
                <h4 class="fst-italic">Parceiros</h4>
                <ol class="list-unstyled">
                  <li><a href="#">SEBRAE</a></li>
                  <li><a href="#">Curso em Vídeo</a></li>
                  <li><a href="#">Canais Diversos</a></li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

    
</body>
</html>