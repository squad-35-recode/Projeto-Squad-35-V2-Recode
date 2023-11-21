package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PostagemDAO;

@WebServlet("/ExcluirPostagem")
public class ExcluirPostagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirPostagemServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idPostagem = Integer.parseInt(request.getParameter("idPostagem"));
		
		PostagemDAO postDao = new PostagemDAO();
		postDao.deletarPostagemPorId(idPostagem);
		
		response.sendRedirect("Perfil?attPost=true");
		 
		 
	
	}

}
