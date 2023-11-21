package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PerfilUsuario;
import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;

@WebServlet("/Postagem")
public class PostagensServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostagensServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		
		Postagem objPost = new Postagem();
		String titulo = request.getParameter("titulo");
		objPost.setTitulo(titulo);
		
		String corpo = request.getParameter("corpo");
		objPost.setCorpo(corpo);
		
		String mediaUrl = request.getParameter("media_url");
		objPost.setMedia_url(mediaUrl);
		
		String categoria = request.getParameter("categoria");
		objPost.setCategoria(categoria);
		
		java.util.Date dataUtil = new java.util.Date();
		objPost.setData_postagem(dataUtil);
		
		PerfilUsuario pUser = new PerfilUsuario();
		pUser.setId(userId);
		objPost.setPerfil_id(pUser);
		
		PostagemDAO pDao = new PostagemDAO();
		pDao.salvarPostagem(objPost);
	
		response.sendRedirect(request.getContextPath() + "/MainLogado");
	}

}
