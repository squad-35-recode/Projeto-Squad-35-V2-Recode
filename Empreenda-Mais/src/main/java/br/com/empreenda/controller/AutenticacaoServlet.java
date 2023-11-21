package br.com.empreenda.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.empreenda.model.Conexao;

@WebServlet("/Autenticacao")
public class AutenticacaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AutenticacaoServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			try {
				conn = Conexao.createConnectionToMySQL();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			pstm.setString(2, senha);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				int clienteID = rset.getInt("id");
				String nomeCliente = rset.getString("nome");
				String tipoUsuario = rset.getString("tipo_usuario");
				
				HttpSession session = request.getSession();
				session.setAttribute("userId", clienteID);
			    session.setAttribute("nomeCliente", nomeCliente);
			    session.setAttribute("email", email);
			    session.setAttribute("tipo_usuario", tipoUsuario);
			    response.sendRedirect(request.getContextPath() + "/MainLogado");
			} else {
				response.sendRedirect("login.html?error=true");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm!=null) {
					pstm.close();
				}
				if (conn!=null) {
					conn.close();
				}
				if (rset!=null) {
					rset.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
