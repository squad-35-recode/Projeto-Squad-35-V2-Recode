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

@WebServlet("/ListarInscricoesColab")
public class ListarInscricoesColabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarInscricoesColabServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int userId = (int) request.getSession().getAttribute("userId");
		
		InscricaoCursoDAO icDao = new InscricaoCursoDAO();
		List<InscricaoCurso> inscricoes = icDao.buscarInscricaoByIdColab(userId);
		
		request.setAttribute("inscricoes", inscricoes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboardColab/ListaInscricoes.jsp");
	    dispatcher.forward(request, response);
	
	}


}
