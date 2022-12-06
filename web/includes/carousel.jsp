<%-- 
    Document   : carousel
    Created on : 2 de dez. de 2022, 19:59:43
    Author     : Marlene Capeletto
--%>

<%@ page import="java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="includes/css/style.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
            <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </head>

    <body>

        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
            
                    <%
                    Connection con = null;
                    Statement st = null;
                    ResultSet rs = null;
                    
                    String url = "jdbc:postgresql://localhost:5432/WebReceitas";
                    String usuario = "postgres";
                    String senhaBD = "123456";
                    try{
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection(url,usuario,senhaBD);
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT * FROM carousel ORDER BY id ASC");
                        while(rs.next()){
                            String id = rs.getString("id");
                        %>

       <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
       </div>
       <div class="carousel-inner">
         <div class="carousel-item active imagem-carousel d-block w-100">
           <img src="arquivos/<%=rs.getString("imagem") %>"
           <div class="carousel-caption d-none d-md-block">
             <h5><%=rs.getString("nome")%></h5>
             <p><%=rs.getString("descricao")%></p>
           </div>
         </div>
       </div>
       <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Previous</span>
       </button>
       <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Next</span>
       </button>
            <%    }
              }catch(Exception e){
                out.print(e);
               }

             %>             
                        
     </div>


    </body>
</html>