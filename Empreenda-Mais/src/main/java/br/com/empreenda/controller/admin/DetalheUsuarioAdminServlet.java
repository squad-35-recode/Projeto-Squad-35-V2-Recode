package br.com.empreenda.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PerfilUsuario;
import br.com.empreenda.model.PerfilUsuarioDAO;
import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/DetalheUsuario")
public class DetalheUsuarioAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalheUsuarioAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		
		List<PerfilUsuario> perfil = pDao.getPerfilByUser(idUsuario);
		
		UsuarioDAO uDao = new UsuarioDAO();
		List<Usuario> usuario = uDao.getUsuariosById(idUsuario);
		
		request.setAttribute("usuario", usuario);
        request.setAttribute("perfil", perfil);
        request.getRequestDispatcher("/dashboardAdmin/DetalheUsuario.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
