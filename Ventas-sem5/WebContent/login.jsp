<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*" %>
<%@page import="datos.Usuarios" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="estilos.jsp" %>
</head>

<jsp:useBean id="usu" class="datos.Usuarios" scope="page" />
<jsp:useBean id="usrDatos" class="datos.UsuarioDatos" scope="request" />

<body>
<jsp:setProperty name="usu" property="*"/>

<%

boolean listaUsuarios= usrDatos.loginUsu(usu);//guardo los datos del metodo 

//Usuarios usua;
if(!listaUsuarios){
%>

<div class="d-flex flex-row justify-content-center alig-items-center mt-5 py-5">

<div class="card" style="width: 30rem;">
<!-- Default form login -->
<form class="text-center border border-light p-5" action="login.jsp">

    <p class="h4 mb-4">Iniciar Sesión</p>

    <input type="text" name="usuario" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="Usuario">
    <input type="password" name="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Contraseña">

    <div class="d-flex justify-content-around">
        <div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                <label class="custom-control-label" for="defaultLoginFormRemember">Recordar contraseña</label>
            </div>
        </div>
        <div>
            <!-- Forgot password -->
            <a href="">Olvido su contraseña?</a>
        </div>
    </div>

    <!-- Sign in button -->
    <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

    <!-- Register -->
    <p>No tiene cuenta?
        <a href="">Registrarse</a>
    </p>

    <!-- Social login -->
    <p>ingresar con:</p>

    <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f light-blue-text"></i></a>
    <a href="#" class="mx-2" role="button"><i class="fab fa-twitter light-blue-text"></i></a>
    <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in light-blue-text"></i></a>
    <a href="#" class="mx-2" role="button"><i class="fab fa-github light-blue-text"></i></a>

</form>
<%} else { %>

	<jsp:forward page="listaProductos.jsp" />
	
	<%} %>
<!-- Default form login -->
</div>
</div>
</body>
</html>