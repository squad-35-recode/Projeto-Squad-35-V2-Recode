package br.com.empreenda.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Usuario;
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/CadastroUsuarioAdmin")
public class CadastroUsuarioAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastroUsuarioAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String tipoUsuario = request.getParameter("tipo_usuario");
		
		Usuario u = new Usuario();
		u.setNome(nome);
		u.setEmail(email);
		u.setSenha(senha);
		u.setTipo_usuario(tipoUsuario);
		
		UsuarioDAO uDao = new UsuarioDAO();
		uDao.salvarUsuario(u);
		
		response.sendRedirect("/Empreenda-Mais/ListarUsuariosAdmin?criado=true");
		
	}

}
