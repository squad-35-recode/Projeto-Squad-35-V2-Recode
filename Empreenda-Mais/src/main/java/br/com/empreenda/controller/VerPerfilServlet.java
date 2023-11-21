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
import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;
import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/VerPerfil")
public class VerPerfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VerPerfilServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int userId = Integer.parseInt(request.getParameter("id"));
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
        
        List<PerfilUsuario> perfil = pDao.getPerfilByUser(userId);
        
        UsuarioDAO uDao = new UsuarioDAO();
        List<Usuario> usuario = uDao.getUsuariosById(userId);
        
        PostagemDAO postDao = new PostagemDAO();
		List<Postagem> postagens = postDao.buscarDadosRelacionadosByIdPerfil(userId);
		
	    request.setAttribute("postagens", postagens);
        request.setAttribute("usuario", usuario);
        request.setAttribute("perfil", perfil);
        request.getRequestDispatcher("/usuario/PerfilVisualizacao.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
