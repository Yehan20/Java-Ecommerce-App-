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
        <title>Process Orders</title>
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
                 <h2 class="mb-sm-3 text-center">Process Paid Orders</h2> 
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white  table"  border="1">
             <thead>
               <tr>
                <th>Order Id</th>
                <th>Product Id</th>
                <th>Product Name</th>
                <th>Customer Name</th>
                <th>Amount</th>
                <th>Price</th>
                <th>Status</th>
                <th>Address</th>
                <th>Confirm</th>
               </tr>
             </thead>      
             <tbody>
                
          <% 
    
       SalesAgentServices proxy = SaleAgent_Proxy.getInstance();
  
     for(Order product:proxy.viewPaidOrders(agent.getBranch())) {%> 
            <tr class="bg-light">
                <td><%out.print(product.getOrderid());%></td> 
                <td><%out.print(product.getProductid());%></td> 
                <td><%out.print(product.getProductname());%></td>
                <td><%out.print(product.getUsername());%></td>
                <td><% out.print(product.getOrderedamount()); %> </td>
                <td><% out.print(product.getTotalprice()); %> </td>
                <td><% out.print(product.getStatus()); %> </td>
                <td><% out.print(product.getAddress()); %> </td>
              <td class="mb-3">
            <button id="finalizeBtn" type="button" class="btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#finalizeModal"> 
               Request
           </button></td>
           
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
                           
          
   <div class="modal fade" id="finalizeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Finalize Order <i class="fas fa-truck"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="bar  py-3"></div>   
      <div class="modal-body">      
        <form action="vieworders.jsp" method="post">           
          <div class="mb-3">
           <input type="hidden" id="orderId__fin"  class="form-control" name="orderId__fin" >
           <input type="hidden" id="agentId__fin" value="<% out.print(agent.getUserId()); %>"  class="form-control" name="agentId__fin" >
          </div>
            
            <div class="mb-3">
                <p class="viewAddress">Address</p>
            </div> 
            
           <div class="mb-3">
                <label for="type" class="form-label">Driver name</label>
                <select id="type" class="form-select mb-3" name="drivername" required>
                   <option value="" disabled selected>Select your option</option>
                    <option value="Kasun">Kasun(Kandy Branch)</option>
                     <option value="Daninel">Daniel(Colombo Branch)</option>
                     <option value="Mohan">Mohan(Gampaha Branch)</option>
                </select>
            </div>
    
         
            <div class="modal-footer justify-content-start ps-0">
            <input type="submit" value="Add Driver" id="Assign" class="btn login__btn text-white" name="Assign" />    
            <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">Close</button>
            
           </div>                
        </form>
         <% 
        
        if(request.getParameter("Assign")!=null){
          SalesAgentServices_Service service1 = new SalesAgentServices_Service ();
          SalesAgentServices proxy1 = service1.getSalesAgentServicesPort();
       
       // get the values   
       boolean success = proxy1.completeOrders(request.getParameter("orderId__fin"),request.getParameter("agentId__fin"),request.getParameter("drivername"));
         if(success){ 
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Order Completed Driver Assinged Customer will be updated ');");
             out.println("location.href ='vieworders.jsp'");
             out.println("</script>");          
         }
         else{
            out.print("Error in Sending the Request");
         }
         
             
       }
      
         %> 
       
      </div>


  </div>
</div>
</div>         
                         
            <%}catch(NullPointerException ex){            
            }
            
           %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="js/operations.js"></script>
    </body>
</html>
