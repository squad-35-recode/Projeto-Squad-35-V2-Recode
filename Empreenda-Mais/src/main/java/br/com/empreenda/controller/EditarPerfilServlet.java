package br.com.empreenda.controller;

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

@WebServlet("/EditarPerfil")
public class EditarPerfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarPerfilServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = (int) request.getSession().getAttribute("userId");
        
        PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
        
        List<PerfilUsuario> perfil = pDao.getPerfilByUser(userId);
        
        UsuarioDAO uDao = new UsuarioDAO();
        List<Usuario> usuario = uDao.getUsuariosById(userId);

        request.setAttribute("usuario", usuario);
        request.setAttribute("perfil", perfil);
        request.getRequestDispatcher("/usuario/EditarPerfil.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
