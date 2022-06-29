<%-- 
    Document   : supplierhome
    Created on : Mar 2, 2022, 7:21:14 AM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.Supplier_Proxy"%>
<%@page import="com.mycompany.techmartwebservices.Requests"%>
<%@page import="com.mycompany.techmartwebservices.SupplierServices"%>
<%@page import="com.mycompany.techmartwebservices.SupplierServices_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String logged = (String)( session.getAttribute("loguser")); 
 
  if(logged==null){ 
      response.sendRedirect("adminlogin.jsp");
   }

       
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Supplier Home</title>
    </head>
    <body>
         <header class="position-sticky bg-white mb-6 w-100 top-0 pb-3 ">
            <div class="bar p-2">
                <h3  class="text-white lead text-center text-uppercase ">Tech Mart</h3>
            </div>
            <div class="container-fluid  bg-white my-3">
              
                
              <nav class="navbar navbar-expand-lg navbar-light  bg-white ">
                <div class="container d-flex align-items-start">
                      <div>
                    <a href="index.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
                    <h3 class="mt-3 lead img__text">The Mobile Shop</h3>
                     <h4 class="" style="margin-bottom:0.4em; color:#484848;">Supplier name</h4>
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
                 <h2 class="mb-sm-3 text-center">Stock Requests</h2> 
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white md-table-borderless table"  border="0">
             <thead>
               <tr>
                <th>N0</th>
                <th>Product ID</th>
                <th>Agent Name</th>
                <th>Requested Amount</th>
                <th>Status</th>
                <th>Add Stock</th>
               </tr>
             </thead>      
             <tbody>
                
          <% 

       SupplierServices proxy = Supplier_Proxy.getInstance();
  
        for(Requests req:proxy.getStockRequests())    {%>
            <tr class="bg-light">
                <td><%out.print(req.getId());%></td> 
                <td><%out.print(req.getProductid());%></td> 
                <td><%out.print(req.getAgentname()); %></td>
                <td><%out.print(req.getAmount()); %></td>
                <td><% out.print(req.getResult()); %> </td>
              <td class="mb-3">
            <button id="restockBtn" type="button" class="btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#confirmRequestModal"> 
               Restock
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
     
          
  <div class="modal fade" id="confirmRequestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm Stock Update <i class="fas fa-cart-plus"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="bar  py-3"></div>   
      <div class="modal-body"> 
          <h5 class="lead">Are you sure you want to do this</h5>
        <form action="supplierhome.jsp" method="post">           
           
           <input type="hidden"  name="restockId" id="restockId"> 
           <input type="hidden" id="restockProduct"  class="form-control" name="restockProduct" > 
           <input type="hidden"  name="restockAmount" id="stock_amount">
        
            <div class="modal-footer justify-content-start ps-0">
            <input type="submit" value="Add" id="Request" class="btn login__btn text-white" name="Add" />    
            <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">Close</button>
            
           </div>                
        </form>
         <% 
              
        if(request.getParameter("Add")!=null){
          
          SupplierServices AddstockService = Supplier_Proxy.getInstance();
       
       // get the values

         String productId= request.getParameter("restockProduct");
         int stockAmount= Integer.parseInt(request.getParameter("restockAmount")); 
         int id = Integer.parseInt(request.getParameter("restockId"));  
       
       boolean updateStock =AddstockService.addStock(productId, stockAmount, id);   
         if(updateStock){ 

             out.println("<script type=\"text/javascript\">");
             out.println("alert('Stock Updated');");
             out.println("location.href ='supplierhome.jsp'");
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="js/operations.js"></script>
  </body>
</html>
