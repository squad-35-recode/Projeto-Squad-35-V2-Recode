package br.com.empreenda.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InscricaoCursoDAO {
	public void salvarInscricao(InscricaoCurso inscricao) {
		String sql = "INSERT INTO inscricao_curso(id_usuario, id_curso, data_inscricao)" + "VALUES (?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, inscricao.getId_usuario().getId());
			pstm.setInt(2, inscricao.getId_curso().getId());
			java.util.Date dataUtil = inscricao.getData_inscricao();
			java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
			pstm.setDate(3, dataSql);

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
	
	public List<InscricaoCurso> buscarInscricaoByIdUsuario(int id) {
        List<InscricaoCurso> inscricoes = new ArrayList<>();
        String sql = "SELECT ic.*, u.nome, u.email, c.id, c.titulo, c.descricao, c.categoria, c.media_url, c.foto_capa, c.id_colaborador FROM inscricao_curso ic INNER JOIN usuario u on ic.id_usuario = u.id INNER JOIN curso c on ic.id_curso = c.id WHERE u.id=? ORDER BY ic.id DESC";
        
        
        Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
        
        try {
        	conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();
        	while (rset.next()) {
        		InscricaoCurso iC = new InscricaoCurso();
        		
        		//Dados Inscrição
        		iC.setId(rset.getInt("id"));
        		iC.setData_inscricao(rset.getDate("data_inscricao"));
        		
        		int idCurso = rset.getInt("c.id");
        		Curso c = new Curso();
        		c.setId(idCurso);
        		iC.setId_curso(c);
        		
        		iC.setNomeUsuario(rset.getString("u.nome"));
        		iC.setEmailUsuario(rset.getString("u.email"));
        		
        		iC.setTitulo(rset.getString("c.titulo"));
        		iC.setDescricao(rset.getString("c.descricao"));
        		iC.setMedia_url(rset.getString("c.media_url"));
        		iC.setCategoria(rset.getString("c.categoria"));
        		iC.setFoto_capa(rset.getString("c.foto_capa"));
        		
        		int uCol = rset.getInt("c.id_colaborador");
        		Usuario uC = new Usuario();
        		uC.setId(uCol);
        		iC.setId_colaborador(uC);
        		
        		inscricoes.add(iC);
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
        return inscricoes;
    }
	
	
	public List<InscricaoCurso> buscarInscricaoByIdColab(int id) {
        List<InscricaoCurso> inscricoes = new ArrayList<>();
        String sql = "SELECT ic.*, u.id ,u.nome, u.email, c.id, c.titulo, c.descricao, c.categoria, c.media_url, c.foto_capa, c.id_colaborador FROM inscricao_curso ic INNER JOIN usuario u on ic.id_usuario = u.id INNER JOIN curso c on ic.id_curso = c.id WHERE c.id_colaborador=? ORDER BY ic.id DESC";
        
        
        Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
        
        try {
        	conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();
        	while (rset.next()) {
        		InscricaoCurso iC = new InscricaoCurso();
        		
        		//Dados Inscrição
        		iC.setId(rset.getInt("id"));
        		iC.setData_inscricao(rset.getDate("data_inscricao"));
        		
        		int idCurso = rset.getInt("c.id");
        		Curso c = new Curso();
        		c.setId(idCurso);
        		iC.setId_curso(c);
        		
        		iC.setNomeUsuario(rset.getString("u.nome"));
        		iC.setEmailUsuario(rset.getString("u.email"));
        		
        		iC.setTitulo(rset.getString("c.titulo"));
        		iC.setDescricao(rset.getString("c.descricao"));
        		iC.setMedia_url(rset.getString("c.media_url"));
        		iC.setCategoria(rset.getString("c.categoria"));
        		iC.setFoto_capa(rset.getString("c.foto_capa"));
        		
        		int userId = rset.getInt("id_usuario");
        		Usuario user = new Usuario();
        		user.setId(userId);
        		iC.setId_usuario(user);
        		
        		int uCol = rset.getInt("c.id_colaborador");
        		Usuario uC = new Usuario();
        		uC.setId(uCol);
        		iC.setId_colaborador(uC);
        		
        		inscricoes.add(iC);
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
        return inscricoes;
    }
	
	public List<InscricaoCurso> buscarInscricaoById(int id) {
        List<InscricaoCurso> inscricoes = new ArrayList<>();
        String sql = "SELECT ic.*, u.id ,u.nome, u.email, c.id, c.titulo, c.descricao, c.categoria, c.media_url, c.foto_capa, c.id_colaborador FROM inscricao_curso ic INNER JOIN usuario u on ic.id_usuario = u.id INNER JOIN curso c on ic.id_curso = c.id WHERE ic.id=?";
        
        
        Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
        
        try {
        	conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();
        	while (rset.next()) {
        		InscricaoCurso iC = new InscricaoCurso();
        		
        		//Dados Inscrição
        		iC.setId(rset.getInt("id"));
        		iC.setData_inscricao(rset.getDate("data_inscricao"));
        		
        		int idCurso = rset.getInt("c.id");
        		Curso c = new Curso();
        		c.setId(idCurso);
        		iC.setId_curso(c);
        		
        		iC.setNomeUsuario(rset.getString("u.nome"));
        		iC.setEmailUsuario(rset.getString("u.email"));
        		
        		iC.setTitulo(rset.getString("c.titulo"));
        		iC.setDescricao(rset.getString("c.descricao"));
        		iC.setMedia_url(rset.getString("c.media_url"));
        		iC.setCategoria(rset.getString("c.categoria"));
        		iC.setFoto_capa(rset.getString("c.foto_capa"));
        		
        		int userId = rset.getInt("id_usuario");
        		Usuario user = new Usuario();
        		user.setId(userId);
        		iC.setId_usuario(user);
        		
        		int uCol = rset.getInt("c.id_colaborador");
        		Usuario uC = new Usuario();
        		uC.setId(uCol);
        		iC.setId_colaborador(uC);
        		
        		inscricoes.add(iC);
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
        return inscricoes;
    }
	
	
	public void deletarPorId(int id) {
		String sql = "DELETE FROM inscricao_curso WHERE id=?";
		
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
