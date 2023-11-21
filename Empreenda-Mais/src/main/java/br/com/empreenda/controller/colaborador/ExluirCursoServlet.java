package br.com.empreenda.controller.colaborador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.CursoDAO;

@WebServlet("/ExluirCurso")
public class ExluirCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExluirCursoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idCurso = Integer.parseInt(request.getParameter("idCurso"));
		CursoDAO cDao = new CursoDAO();
		cDao.deletarPorId(idCurso);
		
		response.sendRedirect("/Empreenda-Mais/ListarCursosColab");
	}


}
