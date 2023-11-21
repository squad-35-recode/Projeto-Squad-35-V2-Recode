package br.com.empreenda.controller.edicao;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PerfilUsuario;
import br.com.empreenda.model.PerfilUsuarioDAO;
import br.com.empreenda.model.Usuario;


@WebServlet("/EditarInfo5")
public class EditarInfo5Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarInfo5Servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		
		Usuario user = new Usuario();
		user.setId(userId);

		PerfilUsuario pAlt = new PerfilUsuario();
		String dataNasString = request.getParameter("data_nas");
		LocalDate dataNas = LocalDate.parse(dataNasString);
		pAlt.setData_nas(dataNas);
		pAlt.setEscolaridade(request.getParameter("escolaridade"));
		pAlt.setRenda(request.getParameter("renda"));
		pAlt.setIdUsuario(user);
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		pDao.atualizarPerfilArea5(pAlt);
		
		response.sendRedirect("/Empreenda-Mais/EditarPerfil?atualizado=true");
	
	}

}
