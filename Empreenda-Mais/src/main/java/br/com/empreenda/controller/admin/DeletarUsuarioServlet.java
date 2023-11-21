package br.com.empreenda.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PerfilUsuarioDAO;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/DeletarUsuario")
public class DeletarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletarUsuarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		pDao.deletarPorIdUsuario(idUsuario);
		
		UsuarioDAO uDao = new UsuarioDAO();
		uDao.deletarPorId(idUsuario);
		
		response.sendRedirect("/Empreenda-Mais/ListarUsuariosAdmin");
	}


}
