package br.com.empreenda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Curso;
import br.com.empreenda.model.CursoDAO;

@WebServlet("/DetalheCurso")
public class DetalheCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalheCursoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String idCursoStr = request.getParameter("id");
		int idCurso = Integer.parseInt(idCursoStr);
		
		CursoDAO cDao = new CursoDAO();
		List<Curso> curso = cDao.getCursosById(idCurso);
		
		request.setAttribute("curso", curso);
		request.getRequestDispatcher("/curso/Curso.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
