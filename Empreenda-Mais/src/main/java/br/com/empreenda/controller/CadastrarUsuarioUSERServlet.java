package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/CadastrarUsuarioUser")
public class CadastrarUsuarioUSERServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastrarUsuarioUSERServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome =  request.getParameter("nome");
		String email =  request.getParameter("email");
		String senha =  request.getParameter("senha");
		String tipoUsuario = "USER";
		
		Usuario objUsuario= new Usuario();
		objUsuario.setNome(nome);
		objUsuario.setEmail(email);
		objUsuario.setSenha(senha);
		objUsuario.setTipo_usuario(tipoUsuario);
		
		UsuarioDAO uDao = new UsuarioDAO();
		
		uDao.salvarUsuario(objUsuario);
		
		//Trocar para a rota da listagem de postagem posteriormente
		response.sendRedirect("/Index");
	}

}
