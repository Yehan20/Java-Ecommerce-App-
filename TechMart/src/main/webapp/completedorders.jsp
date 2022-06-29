<%-- 
    Document   : userhome
    Created on : Mar 2, 2022, 12:14:15 PM
    Author     : Yehan_NK
--%>


<%@page import="com.mycompany.techmartwebservices.Order"%>
<%@page import="com.mycompany.techmartwebservices.CustomerServices"%>
<%@page import="com.mycompany.techmartwebservices.CustomerServices_Service"%>
<%@page import="com.mycompany.techmartwebservices.Products"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices_Service"%>
<%@page import="com.mycompany.techmartwebservices.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 

    String logged = (String)( session.getAttribute("islogged")); 
 
  if(logged!=null && !logged.isEmpty()) {
    Customer customer  =(Customer)( session.getAttribute("loggeduser")); 
          }
  else{
           response.sendRedirect("login.jsp");
  }
         
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/style.css" type="text/css" rel="stylesheet">
    </head>
    <body>
          <% 
          try{
            Customer customer  =(Customer)( session.getAttribute("loggeduser"));  
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
                     <h4 class="" style="margin-bottom:0.4em; color:#484848;"><%out.print(" Name: "+customer.getFullname());%></h4>
                    <a href="logoutservlet" class="btn login__btn text-white">Logout </a>
                </div> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navmenu">
                      <span class="navbar-toggler-icon text-secondary"></span>
                </button>
                    <div class="collapse navbar-collapse" id="navmenu" >
                        <ul class="navbar-nav ms-auto"> 
                             <li class="nav-item">
                                <a href="manageorder.jsp" class="nav-link">Manage Orders</a>
                            </li>
                            <li class="nav-item">
                                <a href="completedorders.jsp" class="nav-link">Completed Orders</a>
                            </li>
                            <li class="nav-item">
                                <a href="#instructors" class="nav-link">Cancelled Orders</a>
                            </li>
                            <li class="nav-item">
                                 <a href="#instructors" class="nav-link">Stats</a>
                            </li> 
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
                 <h2 class="mb-sm-3 text-center">Paid orders</h2> 
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white  table"  border="1">
             <thead>
               <tr>
                <th>Order ID</th>
                <th>Product ID </th>
                <th>Product Name</th>
                <th>Ordered Amount</th>
                <th>Branch</th>
                <th>Price</th>
                <th>Status</th>
                 <th>Driver</th>
               </tr>
             </thead>      
             <tbody>
                 
          <% 
       CustomerServices_Service service = new CustomerServices_Service();
       CustomerServices AllOrders = service.getCustomerServicesPort();
  
         for(Order order:AllOrders.viewOrder(customer.getUsername(),"paid","completed","paid")) {%> 
            <tr class="bg-light">
                <td><%out.print(order.getOrderid());%></td> 
                <td><%out.print(order.getProductid());%></td> 
                <td><%out.print(order.getProductname());%></td>
                <td><%out.print(order.getOrderedamount());%></td>
                <td><%out.print(order.getBranch());%></td>
                <td><% out.print(order.getTotalprice()); %> </td>
                 <td class="">
                  <% out.print(order.getStatus()); %>
                  </td>
                    <td class="">
                  <% out.print(order.getDriver()); %>  
                    </td> 
                
           
            </tr>
            <%}%>
             </tbody>
              </table>
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
        

                         
   <%} catch(NullPointerException ex){   
                 out.print("err"); 
            }
            
           %>   
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/customeroperations.js"></script>
</html>
