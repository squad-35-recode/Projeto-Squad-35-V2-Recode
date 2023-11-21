package br.com.empreenda.controller.colaborador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Curso;
import br.com.empreenda.model.CursoDAO;

@WebServlet("/DetalheCursoColab")
public class DetalheCursoColabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalheCursoColabServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idCurso = Integer.parseInt(request.getParameter("id"));
		
		CursoDAO cDao = new CursoDAO();
		List<Curso> detCurso = cDao.getCursosById(idCurso);
		
		request.setAttribute("curso", detCurso);
		request.getRequestDispatcher("/dashboardColab/DetalheCurso.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
