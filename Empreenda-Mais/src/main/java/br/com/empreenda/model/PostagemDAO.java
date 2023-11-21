package br.com.empreenda.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PostagemDAO {
	public void salvarPostagem(Postagem postagem) {
		String sql = "INSERT INTO postagem(titulo, corpo, media_url, categoria, data_postagem, perfil_id)"
				+ "VALUES (?,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, postagem.getTitulo());
			pstm.setString(2, postagem.getCorpo());

			pstm.setString(3, postagem.getMedia_url());
			pstm.setString(4, postagem.getCategoria());
			java.util.Date dataUtil = postagem.getData_postagem();
			java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
			pstm.setDate(5, dataSql);
			pstm.setInt(6, postagem.getPerfil_id().getId());

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


	public List<Postagem> getPostagens() {
		String sql = "SELECT * FROM postagem ORDER BY id DESC";

		List<Postagem> postagens = new ArrayList<Postagem>();

		Connection conn = null;
		PreparedStatement pstm = null;

		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			while (rset.next()) {
				Postagem postagem = new Postagem();

				postagem.setId(rset.getInt("id"));
				postagem.setTitulo(rset.getString("titulo"));
				postagem.setCorpo(rset.getString("corpo"));
				postagem.setMedia_url(rset.getString("media_url"));
				postagem.setCategoria(rset.getString("categoria"));
				postagem.setData_postagem(rset.getDate("data_postagem"));

				int idPerfil = rset.getInt("perfil_id");
				PerfilUsuario pf = new PerfilUsuario();
				pf.setId(idPerfil);
				postagem.setPerfil_id(pf);

				postagens.add(postagem);
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
		return postagens;
	}

	public List<Postagem> getPostagensByIdUsuario(int id) {
		String sql = "SELECT * FROM postagem WHERE perfil_id=?";

		List<Postagem> postagens = new ArrayList<Postagem>();

		Connection conn = null;
		PreparedStatement pstm = null;

		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			while (rset.next()) {
				Postagem postagem = new Postagem();

				postagem.setId(rset.getInt("id"));
				postagem.setTitulo(rset.getString("titulo"));
				postagem.setCorpo(rset.getString("corpo"));
				postagem.setMedia_url(rset.getString("media_url"));
				postagem.setCategoria(rset.getString("categoria"));
				postagem.setData_postagem(rset.getDate("data_postagem"));

				int idPerfil = rset.getInt("perfil_id");
				PerfilUsuario pf = new PerfilUsuario();
				pf.setId(idPerfil);
				postagem.setPerfil_id(pf);

				postagens.add(postagem);
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
		return postagens;
	}
	
	
	public List<Postagem> buscarDadosRelacionados() {
        List<Postagem> postagens = new ArrayList<>();
        String sql =    "SELECT p.*, pu.foto_url, u.nome, u.id FROM postagem p INNER JOIN perfil_usuario pu ON p.perfil_id = pu.id INNER JOIN usuario u ON pu.id_usuario = u.id ORDER BY p.id DESC";
        
        
        Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
        
        try {
        	conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
        	while (rset.next()) {
        		Postagem postagem = new Postagem();
        		
        		//Dados postagem
        		postagem.setId(rset.getInt("id"));
        		postagem.setTitulo(rset.getString("titulo"));
        		postagem.setCorpo(rset.getString("corpo"));
        		postagem.setMedia_url(rset.getString("media_url"));
				postagem.setCategoria(rset.getString("categoria"));
				postagem.setData_postagem(rset.getDate("data_postagem"));
				postagem.setDenuncia(rset.getInt("denuncia"));
				int idPerfil = rset.getInt("perfil_id");
				PerfilUsuario pf = new PerfilUsuario();
				pf.setId(idPerfil);
				postagem.setPerfil_id(pf);
				
				//Dados Perfil
        		postagem.setFoto_perfil(rset.getString("pu.foto_url"));
        		
        		//Dados Usuario
        		postagem.setNome_usuario(rset.getString("u.nome"));
        		int idUsuario = rset.getInt("u.id");
        		Usuario u = new Usuario();
        		u.setId(idUsuario);
        		postagem.setUsuario_id(u);
                
                postagens.add(postagem);
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
        return postagens;
    }
	
	public List<Postagem> buscarDadosRelacionadosByIdPerfil(int id) {
        List<Postagem> postagens = new ArrayList<>();
        String sql =    "SELECT p.*, pu.foto_url, u.nome, u.id FROM postagem p INNER JOIN perfil_usuario pu ON p.perfil_id = pu.id INNER JOIN usuario u ON pu.id_usuario = u.id WHERE u.id=? ORDER BY p.id DESC";
        
        
        Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
        
        try {
        	conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();
        	while (rset.next()) {
        		Postagem postagem = new Postagem();
        		
        		//Dados postagem
        		postagem.setId(rset.getInt("id"));
        		postagem.setTitulo(rset.getString("titulo"));
        		postagem.setCorpo(rset.getString("corpo"));
        		postagem.setMedia_url(rset.getString("media_url"));
				postagem.setCategoria(rset.getString("categoria"));
				postagem.setData_postagem(rset.getDate("data_postagem"));
				int idPerfil = rset.getInt("perfil_id");
				PerfilUsuario pf = new PerfilUsuario();
				pf.setId(idPerfil);
				postagem.setPerfil_id(pf);
				
				//Dados Perfil
        		postagem.setFoto_perfil(rset.getString("pu.foto_url"));
        		
        		//Dados Usuario
        		postagem.setNome_usuario(rset.getString("u.nome"));
        		int idUsuario = rset.getInt("u.id");
        		Usuario u = new Usuario();
        		u.setId(idUsuario);
        		postagem.setUsuario_id(u);
                
                postagens.add(postagem);
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
        return postagens;
    }
	
	public List<Postagem> buscarDadosRelacionadosByIdPostagem(int id) {
        List<Postagem> postagens = new ArrayList<>();
        String sql =    "SELECT p.*, pu.foto_url, u.nome, u.id FROM postagem p INNER JOIN perfil_usuario pu ON p.perfil_id = pu.id INNER JOIN usuario u ON pu.id_usuario = u.id WHERE p.id=?";
        
        
        Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
        
        try {
        	conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();
        	while (rset.next()) {
        		Postagem postagem = new Postagem();
        		
        		//Dados postagem
        		postagem.setId(rset.getInt("id"));
        		postagem.setTitulo(rset.getString("titulo"));
        		postagem.setCorpo(rset.getString("corpo"));
        		postagem.setMedia_url(rset.getString("media_url"));
				postagem.setCategoria(rset.getString("categoria"));
				postagem.setData_postagem(rset.getDate("data_postagem"));
				int idPerfil = rset.getInt("perfil_id");
				PerfilUsuario pf = new PerfilUsuario();
				pf.setId(idPerfil);
				postagem.setPerfil_id(pf);
				
				//Dados Perfil
        		postagem.setFoto_perfil(rset.getString("pu.foto_url"));
        		
        		//Dados Usuario
        		postagem.setNome_usuario(rset.getString("u.nome"));
        		int idUsuario = rset.getInt("u.id");
        		Usuario u = new Usuario();
        		u.setId(idUsuario);
        		postagem.setUsuario_id(u);
        		
                postagens.add(postagem);
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
        return postagens;
    }
	
	public void deletarPostagemPorId(int id) {
		String sql = "DELETE FROM postagem WHERE id=?";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, id);

			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstm != null) {
					pstm.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
	
	public void denunciarPostagem(Postagem postagem) {
		String sql = "UPDATE postagem SET denuncia=? WHERE id=?";
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, postagem.getDenuncia());

			pstm.setInt(2, postagem.getId());

			pstm.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstm != null) {
					pstm.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
}
