package br.com.empreenda.controller.edicao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PerfilUsuario;
import br.com.empreenda.model.PerfilUsuarioDAO;
import br.com.empreenda.model.Usuario;

@WebServlet("/EditarInfo4")
public class EditarInfo4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditarInfo4Servlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");

		Usuario user = new Usuario();
		user.setId(userId);

		PerfilUsuario pAlt = new PerfilUsuario();
		pAlt.setContato1(request.getParameter("contato1"));
		pAlt.setContato2(request.getParameter("contato2"));
		pAlt.setContato3(request.getParameter("contato3"));
		pAlt.setContato4(request.getParameter("contato4"));
		pAlt.setIdUsuario(user);

		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		pDao.atualizarPerfilArea4(pAlt);

		response.sendRedirect("/Empreenda-Mais/EditarPerfil?atualizado=true");

	}

}
