<%@page import="datos.Productos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*" %>
<%@page import="datos.Productos" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Productos</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <link rel="stylesheet" https="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" https="//stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
<style>
.circle {
    border-radius: 100%;
      }
</style>
</head>

<jsp:useBean id="usrDatos" class="datos.ProductoDatos" scope="page" />
<body>
<%
List listaProductos= usrDatos.recuperarDatos();//guardo los datos del metodo recuperaUsuarios()
Iterator listaProductosIterador=listaProductos.iterator();//genero "bucle""

Productos prod;
%>
<div class="table-responsive text-nowrap">
<div class="container py-4">
<h2>Lista Productos</h2>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Producto</th>
      <th scope="col">Precio</th>
      <th scope="col">Stock</th>
      <th scope="col" style="text-align:right"><a href="registroProducto.jsp" class="btn btn-success circle px-3"><i class="fas fa-plus"></i></a></th>        
    </tr>
  </thead>
   <tbody>
<%
while(listaProductosIterador.hasNext()){
	prod=(Productos)listaProductosIterador.next();//leo cada registro y lo guardo en objeto Usuario
	%>
	<tr>
        <td scope="row"><%=prod.getCodigo() %></td>
		<td><%=prod.getNombre() %></td>
		<td><%=prod.getPrecio() %></td>
		<td><%=prod.getStock() %></td>
		</tr>
	<%} %>
</table>

</div>
</div>
</body>
</html>