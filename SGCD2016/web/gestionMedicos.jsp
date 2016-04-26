
<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/app.css" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Acceso a Administradores</title>
    </head>
    <body>
        
        <%
           Usuario usuario = null;
           HttpSession ses = request.getSession();
           if (ses.getAttribute("usuario")==null){
               request.setAttribute("msg", "Debe Iniciar Sesión");
        %>
        <jsp:forward page="index.jsp">
            <jsp:param name = "error" value = "Debe Iniciar Sesión"/>
        </jsp:forward>
        <%
           } else {
                usuario = (Usuario)ses.getAttribute("usuario");
           }
        %>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Salud Dental</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <div class="navbar-text navbar-right usuario"><% out.print(usuario.getNombreCompleto()); %></div>
                </div>                
            </div>
        </nav>
                
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li>
                            <a href="homeadmin.jsp">Pacientes</a>
                        </li>
                        <li class="active">
                            <a href="#">Médicos</a>
                        </li>
                    </ul>
                    <ul class="nav nav-sidebar">                        
                        <li>
                            <a href="ServletCerrarSesion">Salir</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-10 col-sm-offset-2 main">
                    <h1 class="page-header">Administración de Médicos</h1>
                    <form class="form-horizontal" action="ServletBuscarMedico" method="POST">
                        <div class="form-group">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="inputUser" name="IdUsuario" placeholder="Usuario" required autofocus>
                            </div>
                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-default">Buscar</button>
                            </div>
                        </div>
                        
                    </form>
                
                    <c:choose>
                        <c:when test="${err != null}">
                            <div class="alert alert-danger" role="alert">${err}</div>
                        </c:when>
                        <c:when test="${msg != null}">
                            <div class="alert alert-success" role="alert">${msg}</div>
                        </c:when>
                        <c:when test="${medico != null}">
                                                        
                            <form class="form-horizontal" action="ServletActualizarMedico" method="POST">
                                <div class="form-group">
                                    <label for="inputIdUsuario" class="col-sm-2 control-label">Usuario</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id ="inputIdUsuario" name ="idUsuario" value="${medico.getId()}" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputNombre" class="col-sm-2 control-label">Nombre</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id ="inputNombre" name ="nombreUsuario" value="${medico.getNombre()}" required>
                                    </div>
                                    <label for="inputPaterno" class="col-sm-2 control-label">Apellido Paterno</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id ="inputPaterno" name ="aPatUsuario" value="${medico.getApellidoPaterno()}" required>
                                    </div>
                                    <label for="inputMaterno" class="col-sm-2 control-label">Apellido Materno</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control" id ="inputMaterno" name ="aMatUsuario" value="${medico.getApellidoMaterno()}" required>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="inputDireccion" class="col-sm-2 control-label">Dirección</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id ="inputDireccion" name ="dirUsuario" value="${medico.getDireccion()}" placeholder="Dirección:">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-2">
                                        <input type="submit" class="btn btn-default" name ="btn_actualiza" value = "Actualizar">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-2">
                                        <input type="submit" class="btn btn-danger" name ="btn_elimina" value = "Eliminar">
                                    </div>  
                                </div>
                            </form>
                            
                            
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
</html>
