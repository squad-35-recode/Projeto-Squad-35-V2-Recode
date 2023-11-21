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

@WebServlet("/EditarInfo3")
public class EditarInfo3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditarInfo3Servlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		
		PerfilUsuario pAlt = new PerfilUsuario();
		pAlt.setInteresse1(request.getParameter("interesse1"));
		pAlt.setInteresse2(request.getParameter("interesse2"));
		pAlt.setInteresse3(request.getParameter("interesse3"));

		Usuario user = new Usuario();
		user.setId(userId);
		pAlt.setIdUsuario(user);
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		pDao.atualizarPerfilArea3(pAlt);	
		response.sendRedirect("/Empreenda-Mais/EditarPerfil?atualizado=true");
	}


}
