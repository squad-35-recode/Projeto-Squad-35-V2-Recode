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


@WebServlet("/EditarInfo1")
public class EditarInfo1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarInfo1Servlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		
		PerfilUsuario pAlt = new PerfilUsuario();
		pAlt.setBio(request.getParameter("bio"));
		pAlt.setOcupacao(request.getParameter("ocupacao"));
		pAlt.setFoto_url(request.getParameter("foto_url"));
		
		Usuario user = new Usuario();
		user.setId(userId);
		pAlt.setIdUsuario(user);
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		pDao.atualizarPerfilArea1(pAlt);
		
		response.sendRedirect("/Empreenda-Mais/EditarPerfil?atualizado=true");
		
	
	}

}
