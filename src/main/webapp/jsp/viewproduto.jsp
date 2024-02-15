<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualizar Produto</title>
<jsp:useBean id="brinquedo" scope="session" class="model.Brinquedo" />
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

.container {
	margin: 20px auto;
	max-width: 800px; /* Defina a largura máxima desejada */
}

.card {
	border: 1px solid #ddd;
	border-radius: 8px;
	margin: 10px;
	padding: 15px;
}

.card img {
	width: 100%;
	border-radius: 8px;
}

.card-title {
	font-size: 24px;
	margin-bottom: 10px;
}

.card-text {
	color: #555;
	margin-bottom: 10px;
}
</style>
</head>

<body>

	<header>
		<h1>Ri Help</h1>
	</header>

	<nav>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="conteudoDropdown" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Conteúdo</button>
			<div class="dropdown-content">
				<%
				if (session.getAttribute("username") != null) {
				%>
				<a href="SistemaBrinquedo?cmd=adiministracao">Administração</a> <a
					href="SistemaBrinquedo?cmd=listar">Home</a> <a
					href="AcessoUsuario?user=listUser">Usuários</a>
					<a href="jsp/equipe.jsp">Sobre a Equipe</a>
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

	<!-- Detalhes do Brinquedo -->
	<div class="container">
		<div class="card">
			<img style="width: 30%;"
				src=<%="lojaBrinquedos/" + brinquedo.getImagem()%>
				alt="Imagem do Produto">
			<div class="card-body">
				<h2 class="card-title"><%=brinquedo.getNome()%></h2>
				<p class="card-text">
					<strong>Descrição:</strong>
					<%=brinquedo.getDescricao()%></p>
				<p class="card-text">
					<strong>Marca:</strong>
					<%=brinquedo.getMarca()%></p>
				<p class="card-text">
					<strong>Categoria:</strong><%=brinquedo.getCategoria()%></p>
				<p class="card-text">
					<strong>Preço:</strong> R$
					<%=brinquedo.getPreco()%></p>
				<p class="card-text">
					<strong>Detralhes</strong><br>
				<hr><%=brinquedo.getDetalhes()%></p>
			</div>
		</div>
	</div>

</body>

</html>
