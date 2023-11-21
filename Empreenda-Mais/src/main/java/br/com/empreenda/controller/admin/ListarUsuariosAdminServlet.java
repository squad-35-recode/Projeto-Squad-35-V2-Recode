package br.com.empreenda.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/ListarUsuariosAdmin")
public class ListarUsuariosAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarUsuariosAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		UsuarioDAO uDao = new UsuarioDAO();
		List<Usuario> usuarios = uDao.getUsuarios();
		
		request.setAttribute("usuarios", usuarios);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboardAdmin/ListaUsuarios.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
