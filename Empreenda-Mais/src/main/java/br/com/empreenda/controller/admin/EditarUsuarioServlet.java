package br.com.empreenda.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
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

@WebServlet("/EditarUsuario")
public class EditarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarUsuarioServlet() {
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
        request.getRequestDispatcher("/dashboardAdmin/AtualizarUsuario.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int idUsuario = Integer.parseInt(request.getParameter("id"));
		
		try {
			Usuario user = new Usuario();
			user.setId(idUsuario);
			user.setNome(request.getParameter("nome"));
			user.setSenha(request.getParameter("senha"));
			user.setTipo_usuario(request.getParameter("tipo_usuario"));
			UsuarioDAO uDao = new UsuarioDAO();
			uDao.atualizarPorIdAdmin(user);
			
			
			PerfilUsuario pAlt = new PerfilUsuario();
			pAlt.setBio(request.getParameter("bio"));
			pAlt.setOcupacao(request.getParameter("ocupacao"));
			pAlt.setFoto_url(request.getParameter("foto_url"));
			
			pAlt.setTelefone1(request.getParameter("telefone1"));
			pAlt.setTelefone2(request.getParameter("telefone2"));
			pAlt.setLogradouro(request.getParameter("logradouro"));
			pAlt.setCep(request.getParameter("cep"));
			pAlt.setCidade(request.getParameter("cidade"));
			pAlt.setUf(request.getParameter("uf"));
			
			pAlt.setInteresse1(request.getParameter("interesse1"));
			pAlt.setInteresse2(request.getParameter("interesse2"));
			pAlt.setInteresse3(request.getParameter("interesse3"));
			
			pAlt.setContato1(request.getParameter("contato1"));
			pAlt.setContato2(request.getParameter("contato2"));
			pAlt.setContato3(request.getParameter("contato3"));
			pAlt.setContato4(request.getParameter("contato4"));
			
			String dataNasString = request.getParameter("data_nasc");
			LocalDate dataNas = LocalDate.parse(dataNasString);
			pAlt.setData_nas(dataNas);
			
			pAlt.setEscolaridade(request.getParameter("escolaridade"));
			pAlt.setRenda(request.getParameter("renda"));
			
			pAlt.setIdUsuario(user);
			
			PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
			pDao.atualizarPerfil(pAlt);
			
			response.sendRedirect("/Empreenda-Mais/EditarUsuario?idUsuario="+idUsuario+"&atualizado=true");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
