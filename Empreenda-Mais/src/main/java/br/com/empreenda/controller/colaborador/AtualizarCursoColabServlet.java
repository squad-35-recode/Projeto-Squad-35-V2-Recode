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

@WebServlet("/AtualizarCursoColab")
public class AtualizarCursoColabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AtualizarCursoColabServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idCurso = Integer.parseInt(request.getParameter("id"));
		
		CursoDAO cDao = new CursoDAO();
		List<Curso> detCurso = cDao.getCursosById(idCurso);
		
		request.setAttribute("curso", detCurso);
		request.getRequestDispatcher("/dashboardColab/AtualizarCurso.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int idCurso = Integer.parseInt(idStr);
		
		Curso cursoAlt = new Curso();
		cursoAlt.setTitulo(request.getParameter("titulo"));
		cursoAlt.setCategoria(request.getParameter("categoria"));
		cursoAlt.setDescricao(request.getParameter("descricao"));
		cursoAlt.setFoto_capa(request.getParameter("foto_capa"));
		cursoAlt.setMedia_url(request.getParameter("media_url"));
		cursoAlt.setId(idCurso);
		
		CursoDAO cDao = new CursoDAO();
		cDao.atualizarCurso(cursoAlt);
		response.sendRedirect("/Empreenda-Mais/ListarCursosColab");
		
	}

}
