package br.com.empreenda.controller.colaborador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Curso;
import br.com.empreenda.model.CursoDAO;
import br.com.empreenda.model.Usuario;

@WebServlet("/CriarCurso")
public class CriarCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CriarCursoServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String strIdUsuario = request.getParameter("id_usuario");
		int idUsuario = Integer.parseInt(strIdUsuario);
		
		Curso objCurso = new Curso();
		String titulo = request.getParameter("titulo");
		objCurso.setTitulo(titulo);
		
		String categoria = request.getParameter("categoria");
		objCurso.setCategoria(categoria);
		
		String descricao = request.getParameter("descricao");
		objCurso.setDescricao(descricao);
		
		java.util.Date dataUtil = new java.util.Date();
		objCurso.setData_criacao(dataUtil);
		
		String media = request.getParameter("media_url");
		objCurso.setMedia_url(media);
		
		String foto = request.getParameter("foto_capa");
		objCurso.setFoto_capa(foto);
		
		Usuario user = new Usuario();
		user.setId(idUsuario);
		objCurso.setId_colaborador(user);
		
		CursoDAO cDao = new CursoDAO();
		cDao.criarCurso(objCurso);
		
		response.sendRedirect("/dashboardColab/Dashboard.jsp");
//		response.sendRedirect(request.getContextPath() + "/ListarCursosColab");
	
	}

}
