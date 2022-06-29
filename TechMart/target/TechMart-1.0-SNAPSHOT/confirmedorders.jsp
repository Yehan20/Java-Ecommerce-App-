<%-- 
    Document   : agenthome
    Created on : Mar 3, 2022, 11:36:19 AM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.SaleAgent_Proxy"%>
<%@page import="com.mycompany.techmartwebservices.Order"%>
<%@page import="com.mycompany.techmartwebservices.Products"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgentServices"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgentServices_Service"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
   String logged = (String)( session.getAttribute("notLogged")); 
  

  if(logged!=null){
           SalesAgent agent  =(SalesAgent)( session.getAttribute("loggeduser"));    
          }
  else{
           response.sendRedirect("adminlogin.jsp");
  }
          

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
          try{
             SalesAgent agent  =(SalesAgent)( session.getAttribute("loggeduser"));
           %>  
          <header class="position-sticky bg-white mb-6 w-100 top-0 pb-3 ">
            <div class="bar p-2">
                <h3  class="text-white lead text-center text-uppercase ">Tech Mart</h3>
            </div>
            <div class="container-fluid  bg-white my-3">
              
                
              <nav class="navbar navbar-expand-lg navbar-light  bg-white ">
                <div class="container-fluid d-flex align-items-start">
                      <div>
                    <a href="index.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
                    <h3 class="mt-3 lead img__text">The Mobile Shop</h3>
                     <h4 class="" style="margin-bottom:0.4em; color:#484848;"><%out.print("Agent Name: "+agent.getFullname());%></h4>
                    <a href="logoutServletManagement" class="btn login__btn text-white">Logout </a>
                </div> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navmenu">
                      <span class="navbar-toggler-icon text-secondary"></span>
                </button>
                    <div class="collapse navbar-collapse" id="navmenu" >
                        <ul class="navbar-nav ms-auto"> 
                            <li class="nav-item">
                                <a href="#learn" class="nav-link">What you Lern</a>
                            </li>
                            <li class="nav-item">
                                <a href="#question" class="nav-link">Questions</a>
                            </li>
                            <li class="nav-item">
                                <a href="#instructors" class="nav-link">Instructors</a>
                            </li>
                            <!-- <li class="nav-item">
                                <button class="btn bg-primary">Button</button>
                            </li> -->
                        </ul>
                    </div>
                </div>
            </nav>


            </div>

            <hr>
	</header>
          
       <section class="manage__section my-3 p-3"> 
             <div class="container-fluid">
                <div class="d-sm-flex mb-3 justify-content-around align-items-start">
                 <h2 class="mb-sm-3 text-center">Confirm Paid Orders</h2> 
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white  table"  border="1">
             <thead>
               <tr>
                <th>Order Id</th>
          
                <th>Product Name</th>
                <th>Customer Name</th>
                <th>Amount</th>
                <th>Price</th>
                <th>Status</th>
                <th>Address</th>
                <th>Driver </th>
               </tr>
             </thead>      
             <tbody>
                
          <% 

       SalesAgentServices proxy = SaleAgent_Proxy.getInstance();
  
        for(Order product:proxy.viewConfirmedOrders(agent.getUserId())) {%> 
            <tr class="bg-light">
                <td><%out.print(product.getOrderid());%></td> 
                <td><%out.print(product.getProductname());%></td>
                <td><%out.print(product.getUsername());%></td>
                <td><% out.print(product.getOrderedamount()); %> </td>
                <td><% out.print(product.getTotalprice()); %> </td>
                <td><% out.print(product.getStatus()); %> </td>
                <td><% out.print(product.getAddress()); %> </td>
                 <td><% out.print(product.getDriver()); %> </td>

           
            </tr>
            <%}%>
             </tbody>
              </table>
             </div>  
         </section>
           
       
                                  
                         
            <%}catch(NullPointerException ex){            
            }
            
           %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="js/operations.js"></script>
    </body>
</html>
