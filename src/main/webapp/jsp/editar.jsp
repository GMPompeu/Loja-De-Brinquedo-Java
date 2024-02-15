<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
<!DOCTYPE html>
<jsp:useBean id="brinquedo" scope="session" class="model.Brinquedo" />
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar</title>
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
	margin-top: 5px;
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
	margin: 20px;
}

input {
	margin-bottom: 10px;
	padding: 8px;
	width: 100%;
	box-sizing: border-box;
}

.btn {
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-danger {
	background-color: #f44336;
}
</style>
</head>

<body>

	<header>
		<h1>Minha Loja</h1>
	</header>
	<div class="container">
		<h2>Editar Produto</h2>
		<form action="SistemaBrinquedo?cmd=atualizar" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="txtId" value="<%=brinquedo.getCod_produto() %>">
			<input type ="text" value="<%=brinquedo.getNome() %>" name="nome" >
			<input type="text" value="<%=brinquedo.getDescricao() %>" name="descricao" >
			<input type="text" value="<%=brinquedo.getMarca() %>" name="marca" >
			<input type="text" value="<%=brinquedo.getCategoria()%>" name="categoria" >
			<input type="text" value="<%=brinquedo.getPreco() %>" name="preco" >
			<textarea placeholder="Detalhes" rows="4" name="detalhes"><%=brinquedo.getDetalhes() %></textarea>
			<input type="file"  name="imagem" >
			<button type="submit" class="btn">Atualizar</button>
			<button type="reset" class="btn btn-danger">Apagar</button>
			<input type="hidden" name="imagem2" value="<%=brinquedo.getImagem()%>">
		</form>
	</div>

</body>

</html>

</body>
</html>