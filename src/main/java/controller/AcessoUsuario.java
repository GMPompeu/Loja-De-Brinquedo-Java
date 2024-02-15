package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDao;
import model.Usuario;

@WebServlet("/AcessoUsuario")
public class AcessoUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		UsuarioDao dao;
		Usuario usuario = new Usuario();
		String user = request.getParameter("user");
		
		try {
			if(user.equals("cadusuario") || user.equals("alterar")) {
				usuario.setLogin(request.getParameter("login"));
				usuario.setUsername(request.getParameter("username"));
				usuario.setSenha(request.getParameter("senha"));
			}
			
			usuario.setCod_usuario(Integer.parseInt(request.getParameter("txtId")));
			
		}catch(Exception e) {
			System.out.println("Erro" + e);
		}
		try {
			RequestDispatcher rd = null;
			dao = new UsuarioDao();
			
			if (user.equalsIgnoreCase("cadusuario")) {
				dao.inserir(usuario);
				rd = request.getRequestDispatcher("AcessoUsuario?user=listUser");
				
			}else if (user.equalsIgnoreCase("listUser")) {
				List<Usuario> listUsuarios = dao.usuarios();
				request.setAttribute("listUsuario", listUsuarios);
				rd = request.getRequestDispatcher("jsp/usuarios.jsp");
				
			} else if (user.equalsIgnoreCase("exc")) {
				dao.excluir(usuario);
				rd = request.getRequestDispatcher("AcessoUsuario?user=listUser");
				
			} else if (user.equalsIgnoreCase("altuser")) {
				usuario = dao.buscarUsuario(usuario.getCod_usuario());
				HttpSession session = request.getSession(true);
				session.setAttribute("usuario", usuario);
				rd = request.getRequestDispatcher("jsp/alterarUsuario.jsp");
				
			} else if (user.equalsIgnoreCase("alterar")) {
				dao.atualizar(usuario);
				rd = request.getRequestDispatcher("AcessoUsuario?user=listUser");
			}
			
			rd.forward(request, response);
			
			
		}catch (Exception e) {
			   e.printStackTrace();
				throw new ServletException(e);
		   }
		
		
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		process(request, response);
	}

}
