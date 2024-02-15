<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
<%
List<Brinquedo> lista = new ArrayList<Brinquedo>();
int count = 0;
lista = (ArrayList) request.getAttribute("categorias");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categorias</title>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		<%
		List<Brinquedo> cat = new ArrayList<Brinquedo>();
		cat = (ArrayList) request.getAttribute("listacat");
		%>


		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="conteudoDropdown" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Conteúdo</button>
			<div class="dropdown-content">
				<%
				if (session.getAttribute("username") != null) {
				%>
				<a href="SistemaBrinquedo?cmd=adiministracao">Administração</a>
				<a href="SistemaBrinquedo?cmd=listar">Home</a>
				<a href="AcessoUsuario?user=listUser">Usuários</a>
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

	<!-- Cards de Produtos -->
	<div class="container">
		<div>
			<%
			if (!lista.isEmpty()) {
				Brinquedo categoria = lista.get(0);
			%>
			<h2>Categoria</h2>
			<h3 class="text-body-secondary"> <%=categoria.getCategoria()%></h3>

			<%
			} else {
			%>
			Categoria <small class="text-body-secondary">:Nenhuma
				categoria selecionada </small>
			<%
			}
			%>
		</div>
		<hr>
		<%
		for (Brinquedo a : lista) {
		%>
		<div class="card">
			<form action="SistemaBrinquedo" method="post">
				<img src=<%="lojaBrinquedos/" + a.getImagem()%>
					alt="Imagem do Produto">
				<div class="card-body">
					<h5 class="card-title"><%=a.getNome()%></h5>
					<p class="card-text"><%=a.getDescricao()%></p>
					<h5 class="card-title"><%=a.getPreco()%></h5>
					<input type="hidden" name="txtId" value="<%=a.getCod_produto()%>">
					<button type="submit">Ver</button>
				</div>
		</div>
		</form>
	</div>
	<%
	}
	%>
	</div>

	</div>

</body>

</html>
</body>
</html>