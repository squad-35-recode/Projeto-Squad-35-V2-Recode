package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;

@WebServlet("/DenunciaPostagem")
public class DenunciaPostagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DenunciaPostagemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String StrPostId = request.getParameter("idPost");
		
		int postId = Integer.parseInt(StrPostId);
		System.out.println(postId);
		int denuncia = 1;
		System.out.println(denuncia);
		
		Postagem p = new Postagem();
		p.setDenuncia(denuncia);
		p.setId(postId);
		
		
		PostagemDAO pDao = new PostagemDAO();
		pDao.denunciarPostagem(p);
		
		response.sendRedirect("/Empreenda-Mais/Index?report=true");
		
	}

}
