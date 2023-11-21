package br.com.empreenda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;

@WebServlet("/MainLogado")
public class MainLogadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainLogadoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 @SuppressWarnings("unused")
		int userId = (int) request.getSession().getAttribute("userId");
		 
		 PostagemDAO pDao = new PostagemDAO();
		 List<Postagem> postagens = pDao.buscarDadosRelacionados();
			
	     request.setAttribute("postagens", postagens);
	      
	     RequestDispatcher dispatcher = request.getRequestDispatcher("/IndexLogado.jsp");
	     dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
