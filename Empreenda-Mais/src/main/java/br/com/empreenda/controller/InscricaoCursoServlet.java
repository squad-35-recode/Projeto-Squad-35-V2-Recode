package br.com.empreenda.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.empreenda.model.Curso;
import br.com.empreenda.model.InscricaoCurso;
import br.com.empreenda.model.InscricaoCursoDAO;
import br.com.empreenda.model.Usuario;

@WebServlet("/InscricaoCurso")
public class InscricaoCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InscricaoCursoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
		
		String idCursoStr = request.getParameter("id");
		int idCurso = Integer.parseInt(idCursoStr);
		
		InscricaoCurso iCurso = new InscricaoCurso();
		
		Usuario user = new Usuario();
		user.setId(userId);
		iCurso.setId_usuario(user);
		
		Curso curso = new Curso();
		curso.setId(idCurso);
		iCurso.setId_curso(curso);
		
		java.util.Date dataUtil = new java.util.Date();
		iCurso.setData_inscricao(dataUtil);
		
		InscricaoCursoDAO iCDao = new InscricaoCursoDAO();
		iCDao.salvarInscricao(iCurso);
	
		response.sendRedirect(request.getContextPath() + "/MainLogado");
	}

}
