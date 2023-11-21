package br.com.empreenda.controller.edicao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/TrocarSenha")
public class TrocarSenhaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrocarSenhaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		String novaSenha = request.getParameter("senha");
		
		UsuarioDAO uDao = new UsuarioDAO();
		Usuario u = new Usuario();
		u.setSenha(novaSenha);
		u.setId(userId);
		uDao.atualizarSenha(u);
		
		response.sendRedirect("EditarPerfil?atualizado=true");
		
	
	}

}
