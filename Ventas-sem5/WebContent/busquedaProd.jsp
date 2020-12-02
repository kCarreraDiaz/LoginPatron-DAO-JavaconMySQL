<%@page import="java.util.*" %> 
<%@page import="datos.Productos" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="estilos.jsp" %>
</head>

	<jsp:useBean id="dato" class="datos.ProductoDatos" scope="page" />
	<jsp:useBean id="usrdato" class="datos.ProductoDatos" scope="request" />
	
<body>
<jsp:setProperty name="dato" property="*"/>
<div class="container mt-5 py-5">
<%
	String nomb;
	nomb=request.getParameter("nombre");

	if(nomb==null)
		{
	%>
	<h3>Filtro por nombre</h3>
	<form action="busquedaProd.jsp" method="get" class="form-inline d-flex justify-content-center md-form form-sm mt-0">
		
        <i class="fas fa-search" aria-hidden="true"></i>
  		<input class="form-control form-control-sm ml-3 w-75" type="text" name="nombre" placeholder="Search" aria-label="Search">
    
        <button type="submit" class="btn btn-info waves-effect rounded-pill">Buscar</button>  
	</form>
<%} else { %>
	<%
	//Productos prod;
		List listaProductos= usrdato.buscarDatos(nomb);
		Iterator listaProductosIterador=listaProductos.iterator();//genero "bucle""

%>
<h3>Productos</h3>
<div class="table-responsive text-nowrap">
  <table class="table">
    <thead>
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Producto</th>
      <th scope="col">Precio</th>
      <th scope="col">Stock</th>
    </tr>
  </thead>
    <tbody>    
 <%
    Productos prod;
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
    </tbody>
  </table>
<%} %>
</div>
</div>
</body>
</html>


