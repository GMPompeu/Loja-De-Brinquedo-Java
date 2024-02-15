<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
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
<title>Administração</title>
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
					<a href="SistemaBrinquedo?cmd=listar">Home</a> <a
						href="AcessoUsuario?user=listUser">Usuários</a> <a href="jsp/equipe.jsp">Sobre
						a Equipe</a>
					<%
					} else {
					%>
					<a href="#">Sobre a Equipe</a>
					<%
					}
					%>
				</div>
			</div>
	</nav>

	<h2>Lista de Brinquedos</h2>
	<a href="jsp/incluir.jsp">Cadastrar Brinquedo</a>
	<hr>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Foto do Produto</th>
					<th>Nome</th>
					<th>Categoria</th>
					<th>Marca</th>
					<th>Valor</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Brinquedo> lista = new ArrayList<Brinquedo>();
				int count = 0;
				lista = (ArrayList) request.getAttribute("listaBrinquedo");
				for (Brinquedo a : lista) {
				%>
				<tr>
					<td><%=a.getCod_produto()%></td>
					<td><img src=<%="lojaBrinquedos/" + a.getImagem()%>
						alt="Produto"></td>
					<td><%=a.getNome()%></td>
					<td><%=a.getCategoria()%></td>
					<td><%=a.getMarca()%></td>
					<td><%=a.getPreco()%></td>
					<td><form action="SistemaBrinquedo?cmd=editar" method="post"
							style="display: inline;">
							<button class="btn btn-info" type="submit" name="txtId"
								value="<%=a.getCod_produto()%>">
								<i class="bi bi-pencil-square"></i> Editar
							</button>
						</form>

						<form action="SistemaBrinquedo?cmd=excluir" method="post"
							style="display: inline;">
							<button type="button" class="btn btn-danger"
								data-bs-toggle="modal"
								data-bs-target="#exampleModal<%=a.getCod_produto()%>">
								<i class="bi bi-trash3"></i> Excluir
							</button>
							<div class="modal fade" id="exampleModal<%=a.getCod_produto()%>"
								tabindex="-1"
								aria-labelledby="exampleModalLabel<%=a.getCod_produto()%>"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5"
												id="exampleModalLabel<%=a.getCod_produto()%>">
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
												value="<%=a.getCod_produto()%>">
												<i class="bi bi-trash3"></i> Excluir
											</button>
										</div>
									</div>
								</div>
							</div>
						</form></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>

<style>
/* Adicione isso ao seu estilo CSS existente */
.container {
	text-align: center;
}

table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

img {
	max-width: 50px;
	max-height: 50px;
}

.btn {
	padding: 5px 10px;
	margin-right: 5px;
	cursor: pointer;
}

.btn-info {
	background-color: #5bc0de;
	color: #fff;
}

.btn-danger {
	background-color: #d9534f;
	color: #fff;
}
</style>