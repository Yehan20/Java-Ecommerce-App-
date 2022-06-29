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
<!--           <div>
             <h1><//%out.print(customer.getFullname()) ;%></h1>
            <h1><//%out.print(customer.getNic());%></h1>
             <h1><//%out.print(customer.getGender());%></h1><//%%>
           </div>
           <a href="logoutservlet" class="btn btn-primary">Logout</a>-->


<!--    <seection class="manage">
        <div class="container">
         <h2 class="text-center">Order items</h2>
         <div class=" d-sm-flex align-items-end">
             
          <form action="userhome.jsp"  method="post">
           <div class="d-flex align-items-end gap">
                <label for="type" class="form-label">Branch</label>
                <select id="branches" class="form-select " name="branches" required>
                 
                    <option value="Colombo">Colombo</option>
                     <option value="Gampaha">Gampaha</option>
                     <option value="Kandy">Kandy</option>
                </select>
                <input type="submit" class="btn login__btn text-white" value="Search" name="Searchproduct">    
         
            </div>
          </form>
            
  
         </div>
      
        </div>

    </seection>-->
        
         
        <section class="p-3 my-3 bg-light">
           <div class="container">
	        <div class="row bg-light">
                  <div class="col  gap flex-grow-1 d-flex flex-wrap justify-content-around col-md-10 ">                   

                  </div>    
               </div>
	
           </div>
	</section>


       <section class="manage__section my-3 p-3"> 
             <div class="container-fluid">
                <div class="d-sm-flex mb-3 justify-content-around align-items-start">
                 <h2 class="mb-sm-3 text-center">Your Pending orders</h2> 
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white  table"  border="1">
             <thead>
               <tr>
                <th>Order ID</th>
                <th>Product ID </th>
                <th>Porduct Name</th>
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
       CustomerServices proxy = service.getCustomerServicesPort();
  
for(Order order:proxy.viewOrder(customer.getUsername(),"paid","completed","canceled")) {%> 
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
        
  
             
            
                         
   <%} catch(NullPointerException ex){   
                 out.print("err"); 
            }
            
           %>   
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/customeroperations.js"></script>
</html>
