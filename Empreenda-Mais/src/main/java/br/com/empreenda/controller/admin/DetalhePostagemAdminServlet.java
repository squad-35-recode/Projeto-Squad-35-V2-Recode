package br.com.empreenda.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;

@WebServlet("/DetalhePostagemAdmin")
public class DetalhePostagemAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalhePostagemAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idPost = Integer.parseInt(request.getParameter("idPostagem"));
		
		PostagemDAO pDao = new PostagemDAO();
		List<Postagem> detPost = pDao.buscarDadosRelacionadosByIdPostagem(idPost);
		
		request.setAttribute("postagem", detPost);
		request.getRequestDispatcher("/dashboardAdmin/DetalhePostagem.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
