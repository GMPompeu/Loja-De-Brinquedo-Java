<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="ISO-8859-1">
<title>Usuários</title>
</head>
<body>
	<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 15px;
	text-align: center;
}

nav {
	background-color: #eee;
	padding: 10px;
	text-align: center;
}

.dropdown {
	display: inline-block;
	margin-right: 20px;
}

.dropdown button {
	background-color: #ddd;
	color: #333;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #fff;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 1;
	min-width: 160px;
	text-align: left;
	border-radius: 4px;
	margin-top: 1px;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content a {
	color: #333;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	border-bottom: 1px solid #ddd;
}

.dropdown-content a:last-child {
	border-bottom: none;
}

.card {
	border: 1px solid #ddd;
	border-radius: 8px;
	margin: 10px;
	padding: 15px;
	width: 200px;
	float: left;
}

.card img {
	width: 100%;
	border-radius: 8px;
}

.card-title {
	font-size: 18px;
	margin-bottom: 10px;
}

.card-text {
	color: #555;
}
</style>
</head>

<body>

	<header>
		<h1>Ri Help</h1><a href="SistemaBrinquedo?cmd=sair">Sair</a>
	</header>

	<nav>
		<div class="dropdown">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="conteudoDropdown" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Conteúdo</button>
				<div class="dropdown-content">
					<%
					if (session.getAttribute("username") != null) {
					%>
					<a href="SistemaBrinquedo?cmd=adiministracao">Administração</a> <a
						href="SistemaBrinquedo?cmd=listar">Home</a> 
						<a href="jsp/equipe.jsp">Sobre
						a Equipe</a>
					<%
					} else {
					%>
					<a href="jsp/equipe.jsp">Sobre a Equipe</a>
					<%
					}
					%>
				</div>
			</div>
	</nav>

	<h2>Lista de Usuários</h2>
	<a href="jsp/cadastrar.jsp">Cadastrar Usuário</a>
	<hr>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Login</th>
					<th width="200">Nome</th>
					<th width="300">Ações</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Usuario> lista = new ArrayList<Usuario>();
				lista = (ArrayList) request.getAttribute("listUsuario");
				for (Usuario a : lista) {
				%>
			
			<tbody>
				<tr>
					<th><%=a.getCod_usuario()%></th>
					<td><%=a.getLogin()%></td>
					<td><%=a.getUsername()%></td>
					<td><form action="AcessoUsuario?user=altuser" method="post"
							style="display: inline;">
							<button class="btn btn-primary editar-btn" type="submit"
								name="txtId" value="<%=a.getCod_usuario()%>">
								<i class="bi bi-pencil-square"></i> Editar
							</button>
						</form>
						<form action="AcessoUsuario?user=exc" method="post"
							style="display: inline;">
							<button type="button" class="btn btn-danger"
								data-bs-toggle="modal"
								data-bs-target="#exampleModal<%=a.getCod_usuario()%>">
								<i class="bi bi-trash3"></i> Excluir
							</button>
							<div class="modal fade" id="exampleModal<%=a.getCod_usuario()%>"
								tabindex="-1"
								aria-labelledby="exampleModalLabel<%=a.getCod_usuario()%>"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5"
												id="exampleModalLabel<%=a.getCod_usuario()%>">
												Confirmar Exclusão</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Tem certeza de que deseja
											excluir este item?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button class="btn btn-danger" type="submit" name="txtId"
												value="<%=a.getCod_usuario()%>">
												<i class="bi bi-trash3"></i> Excluir
											</button>
										</div>
									</div>
								</div>
							</div>
						</form></td>
				</tr>
			</tbody>
			<%
			}
			%>

		</table>
	</div>
	<br>
	</main>
	</div>
	</div>