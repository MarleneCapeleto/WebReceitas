<%-- 
    Document   : cadastraReceitas
    Created on : 29 de nov. de 2022, 20:53:35
    Author     : Marlene Capeletto
--%>

<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@ page import="util.Upload" %>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    Upload up = new Upload();
    
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(),request)){
        
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String desc = up.getForm().get("desc").toString();
        
        String url = "jdbc:postgresql://localhost:5432/WebReceitas";
        String usuario = "postgres";
        String senhaBD = "123456";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO receitas(nome,descricao,imagem)VALUES('"+nome+"','"+desc+"', '"+imagem+"')");
            response.sendRedirect("../receitas.jsp?status=1");//Adicionado com sucesso
        }catch(Exception e){
            out.print(e);
        }
        
    }
    
%>