package br.com.empreenda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import br.com.empreenda.model.Postagem;
import br.com.empreenda.model.PostagemDAO;

@WebServlet("/DetalhePostagem")
public class DetalhePostagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalhePostagemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idPost = request.getParameter("id");
		int idPostagem = Integer.parseInt(idPost);
		
		PostagemDAO pDao = new PostagemDAO();
		List<Postagem> detPost = pDao.buscarDadosRelacionadosByIdPostagem(idPostagem);
		
		request.setAttribute("detPost", detPost);
		
	    Postagem postagem = detPost.get(0);

	    JSONObject detalhesJson = new JSONObject();
	    String nomeUsuario = postagem.getNome_usuario();
	    detalhesJson.put("nomeUsuario", nomeUsuario);
	    detalhesJson.put("idPerfil", postagem.getPerfil_id().getId());
	    detalhesJson.put("idUsuario", postagem.getUsuario_id().getId());
	    detalhesJson.put("fotoPerfil", postagem.getFoto_perfil());
	    detalhesJson.put("titulo", postagem.getTitulo());
	    detalhesJson.put("corpo", postagem.getCorpo());
	    detalhesJson.put("categoria", postagem.getCategoria());
	    detalhesJson.put("dataPost", postagem.getData_postagem());
	    detalhesJson.put("media", postagem.getMedia_url());

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(detalhesJson.toString());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
