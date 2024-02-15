package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;
import util.ConnectorFactory;



public class UsuarioDao {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private Usuario usuario;
	
	public UsuarioDao() throws Exception{
		try {
			this.conn = ConnectorFactory.getConnection();
		}catch(Exception e) {
			throw new Exception("Not conn" +e.getMessage());
		}
	}
	
	public void inserir(Usuario usuario) throws Exception{
		try {
			String sql = "INSERT INTO usuarios (login, username, senha)"
					+ "VALUES (?,?,?) ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getUsername());
			stmt.setString(3, usuario.getSenha());
			
			stmt.executeUpdate();
		}catch(SQLException sqle) {
			throw new Exception("Not insert to Database" + sqle);		
		} finally {
			ConnectorFactory.closeConnection(conn, stmt);
		}
	}
	
	public List<Usuario> usuarios() throws Exception{
		try {
			stmt = conn.prepareStatement("SELECT * FROM usuarios");
			rs = stmt.executeQuery();
			List<Usuario> list = new ArrayList<Usuario>();
			while(rs.next()) {
				int cod_usuario = rs.getInt("cod_usuario");
				String login = rs.getString("login");
				String username = rs.getString("username");
				String senha = rs.getString("senha");
				
				list.add(new Usuario(cod_usuario, login, username, senha));
			}
			return list;
		}catch (Exception sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectorFactory.closeConnection(conn, stmt, rs);
		}
	}
	
	public void excluir(Usuario usuario) throws Exception{
		try {
			String sql = "DELETE FROM usuarios WHERE cod_usuario = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, usuario.getCod_usuario());
			stmt.executeUpdate();
			
		}catch(SQLException sqle) {
			System.out.println("Não foi possivel deletar" + sqle);
		}finally {
			ConnectorFactory.closeConnection(conn, stmt);
		}
	}
	
	public Usuario buscarUsuario(int Cod_usuario) throws Exception{
		try {
			String sql = "SELECT * FROM usuarios WHERE cod_usuario = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Cod_usuario);
			rs = stmt.executeQuery();
			if(rs.next()) {
				int cod_usuario = rs.getInt("cod_usuario");
				String nome = rs.getString("login");
				String username = rs.getString("username");
				String senha = rs.getString("senha");
				
				usuario = new Usuario(cod_usuario, nome, username, senha);
			}
			return usuario;
			
		}catch(SQLException sqle) {
			throw new Exception(sqle);
		}finally {
			ConnectorFactory.closeConnection(conn, stmt);
		}
	}
	
	public void atualizar(Usuario usuario ) throws Exception{
		try {
			String sql = "UPDATE usuarios SET login=?, username=?, senha=? WHERE cod_usuario=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, usuario.getLogin());
			stmt.setString(2, usuario.getUsername());
			stmt.setString(3, usuario.getSenha());
			stmt.setInt(4, usuario.getCod_usuario());
			stmt.executeUpdate();			
		}catch(SQLException sqle) {
			throw new Exception("Not update to database" + sqle);
		}finally {
			ConnectorFactory.closeConnection(conn, stmt);
		}
	}
	
	public Usuario login(String Login) throws Exception{
		try {
			String sql = "SELECT * FROM usuarios WHERE login = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,Login);
			rs = stmt.executeQuery();
			if(rs.next()) {
				int cod_usuario = rs.getInt("cod_usuario");
				String nome = rs.getString("login");
				String username = rs.getString("username");
				String senha = rs.getString("senha");
				
				usuario = new Usuario(cod_usuario, nome, username, senha);
			}
			return usuario;
			
		}catch(SQLException sqle) {
			throw new Exception(sqle);
		}finally {
			ConnectorFactory.closeConnection(conn, stmt);
		}
	}
}
