package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/CadastrarUsuarioColab")
public class CadastrarUsuarioCOLABServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastrarUsuarioCOLABServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String origem = request.getParameter("origem"); 
		
		String nome =  request.getParameter("nome");
		String email =  request.getParameter("email");
		String tipoUsuario = "COLAB";
		
		Usuario objUsuario= new Usuario();
		objUsuario.setNome(nome);
		objUsuario.setEmail(email);
		objUsuario.setSenha("abcd123");		
		objUsuario.setTipo_usuario(tipoUsuario);
		
		UsuarioDAO uDao = new UsuarioDAO();
		
		uDao.salvarUsuario(objUsuario);
		
		 if ("login.html".equals(origem)) {
		        response.sendRedirect("login.html?colab=true");
		    } else if ("cadastro.html".equals(origem)) {
		        response.sendRedirect("cadastro.html?colab=true");
		    } else {
		        response.sendRedirect("login.html");
		    }
	}

}
