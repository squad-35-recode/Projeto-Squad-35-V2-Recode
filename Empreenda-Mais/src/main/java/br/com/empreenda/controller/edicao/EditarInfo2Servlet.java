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
import br.com.empreenda.model.UsuarioDAO;

@WebServlet("/EditarInfo2")
public class EditarInfo2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarInfo2Servlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		

		Usuario user = new Usuario();
		user.setId(userId);

		Usuario uAlt = new Usuario();
		uAlt.setNome(request.getParameter("nome"));
		
		String compEmailString = request.getParameter("compartilhar_email");
		boolean compEmail = "true".equals(compEmailString);
		uAlt.setCompartilhar_email(compEmail);
		
		uAlt.setId(userId);
		UsuarioDAO uDao = new UsuarioDAO();
		uDao.atualizarNomePorIdUser(uAlt);
		
		
		PerfilUsuario pAlt = new PerfilUsuario();
		pAlt.setTelefone1(request.getParameter("telefone1"));
		pAlt.setTelefone2(request.getParameter("telefone2"));
		pAlt.setLogradouro(request.getParameter("logradouro"));
		pAlt.setCep(request.getParameter("cep"));
		pAlt.setCidade(request.getParameter("cidade"));
		pAlt.setUf(request.getParameter("uf"));
		
		String compTel1String = request.getParameter("compartilhar_telefone1");
		boolean compTel1 = "true".equals(compTel1String);
		pAlt.setCompartilhar_telefone1(compTel1);
		
		String compTel2String = request.getParameter("compartilhar_telefone2");
		boolean compTel2 = "true".equals(compTel2String);
		pAlt.setCompartilhar_telefone2(compTel2);
		
		String compEndString = request.getParameter("compartilhar_endereco");
		boolean compEnd = "true".equals(compEndString);
		pAlt.setCompartilhar_endereco(compEnd);
		
		pAlt.setIdUsuario(user);
		
		PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
		pDao.atualizarPerfilArea2(pAlt);
		
		response.sendRedirect("/Empreenda-Mais/EditarPerfil?atualizado=true");
	}

}
