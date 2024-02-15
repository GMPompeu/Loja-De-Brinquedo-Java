<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
.card i {
            font-size: 4em; /* Ajuste o tamanho conforme necessário */
            display: block;
            margin: 0 auto;
            color: #333; /* Cor do ícone, se necessário ajuste conforme o seu design */
        }

        .card-body {
            text-align: center;
        }
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
		<h1>Ri Help</h1><a href="../SistemaBrinquedo?cmd=sair">Sair</a>
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
				<a href="../SistemaBrinquedo?cmd=adiministracao">Administração</a> 
				<a href="../SistemaBrinquedo?cmd=listar">Home</a>
				<a href="../AcessoUsuario?user=listUser">Usuarios</a>
				<%
				} else {
				%>
				<a href="../SistemaBrinquedo?cmd=listar">Home</a>
				<%
				}
				%>
			</div>
		</div>
	</nav>
	<div class="container">
		<div>
			<h2>Sobre a Equipe</h2>
		</div>
		<hr>
		<div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">Felipe Carvalho Torino</h5>
                <p class="card-text">31456391</p>
            </div>
        </div>
        <div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">Gustavo Casseta Reis</h5>
                <p class="card-text">30286662</p>
            </div>
        </div>
        <div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">João V. Flores Costas</h5>
                <p class="card-text">31459510</p>
            </div>
        </div>
        <div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">Ruan Rafael</h5>
                <p class="card-text">31105220</p>
            </div>
        </div>
        <div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">Marcos de Aguiar Sampaio</h5>
                <p class="card-text">29792088</p>
            </div>
        </div>
        <div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">Pedro Flor do Nascimento</h5>
                <p class="card-text">31406165</p>
            </div>
        </div>
        <div class="card">
            <i class="bi bi-person-circle"></i>
            <div class="card-body">
                <h5 class="card-title">Vinicius Gonçalves Costa</h5>
                <p class="card-text">31212247</p>
            </div>
        </div>
	</div>

</body>

</html>
