package br.com.empreenda.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CursoDAO {

	public void criarCurso(Curso curso) {
		String sql = "INSERT INTO curso(titulo, descricao, data_criacao, categoria, media_url, foto_capa, id_colaborador)"
				+ "VALUES (?,?,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, curso.getTitulo());
			pstm.setString(2, curso.getDescricao());
			
			java.util.Date dataUtil = curso.getData_criacao();
			java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
			pstm.setDate(3, dataSql);
			
			pstm.setString(4, curso.getCategoria());
			pstm.setString(5, curso.getMedia_url());
			pstm.setString(6, curso.getFoto_capa());
			pstm.setInt(7, curso.getId_colaborador().getId());

			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<Curso> getCursos() {
		String sql = "SELECT * FROM curso";

		List<Curso> cursos = new ArrayList<Curso>();

		Connection conn = null;
		PreparedStatement pstm = null;

		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			while (rset.next()) {
				Curso curso = new Curso();

				curso.setId(rset.getInt("id"));
				curso.setTitulo(rset.getString("titulo"));
				curso.setDescricao(rset.getString("descricao"));
				curso.setData_criacao(rset.getDate("data_criacao"));
				curso.setCategoria(rset.getString("categoria"));
				curso.setMedia_url(rset.getString("media_url"));
				curso.setFoto_capa(rset.getString("foto_capa"));

				int idColab = rset.getInt("id_colaborador");
				Usuario u = new Usuario();
				u.setId(idColab);
				curso.setId_colaborador(u);

				cursos.add(curso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cursos;
	}
	
	public List<Curso> getCursosByIdColab(int id) {
		String sql = "SELECT * FROM curso WHERE id_colaborador=?";

		List<Curso> cursos = new ArrayList<Curso>();

		Connection conn = null;
		PreparedStatement pstm = null;

		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();

			while (rset.next()) {
				Curso curso = new Curso();

				curso.setId(rset.getInt("id"));
				curso.setTitulo(rset.getString("titulo"));
				curso.setDescricao(rset.getString("descricao"));
				curso.setData_criacao(rset.getDate("data_criacao"));
				curso.setCategoria(rset.getString("categoria"));
				curso.setMedia_url(rset.getString("media_url"));
				curso.setFoto_capa(rset.getString("foto_capa"));

				int idColab = rset.getInt("id_colaborador");
				Usuario u = new Usuario();
				u.setId(idColab);
				curso.setId_colaborador(u);

				cursos.add(curso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cursos;
	}
	
	public List<Curso> getCursosById(int id) {
		String sql = "SELECT c.*, u.nome FROM curso c INNER JOIN usuario u on c.id_colaborador = u.id WHERE c.id = ?";

		List<Curso> cursos = new ArrayList<Curso>();

		Connection conn = null;
		PreparedStatement pstm = null;

		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();

			while (rset.next()) {
				Curso curso = new Curso();

				curso.setId(rset.getInt("id"));
				curso.setTitulo(rset.getString("titulo"));
				curso.setDescricao(rset.getString("descricao"));
				curso.setData_criacao(rset.getDate("data_criacao"));
				curso.setCategoria(rset.getString("categoria"));
				curso.setMedia_url(rset.getString("media_url"));
				curso.setFoto_capa(rset.getString("foto_capa"));

				int idColab = rset.getInt("id_colaborador");
				Usuario u = new Usuario();
				u.setId(idColab);
				curso.setId_colaborador(u);
				curso.setNome_colab(rset.getString("u.nome"));

				cursos.add(curso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cursos;
	}
	
	public void atualizarCurso(Curso curso) {
		String sql = "UPDATE curso SET titulo=?, categoria=?, descricao=?, foto_capa=?, media_url=? WHERE id=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, curso.getTitulo());
			pstm.setString(2, curso.getCategoria());
			pstm.setString(3, curso.getDescricao());
			pstm.setString(4, curso.getFoto_capa());
			pstm.setString(5, curso.getMedia_url());
			
			pstm.setInt(6, curso.getId());
			
			pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				if(conn!=null) {
					conn.close();
				}
				if(pstm!=null) {
					pstm.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void deletarPorId(int id) {
		String sql = "DELETE FROM curso WHERE id=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, id);
			
			pstm.execute();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(pstm!=null) {
					pstm.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
