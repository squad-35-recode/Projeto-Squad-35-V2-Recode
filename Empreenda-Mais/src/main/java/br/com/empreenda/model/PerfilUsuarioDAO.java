package br.com.empreenda.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PerfilUsuarioDAO {
	public void cadastroInicialPerfil(int idUsuario) {
		String sql = "INSERT INTO perfil_usuario(id_usuario)" + "VALUES (?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, idUsuario);

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
	
	public List<PerfilUsuario> getPerfilByUser(int id_usuario){
		String sql = "SELECT * FROM perfil_usuario WHERE id_usuario=?";

		List<PerfilUsuario> perfilUsuario = new ArrayList<PerfilUsuario>();

		Connection conn = null;
		PreparedStatement pstm = null;

		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id_usuario);
			rset = pstm.executeQuery();

			if (rset.next()) {
				PerfilUsuario perfil = new PerfilUsuario();

				perfil.setId(rset.getInt("id"));
				
				perfil.setTelefone1(rset.getString("telefone1"));
				if (rset.wasNull()) {
					perfil.setTelefone1("");
				}
				
				perfil.setTelefone2(rset.getString("telefone2"));
				if (rset.wasNull()) {
					perfil.setTelefone2("");
				}
				
				perfil.setEscolaridade(rset.getString("escolaridade"));
				if (rset.wasNull()) {
					perfil.setEscolaridade("");
				}
				
				perfil.setRenda(rset.getString("renda"));
				if (rset.wasNull()) {
					perfil.setRenda("");
				}
				
				perfil.setLogradouro(rset.getString("logradouro"));
				if (rset.wasNull()) {
					perfil.setLogradouro("");
				}
				
				perfil.setCep(rset.getString("cep"));
				if (rset.wasNull()) {
					perfil.setCep("");
				}
				
				perfil.setCidade(rset.getString("cidade"));
				if (rset.wasNull()) {
					perfil.setCidade("");
				}
				
				perfil.setUf(rset.getString("uf"));
				if (rset.wasNull()) {
					perfil.setUf("");
				}
				
				Date dataNasc = rset.getDate("data_nasc");
				if (dataNasc != null) {
					perfil.setData_nas(dataNasc.toLocalDate());
			    } else {
			        perfil.setData_nas(null);
			    };
			    
			    perfil.setFoto_url(rset.getString("foto_url"));
				if (rset.wasNull()) {
					perfil.setFoto_url("https://i.postimg.cc/T3G5j2KW/user-standard.png");
				}
				
				perfil.setOcupacao(rset.getString("ocupacao"));
				if (rset.wasNull()) {
					perfil.setOcupacao("");
				}
				
				perfil.setBio(rset.getString("bio"));
				if (rset.wasNull()) {
					perfil.setBio("");
				}
			    
				perfil.setInteresse1(rset.getString("interesse1"));
				if (rset.wasNull()) {
					perfil.setInteresse1("");
				}
				
				perfil.setInteresse2(rset.getString("interesse2"));
				if (rset.wasNull()) {
					perfil.setInteresse2("");
				}
				
				perfil.setInteresse3(rset.getString("interesse3"));
				if (rset.wasNull()) {
					perfil.setInteresse3("");
				}
				
				perfil.setContato1(rset.getString("contato1"));
				if (rset.wasNull()) {
					perfil.setContato1("");
				}
				
				perfil.setContato2(rset.getString("contato2"));
				if (rset.wasNull()) {
					perfil.setContato2("");
				}
				
				perfil.setContato3(rset.getString("contato3"));
				if (rset.wasNull()) {
					perfil.setContato3("");
				}
				
				perfil.setContato4(rset.getString("contato4"));
				if (rset.wasNull()) {
					perfil.setContato4("");
				}
				
				int compTel1Bd = rset.getInt("compartilhar_telefone1");
				boolean compTel1Conv = (compTel1Bd != 0);
				perfil.setCompartilhar_telefone1(compTel1Conv);
				
				int compTel2Bd = rset.getInt("compartilhar_telefone2");
				boolean compTel2Conv = (compTel2Bd != 0);
				perfil.setCompartilhar_telefone2(compTel2Conv);
				
				int compEndBd = rset.getInt("compartilhar_endereco");
				boolean compEndConv = (compEndBd != 0);
				perfil.setCompartilhar_endereco(compEndConv);

				perfilUsuario.add(perfil);
			} else {
				
				PerfilUsuario novoPerfil = new PerfilUsuario();
				Usuario usuario = new Usuario();
				usuario.setId(id_usuario);
	            novoPerfil.setIdUsuario(usuario);
	            
	            PerfilUsuarioDAO pDao = new PerfilUsuarioDAO();
	            
	            pDao.cadastroInicialPerfil(id_usuario);
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
		return perfilUsuario;
	}
	
	public void atualizarPerfil(PerfilUsuario perfilUsuario) {
		String sql = "UPDATE perfil_usuario SET bio=?, ocupacao=?, foto_url=?, telefone1=?, telefone2=?, logradouro=?, cep=?, cidade=?, uf=?, interesse1=?, interesse2=?, interesse3=?, contato1=?, contato2=?, contato3=?, contato4=?, data_nasc=?, escolaridade=?, renda=? WHERE id_usuario=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, perfilUsuario.getBio());
			pstm.setString(2, perfilUsuario.getOcupacao());
			pstm.setString(3, perfilUsuario.getFoto_url());
			pstm.setString(4, perfilUsuario.getTelefone1());
			pstm.setString(5, perfilUsuario.getTelefone2());
			pstm.setString(6, perfilUsuario.getLogradouro());
			pstm.setString(7, perfilUsuario.getCep());
			pstm.setString(8, perfilUsuario.getCidade());
			pstm.setString(9, perfilUsuario.getUf());
			pstm.setString(10, perfilUsuario.getInteresse1());
			pstm.setString(11, perfilUsuario.getInteresse2());
			pstm.setString(12, perfilUsuario.getInteresse3());
			pstm.setString(13, perfilUsuario.getContato1());
			pstm.setString(14, perfilUsuario.getContato2());
			pstm.setString(15, perfilUsuario.getContato3());
			pstm.setString(16, perfilUsuario.getContato4());
			pstm.setDate(17, Date.valueOf(perfilUsuario.getData_nas()));
			pstm.setString(18, perfilUsuario.getEscolaridade());
			pstm.setString(19, perfilUsuario.getRenda());
			
			pstm.setInt(20, perfilUsuario.getIdUsuario().getId());
			
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
	
	public void atualizarPerfilArea1(PerfilUsuario perfilUsuario) {
		String sql = "UPDATE perfil_usuario SET bio=?, ocupacao=?, foto_url=?" + "WHERE id_usuario=?";

		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, perfilUsuario.getBio());
			pstm.setString(2, perfilUsuario.getOcupacao());
			pstm.setString(3, perfilUsuario.getFoto_url());
			
			pstm.setInt(4, perfilUsuario.getIdUsuario().getId());
			
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
	
	public void atualizarPerfilArea2(PerfilUsuario perfilUsuario) {
	    String sql = "UPDATE perfil_usuario SET telefone1=?, telefone2=?, logradouro=?, cep=?, cidade=?, uf=?, compartilhar_telefone1=?,compartilhar_telefone2=?, compartilhar_endereco=? " + "WHERE id_usuario=?";

	    Connection conn = null;
	    PreparedStatement pstm = null;

	    try {
	        conn = Conexao.createConnectionToMySQL();
	        pstm = conn.prepareStatement(sql);

	        pstm.setString(1, perfilUsuario.getTelefone1());
	        pstm.setString(2, perfilUsuario.getTelefone2());
	        pstm.setString(3, perfilUsuario.getLogradouro());
	        pstm.setString(4, perfilUsuario.getCep());
	        pstm.setString(5, perfilUsuario.getCidade());
	        pstm.setString(6, perfilUsuario.getUf());
	        pstm.setBoolean(7, perfilUsuario.isCompartilhar_telefone1());
	        pstm.setBoolean(8, perfilUsuario.isCompartilhar_telefone2());
	        pstm.setBoolean(9, perfilUsuario.isCompartilhar_endereco());

	        pstm.setInt(10, perfilUsuario.getIdUsuario().getId());

	        pstm.execute();
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {    
	        try {
	            if(conn != null) {
	                conn.close();
	            }
	            if(pstm != null) {
	                pstm.close();
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	}


	public void atualizarPerfilArea3(PerfilUsuario perfilUsuario) {
		String sql = "UPDATE perfil_usuario SET interesse1=?, interesse2=?, interesse3=?" + "WHERE id_usuario=?";

		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, perfilUsuario.getInteresse1());
			pstm.setString(2, perfilUsuario.getInteresse2());
			pstm.setString(3, perfilUsuario.getInteresse3());
			
			pstm.setInt(4, perfilUsuario.getIdUsuario().getId());
			
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
	
	public void atualizarPerfilArea4(PerfilUsuario perfilUsuario) {
		String sql = "UPDATE perfil_usuario SET contato1=?, contato2=?, contato3=?, contato4=? WHERE id_usuario=?";

		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, perfilUsuario.getContato1());
			pstm.setString(2, perfilUsuario.getContato2());
			pstm.setString(3, perfilUsuario.getContato3());
			pstm.setString(4, perfilUsuario.getContato4());
			
			pstm.setInt(5, perfilUsuario.getIdUsuario().getId());
			
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
	
	public void atualizarPerfilArea5(PerfilUsuario perfilUsuario) {
		String sql = "UPDATE perfil_usuario SET data_nasc=?, escolaridade=?, renda=? WHERE id_usuario=?";

		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setDate(1, Date.valueOf(perfilUsuario.getData_nas()));
			pstm.setString(2, perfilUsuario.getEscolaridade());
			pstm.setString(3, perfilUsuario.getRenda());
			
			pstm.setInt(4, perfilUsuario.getIdUsuario().getId());
			
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
	
	public void deletarPorIdUsuario(int id) {
		String sql = "DELETE FROM perfil_usuario WHERE idUsuario=?";
		
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
	
	public int obterIdPerfilPorIdUsuario(int idUsuario) {
	    String sql = "SELECT id FROM perfil_usuario WHERE id_usuario = ?";
	    
	    Connection conn = null;
	    PreparedStatement pstm = null;
	    ResultSet rset = null;
	    int idPerfil = 0;
	    
	    try {
	        conn = Conexao.createConnectionToMySQL();
	        pstm = conn.prepareStatement(sql);
	        pstm.setInt(1, idUsuario);
	        
	        rset = pstm.executeQuery(); 
	        
	        if (rset.next()) {
	            idPerfil = rset.getInt("id"); 
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
	    
	    return idPerfil; 
	}

	
	
	
}
