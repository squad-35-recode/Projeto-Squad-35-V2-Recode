package br.com.empreenda.controller.colaborador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.InscricaoCurso;
import br.com.empreenda.model.InscricaoCursoDAO;

@WebServlet("/DetalheInscricaoColab")
public class DetalheInscricaoColabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalheInscricaoColabServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idInscricao = Integer.parseInt(request.getParameter("idInscricao"));
	
		InscricaoCursoDAO icDao = new InscricaoCursoDAO();
		List<InscricaoCurso> inscricao = icDao.buscarInscricaoById(idInscricao);
		
		request.setAttribute("inscricao", inscricao);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboardColab/DetalheInscricao.jsp");
	    dispatcher.forward(request, response);
		
	
	}


}
