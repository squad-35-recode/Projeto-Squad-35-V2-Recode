package br.com.empreenda.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDAO {

	public void salvarUsuario(Usuario usuario) {
		String sql = "INSERT INTO usuario(nome, email, senha, tipo_usuario)" + "VALUES (?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, usuario.getNome());
			pstm.setString(2, usuario.getEmail());
			pstm.setString(3, usuario.getSenha());
			pstm.setString(4, usuario.getTipo_usuario());

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

	public List<Usuario> getUsuarios() {
		String sql = "SELECT * FROM usuario";

		List<Usuario> usuarios = new ArrayList<Usuario>();

		// Conexão com o BD
		Connection conn = null;
		PreparedStatement pstm = null;

		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			// Enquanto o rset tiver dados para percorrer
			while (rset.next()) {
				Usuario usuario = new Usuario();

				// Recuperação dos dados separadamente
				usuario.setId(rset.getInt("id"));
				usuario.setNome(rset.getString("nome"));
				usuario.setEmail(rset.getString("email"));
				usuario.setTipo_usuario(rset.getString("tipo_usuario"));
				usuario.setSenha(rset.getString("senha"));

				usuarios.add(usuario);
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
		return usuarios;
	}

	public void atualizarNomePorIdUser(Usuario usuario) {
		String sql = "UPDATE usuario SET nome=?, compartilhar_email=? WHERE id=?";
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, usuario.getNome());
			pstm.setBoolean(2, usuario.isCompartilhar_email());
			pstm.setInt(3, usuario.getId());

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

	public void atualizarPorIdAdmin(Usuario usuario) {
		String sql = "UPDATE usuario SET nome=?, senha=?, tipo_usuario=? WHERE id=?";
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			// Conexão com o BD
			conn = Conexao.createConnectionToMySQL();
			// Preparação da query
			pstm = conn.prepareStatement(sql);

			// Adicionar os valores a atualizar
			pstm.setString(1, usuario.getNome());
			pstm.setString(2, usuario.getSenha());
			pstm.setString(3, usuario.getTipo_usuario());

			pstm.setInt(4, usuario.getId());

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
	
	public void deletarPorId(int id) {
		String sql = "DELETE FROM usuario WHERE id=?";
		
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
	
	public List<Usuario> getUsuariosById(int id) {
		String sql = "SELECT * FROM usuario WHERE id=?";

		List<Usuario> usuarios = new ArrayList<Usuario>();

		Connection conn = null;
		PreparedStatement pstm = null;

		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();

			// Enquanto o rset tiver dados para percorrer
			while (rset.next()) {
				Usuario usuario = new Usuario();

				// Recuperação dos dados separadamente
				usuario.setId(rset.getInt("id"));
				usuario.setNome(rset.getString("nome"));
				usuario.setEmail(rset.getString("email"));
				usuario.setTipo_usuario(rset.getString("tipo_usuario"));
				usuario.setSenha(rset.getString("senha"));
				int valorBD = rset.getInt("compartilhar_email");
				boolean valorConvertido = (valorBD != 0);
				usuario.setCompartilhar_email(valorConvertido);

				usuarios.add(usuario);
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
		return usuarios;
	}
	
	
	public void atualizarSenha(Usuario usuario) {
		String sql = "UPDATE usuario SET senha=? WHERE id=?";
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, usuario.getSenha());

			pstm.setInt(2, usuario.getId());

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
