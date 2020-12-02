<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Usuario</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- CDN -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
  
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  
  <!-- CDN estilos -->
        <link rel="stylesheet" https="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" https="//stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
</head>

<jsp:useBean id="usu" class="datos.Usuarios" scope="page" /> <!-- "page" identifica  los atributos o metodos del modelo -->
<jsp:useBean id="usrDatos" class="datos.UsuarioDatos" scope="request" /> <!-- proceso los datos -->

<body>
<jsp:setProperty name="usu" property="*"/> <!-- seteo todos los valores sobre los atributos de "usu"(modelo) -->

<div class="container mt-5 py-5">
	<h1>Registro Usuario</h1>
	<%
		String nomb,apell,usuario,passw;
		int cod;
		nomb=request.getParameter("nombres");
		apell=request.getParameter("apellidos");
		usuario=request.getParameter("usuario");
		passw=request.getParameter("password");
		
		if(nomb==null && apell==null &&usuario==null && passw==null)
		{
	%>
	<form action="registroUsuario.jsp" method="get">
		
		<div class="md-form">
		   <label>Codigo</label>
		   <input type="text" class="form-control" name="codigo" value="">   
		</div>
		<div class="md-form">
		   <label>Apellido</label>
		   <input type="text" class="form-control" name="apellidos" value="">
		   <span class="invalid-feedback">
		   		<div>Ingrese los datos obligatorios</div>
		   </span>
		</div>
		<div class="md-form">
		   <label>Nombre</label>
		   <input type="text" class="form-control" name="nombres" value="">
		   <span class="invalid-feedback">
		   		<div>Ingrese los datos obligatorios</div>
		   </span>
		</div>
		<div class="md-form">
		   <label>Usuario</label>
		   <input type="text" class="form-control" name="usuario" value="">
		   <span class="invalid-feedback">
		   		<div>Ingrese los datos obligatorios</div>
		   </span>
		</div>
		<div class="md-form">
		   <label>Contraseña</label>
		   <input type="password" class="form-control" name="password" value="">
		   <span class="invalid-feedback">
		   		<div>Ingrese los datos obligatorios</div>
		   </span>
		</div>
        
        <button type="submit" class="btn btn-info waves-effect rounded-pill">Registrar</button>
        <a  class="btn btn-outline-info waves-effect rounded-pill" href="registroUsuario.jsp">Limpiar</a>   
	</form>
	
	<%
		}else{
			usrDatos.registrarUsuario(usu);
	%>
	<jsp:forward page="login.jsp" /><!-- establesco un vinculo -->
<%} %>
</div>



<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> 

</body>
</html>