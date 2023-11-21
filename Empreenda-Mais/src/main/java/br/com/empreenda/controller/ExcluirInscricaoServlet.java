package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.InscricaoCursoDAO;

@WebServlet("/ExcluirInscricao")
public class ExcluirInscricaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirInscricaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idInscricao = Integer.parseInt(request.getParameter("idInscricao"));
	
		InscricaoCursoDAO icDao = new InscricaoCursoDAO();
		icDao.deletarPorId(idInscricao);
		
		response.sendRedirect("ListagemCursosUsuario");
	}


}
