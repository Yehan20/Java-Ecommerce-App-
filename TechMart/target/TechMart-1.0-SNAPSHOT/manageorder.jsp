<%-- 
    Document   : userhome
    Created on : Mar 2, 2022, 12:14:15 PM
    Author     : Yehan_NK
--%>


<%@page import="com.mycompany.techmart.Proxy"%>
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
        <title>Manage Orders</title>
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
                    <a href="userhome.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
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
                <th>Manage</th>
               </tr>
             </thead>      
             <tbody>
                
          <% 
      // CustomerServices_Service service = new CustomerServices_Service();
        CustomerServices OrderService = Proxy.getInstance();
  
for(Order order:OrderService.viewOrder(customer.getUsername(),"booked","booked","booked")) {%>
            <tr class="bg-light">
                <td><%out.print(order.getOrderid());%></td> 
                <td><%out.print(order.getProductid());%></td> 
                <td><%out.print(order.getProductname());%></td>
                <td><%out.print(order.getOrderedamount());%></td>
                <td><%out.print(order.getBranch());%></td>
                <td><% out.print(order.getTotalprice()); %> </td>
              <td class="mb-3">
            <button id="payBtn" type="button" class="btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#payModal"> 
               Pay now
           </button>
             <button id="cancelBtn" type="button" class="btn close__btn text-white" data-bs-toggle="modal" data-bs-target="#cancelModal"> 
               Cancel
           </button>
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
             
             
 <div class="modal fade" id="payModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Order <i class="fas fa-cart"></i></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div>  
      <div class="modal-body ">

          
       <form action="manageorder.jsp" method="post">
          <div class="mb-3 ">
              <div>Total Price<span class="fw-bold m-0" id="your__price"> </span></div>
              <input type="hidden" id="finalprice" name="finalprice">
          </div> 
           
           <input type="hidden" id="payOrderId" name="payOrderId">
           
           <div class="mb-3">
                <label for="amt" class="col-form-label">Amount</label>
            
              <select id="paymentMethod" class="form-select " name="paymentMethod" required>
                     <option value="" disabled selected>Select your option</option>
                    <option value="Cash">Cash</option>
                     <option value="Card">Card</option>
                    
                </select>
           </div>
           
           <div class="payment__box">
               
<!--               <div class="d-sm-flex gap">
                  <div class="mb-3 w-100">
                  <label for="productId" class="col-form-label">Card Number:</label>
                  <input type="text" name="town" required class="form-control" id="town">
               </div>
            
               <div class="mb-3 w-100">
                  <label for="productId" class="col-form-label">Card Holder Name:</label>
                  <input type="text"  required class="form-control" id="town">
               </div>
               </div>
          
            
                 <div class="mb-3 w-50">
                  <label for="productId" class="col-form-label">Security Key:</label>
                  <input type="number"  required class="form-control" id="key">
               </div>-->
           </div>
    
              
            <div class="mb-3">
            <label for="message" class="col-form-label">Address:</label>
            <textarea class="form-control" style="resize:none;" id="address" name="address"></textarea>
          </div>
           
          <select id="towns" class="form-select " name="branches" required>
               
          </select>
               
                  
          

       <div class="modal-footer justify-content-start ps-0">
         <input type="submit" class="btn login__btn text-white" id="order" name="order" value="Confirm">  
        <button type="button" class="btn close__btn text-white"  data-bs-dismiss="modal">Close</button>
       
       
      </div>  
        </form>
          
                  <% 
                      
            
//      

         if(request.getParameter("order")!=null){
//             CustomerServices_Service service2 = new  CustomerServices_Service(); 
             CustomerServices  PayService = Proxy.getInstance();
             
             String Address = request.getParameter("address")+ " " + request.getParameter("branches");
            
             
             boolean isPaid=PayService.payOrder(request.getParameter("payOrderId"), Address, "paid"); 
             
           if(isPaid){ 

             out.println("<script type=\"text/javascript\">");
             out.println("alert('Payment Done we will contact you soon ');");
             out.println("location.href ='manageorder.jsp'");
             out.println("</script>");
           
            }
            else{
               out.print("Invalid Login");
            }
             
         }

     
         
        %>
      </div>

    </div>
  </div>
</div>
      
      
   <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation <i class="fas fa-trash-alt"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div>  
      <div class="modal-body">
        <form action="manageorder.jsp" method="post">
            <div class="mb-3">
                <p>Do you want to Cancel Order<p>
                <input type="hidden" id="deleteid__order" name="deleteid__order">   
                 <input type="hidden" id="delete__productId" name="delete__productId">   
                  <input type="hidden" id="delete__orderamount" name="delete__amount">   
            </div>
            <div class="modal-footer justify-content-start ps-0">
            <input type="submit" value="Yes" class="btn login__btn text-white" id="cancelOrderBtn" name="cancelOrder" />    
            <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">No</button>
            
           </div>

        </form>
              <% 
 
           if(request.getParameter("cancelOrder")!=null){
             
//               
//               Product p = new Product(Integer.parseInt(del));
                 //  CustomerServices_Service service3 = new CustomerServices_Service(); 
                   CustomerServices CancelService = Proxy.getInstance(); 
                    
                    String orderId=request.getParameter("deleteid__order");
                    int amt=Integer.parseInt(request.getParameter("delete__amount")); 
                    String productId=request.getParameter("delete__productId") ; 
           
                  boolean isRemoved=CancelService.cancelOrder(orderId, amt, productId); 
              
              
            if(isRemoved){
              out.println("<script type=\"text/javascript\">");
             out.println("alert('Order Cancelled');");
             out.println("location.href ='manageorder.jsp'");
             out.println("</script>");
            }
            else
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Un Success');");
             out.println("location.href ='manageorder.jsp'");
             out.println("</script>");
             
            }
               
               
           
          %> 
        
      </div>
    </div>
  </div>
 </div>       
            
                         
   <%} catch(NullPointerException ex){   
                 out.print("err"); 
            }
            
           %>   
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/customeroperations.js"></script>
</html>
