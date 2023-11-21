package br.com.empreenda.controller.colaborador;

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

@WebServlet("/ListarCursosColab")
public class ListarCursosColabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarCursosColabServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int userId = (int) request.getSession().getAttribute("userId");
		
		CursoDAO cDao = new CursoDAO();
		List<Curso> cursos = cDao.getCursosByIdColab(userId);
		
		request.setAttribute("cursos", cursos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboardColab/ListaCursos.jsp");
	    dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
