<%-- 
    Document   : stats
    Created on : Mar 10, 2022, 1:12:17 AM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.Admin_Proxy"%>
<%@page import="java.util.List"%>
<%-- 
    Document   : manageagent
    Created on : Mar 2, 2022, 8:28:21 PM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmartwebservices.Order"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgent"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String logged = (String)( session.getAttribute("loguser")); 
 
  if(logged==null || logged.isEmpty()){ 
      response.sendRedirect("adminlogin.jsp");
   }

       
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <title>Summary</title>
    </head>
    <body>
        <%
          try{
             // SalesAgent agent  =(SalesAgent)( session.getAttribute("loggeduser"));
              // String logged = (String)( session.getAttribute("loguser"));  
           %>  
          <header class="position-sticky bg-white mb-6 w-100 top-0 pb-3 ">
            <div class="bar p-2">
                <h3  class="text-white lead text-center text-uppercase ">Tech Mart</h3>
            </div>
            <div class="container-fluid  bg-white my-3">
              
                
              <nav class="navbar navbar-expand-lg navbar-light  bg-white ">
                <div class="container-fluid d-flex align-items-start">
                      <div>
                    <a href="adminhome.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
                    <h3 class="mt-3 lead img__text">The Mobile Shop</h3>
                  
                    <a href="logoutServletManagement" class="btn login__btn text-white">Logout </a>
                </div> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navmenu">
                      <span class="navbar-toggler-icon text-secondary"></span>
                </button>
                    <div class="collapse navbar-collapse" id="navmenu" >
                        <ul class="navbar-nav ms-auto"> 
                            <li class="nav-item">
                                <a href="products.jsp" class="nav-link">Products</a>
                            </li>
                            <li class="nav-item">
                                <a href="manageagent.jsp" class="nav-link">Sale Agents</a>
                            </li>
                            <li class="nav-item">
                                <a href="summary.jsp" class="nav-link">Orders</a>
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
             <div class="container">
               <h2 class="mb-sm-3 mb-3 text-center">Sales Overview</h2> 
                <div class="d-flex flex-wrap mb-3  gap justify-content-around ">
               
                
          <% 

            AdminServices proxy = Admin_Proxy.getInstance();
            List<Integer>orders =proxy.viewStats();    
           %>
           
           <div class="card bg-light my-3 w-100   align-items-center p-3 bs" style="max-width:21rem;">
         
               <h3 class=" align-self-stretch text-center mb-3">Total Earnings</h3>
               <div class=" d-flex flex-column mb-3">
                   <i class="fas fa-3x fa-dollar-sign"></i>
               </div>
             <h2 style="color:#484848;" class="  align-self-stretch text-center"><%  out.print("Rs: "+orders.get(0));%></h2>   
            </div>
            
               <div class="card bg-light my-3 w-100   align-items-center p-3 bs" style="max-width:21rem;">
         
               <h3 class=" align-self-stretch  text-center mb-3">Total Products Sold</h3>
               <div class=" d-flex  flex-column mb-3">
                  <i class="fas fa-3x fa-mobile-alt"></i>
               </div>
             <h2 style="color:#484848;" class=" align-self-stretch text-center"><%  out.print(orders.get(1));%></h2>   
            </div>
            
          <div class="card bg-light my-3 w-100   align-items-center p-3 bs" style="max-width:21rem;">
         
               <h3 class=" align-self-stretch text-center mb-3">Total Orders</h3>
               <div class=" d-flex flex-column mb-3">
                 <i class="fa-3x fas fa-plus-square"></i>
               </div>
             <h2 style="color:#484848;" class=" align-self-stretch text-center"><%  out.print(orders.get(2));%></h2>   
            </div>
            
            </div>  
           </div>  
         </section> 
            
                        
        <footer class="footer">
        <div class="container">
            <div class="split">
                <div class="col">
                    <ul class="list-group">
                        <li><a href="" class="text-white">About Tech Mart</a></li>
                        <li><a href="" class="text-white">Terms and conditions</a></li>
                    </ul>
                </div>
                <div class="col">
                    <ul>
                        <li><a href="" class="text-white"><i class="fas fa-envelope"></i>   techmart@gamil.com</a></li>
                        <li><a href="" class="text-white"><i class="fas fa-map-marker"></i> 12 main-st Colombo-4</a></li>
                        <li><a href="" class="text-white"><i class="fas fa-phone-alt"></i>  +94 07132243421 | +11 23556412</a></li>
                  </ul>
                </div>
                <div class="col">
                    <p>Follow us</p>
                    <div class="social-media">
                        <a href="#" class="social__links text-white"><i class="fab fa-facebook fa-2x"></i></a>
                        <a href="#" class="social__links text-white"><i class="fab fa-twitter fa-2x"></i></a>
                        <a href="#" class="social__links text-white"><i class="fab fa-instagram fa-2x"></i></a>
                    </div>
                    <h2 class="my-3">Tech Mart</h2>
                </div>
            </div>
        </div>
      <p class=" mt-3 mb-0 p-0 text-center">© 2022. Designed and developed by Yehan Nilanga.</p> 
    </footer>   
            <%}catch(NullPointerException ex){            
            }
            
           %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="js/operations.js"></script>
    </body>
</html>


