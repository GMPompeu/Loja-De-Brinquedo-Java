package model;

public class Usuario {
	
	private int cod_usuario;
	
	private String login;
	private String username;
	private String senha;
	
	public Usuario(int cod_usuario, String login, String username, String senha) {
		super();
		this.cod_usuario = cod_usuario;
		this.login = login;
		this.username = username;
		this.senha = senha;
	}
	
	public Usuario() {
		// TODO Auto-generated constructor stub
	}

	public int getCod_usuario() {
		return cod_usuario;
	}
	public void setCod_usuario(int cod_usuario) {
		this.cod_usuario = cod_usuario;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}

	
	
}
