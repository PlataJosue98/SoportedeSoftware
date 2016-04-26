<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <title>Acceso al Sistema</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <form class="form-login" action="ServletLogin" method="POST">
                <h2 class="form-login-header">Inicio de Sesión</h2>
                <input type="text" name ="usuario" id="inputUsuario" class="form-control" placeholder="Usuario" required autofocus>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Contraseña" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
               
                <c:if test = "${msg != null}">
                    <div class="alert alert-danger" role="alert">${msg}</div>
                </c:if>
                
            </form>
        </div>
    </body>
</html>
