<%-- 
    Document   : logout
    Created on : 29 de nov. de 2022, 21:31:33
    Author     : Marlene Capeletto
--%>

<%
    session.invalidate();//Encerra a sess�o do usuario
    response.sendRedirect("../index.jsp?erro=4");//Redireciona para login msg -> sua sess�o foi encerrada
%>