package br.com.empreenda.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.PerfilUsuario;
import br.com.empreenda.model.PerfilUsuarioDAO;
import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;

@WebServlet("/FazerPostagemAdmin")
public class FazerPostagemAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FazerPostagemAdminServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userId = Integer.parseInt(request.getParameter("id_usuario"));
		
		Postagem objPost = new Postagem();
		String titulo = request.getParameter("titulo");
		objPost.setTitulo(titulo);
		
		String corpo = request.getParameter("corpo");
		objPost.setCorpo(corpo);
		
		String mediaUrl = request.getParameter("media_url");
		objPost.setMedia_url(mediaUrl);
		
		String categoria = request.getParameter("categoria");
		objPost.setCategoria(categoria);
		
		java.util.Date dataUtil = new java.util.Date();
		objPost.setData_postagem(dataUtil);
		
		PerfilUsuarioDAO perDao = new PerfilUsuarioDAO();
	    int idPerfil = perDao.obterIdPerfilPorIdUsuario(userId);
	    PerfilUsuario pUser = new PerfilUsuario();
        pUser.setId(idPerfil);
        objPost.setPerfil_id(pUser);
        
		PostagemDAO pDao = new PostagemDAO();
		pDao.salvarPostagem(objPost);
		
		response.sendRedirect(request.getContextPath() + "/ListarPostagensAdmin");
	}

}
