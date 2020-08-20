<%@page import="Modelo.persona"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.personaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Personas</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Listado de Personas</h1>
            <a class="btn btn-success" href="Controlador?f_accion=agregarpersona01">Agregar Persona</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Nombres</th>
                        <th class="text-center">Apellidos</th>
                        <th class="text-center">DNI</th>
                        <th class="text-center">Direccion</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        personaDAO personaDAO = new personaDAO();
                        List<persona> personas = personaDAO.listarpersona();
                        Iterator<persona> iterator = personas.iterator();
                        persona persona = null;
                        while (iterator.hasNext()) {
                            persona = iterator.next();

                    %>
                    <tr>
                        <td class="text-center"><% out.print(persona.getIdpersona()); %></td>
                        <td><% out.print(persona.getNombres()); %></td>
                        <td><% out.print(persona.getApellidos()); %></td>
                        <td class="text-center"><% out.print(persona.getDni()); %></td>
                        <td><% out.print(persona.getDireccion()); %></td>
                        <td class="text-center"><% out.print(persona.getEstado()); %></td>                        
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?f_accion=editarpersona01&f_idpersona=<% out.print(persona.getIdpersona()); %>">Editar</a>
                            <a class="btn btn-danger" href="Controlador?f_accion=eliminarpersona&f_idpersona=<% out.print(persona.getIdpersona()); %>">Eliminar</a>
                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>

        </div>
    </body>
</html>
