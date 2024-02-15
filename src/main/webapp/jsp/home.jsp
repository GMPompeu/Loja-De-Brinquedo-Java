<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RI HELP</title>
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
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="categoriasDropdown" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Categorias</button>
			<div class="dropdown-content">
				<%
				List<Brinquedo> cat = new ArrayList<Brinquedo>();
				cat = (ArrayList) request.getAttribute("listacat");

				for (Brinquedo l : cat) {
				%>
				<a
					href="SistemaBrinquedo?cmd=categoria&categoria=<%=l.getCategoria()%>"><%=l.getCategoria()%></a>
				<%
				}
				%>
			</div>
		</div>

		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="conteudoDropdown" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Conteúdo</button>
			<div class="dropdown-content">
				<%
				if (session.getAttribute("username") != null) {
				%>
				<a href="SistemaBrinquedo?cmd=adiministracao">Administração</a> <a
					href="AcessoUsuario?user=listUser">Usuarios</a> <a
					href="jsp/equipe.jsp">Sobre a Equipe</a>
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
			<h2>Brinquedos em Destaque</h2>
			<hr>
			<span>Brinquedos com o valor superior a R$100,00</span>
		</div>
		<%
		List<Brinquedo> lista = new ArrayList<Brinquedo>();
		int count = 0;
		lista = (ArrayList) request.getAttribute("listaBrinquedo");
		for (Brinquedo a : lista) {

			if (a.getPreco() >= 100) {
		%>
		<div class="card">
			<form action="SistemaBrinquedo" method="post">
				<input type="hidden" name="cmd" value="buscar"> <img
					src=<%="lojaBrinquedos/" + a.getImagem()%> alt="Imagem do Produto">
				<div class="card-body">
					<h5 class="card-title"><%=a.getNome()%></h5>
					<p class="card-text"><%=a.getDescricao()%></p>
					<h5 class="card-title"><%=a.getPreco()%></h5>
					<input type="hidden" name="txtId" value="<%=a.getCod_produto()%>">
					<button type="submit">Ver</button>
				</div>
			</form>
		</div>
	</div>
	<%
	}
	}
	%>
	</div>

	</div>

</body>

</html>

</body>
</html>