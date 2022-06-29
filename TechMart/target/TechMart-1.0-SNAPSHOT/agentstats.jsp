<%-- 
    Document   : agenthome
    Created on : Mar 3, 2022, 11:36:19 AM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.SaleAgent_Proxy"%>
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
        <title>Agent Home</title>
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
                    <a href="agenthome.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
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
                                <a href="#learn" class="nav-link">Manage Inventory</a>
                            </li>
                            <li class="nav-item">
                                <a href="#vieworders.jsp" class="nav-link">Process Orders</a>
                            </li>
                            <li class="nav-item">
                                <a href="confirmedorders.jsp" class="nav-link">View History</a>
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
                 <h2 class="mb-sm-3 text-center">Inventory</h2> 
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white  table"  border="1">
             <thead>
               <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Branch</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Stock</th>
               </tr>
             </thead>      
             <tbody>
                
          <% 
         SalesAgentServices proxy =SaleAgent_Proxy.getInstance();
  
        for(Products product:proxy.viewProductsAgent(agent.getBranch())) {%>
            <tr class="bg-light">
                <td><%out.print(product.getProductId());%></td> 
                <td><%out.print(product.getProductName());%></td> 
                <td><%out.print(product.getBranch());%></td>
                <td><%out.print(product.getQuantity());%></td>
                <td><% out.print(product.getPrice()); %> </td>
              <td class="mb-3">
            <button id="requestBtn" type="button" class="btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#requestModal"> 
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
           

                             
   <div class="modal fade" id="requestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Request Stock <i class="fas fa-cart-plus"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="bar  py-3"></div>   
      <div class="modal-body">      
        <form action="agenthome.jsp" method="post">           
            <div class="mb-3">
           <input type="hidden" id="requestProductId"  class="form-control" name="requestProductId" >
          </div>
    
           <div class="mb-3">
            <label for="recipient-name" class="col-form-label"> Amount:</label>
            <input type="number" required class="form-control" name="amount" id="amount">
          </div> 
            <div class="modal-footer">
            <input type="submit" value="Request" id="Request" class="btn login__btn text-white" name="Request" />    
            <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">Close</button>
            
           </div>                
        </form>
         <% 
              

        String fullName= agent.getFullname();
        if(request.getParameter("Request")!=null){

          SalesAgentServices RequestStock_Service = SaleAgent_Proxy.getInstance();
       
       // get the values

         String productId= request.getParameter("requestProductId");
         String agentName= request.getParameter(agent.getFullname());
         String result="Queued";
         int amount = Integer.parseInt(request.getParameter("amount"));  
       
       boolean sendRequest = RequestStock_Service.makeStockRequest(productId, fullName, amount, result);  
         if(sendRequest){ 

             out.println("<script type=\"text/javascript\">");
             out.println("alert('Restock Request Sent');");
             out.println("location.href ='agenthome.jsp'");
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
