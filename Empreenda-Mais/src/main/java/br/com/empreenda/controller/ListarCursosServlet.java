package br.com.empreenda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Curso;
import br.com.empreenda.model.CursoDAO;

@WebServlet("/ListarCursos")
public class ListarCursosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarCursosServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		CursoDAO cDao = new CursoDAO();
		List<Curso> cursos = cDao.getCursos();
		
		request.setAttribute("cursos", cursos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/curso/Cursos.jsp");
	    dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
