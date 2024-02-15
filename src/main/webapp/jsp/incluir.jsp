<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar Brinquedo</title>
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
		<h2>Cadastro de Brinquedo</h2>
		<form action="../SistemaBrinquedo?cmd=incluir" method="post"
			enctype="multipart/form-data">

			<input type ="text" placeholder="Nome do Produto" name="nome" required>
			<input type="text" placeholder="Descrição" name="descricao" required>
			<input type="text" placeholder="Marca" name="marca" required>
			<input type="text" placeholder="Categoria" name="categoria" required>
			<input type="text" placeholder="Preço" name="preco" required>
			<textarea placeholder="Detalhes" rows="4" name="detalhes" required></textarea>
			<input type="file" name="imagem" required>
			<button type="submit" class="btn">Cadastrar</button>
			<button type="reset" class="btn btn-danger">Deletar</button>
		</form>
	</div>

</body>

</html>

</body>
</html>