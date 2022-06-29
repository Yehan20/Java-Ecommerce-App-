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
        <title>User Home </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/style.css" type="text/css" rel="stylesheet">
    </head>
    <body>
          <% 
          try{
            Customer customer  =(Customer)( session.getAttribute("loggeduser"));  
           %>
           
              <header class=" bg-white mb-6 w-100 top-0 pb-3 ">
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


    <seection class="manage">
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

    </seection>
        
         
        <section class="p-3 my-3 bg-light">
           <div class="container">
	        <div class="row bg-light">
                  <div class="col  gap flex-grow-1 d-flex flex-wrap justify-content-around col-md-10 ">                   
                    <% 
                        String branch="Gampaha"; 
                        if(request.getParameter("Searchproduct")!=null){
                       branch=request.getParameter("branches");

                       
                     }
                        
                        
                        AdminServices_Service service = new AdminServices_Service();
                        AdminServices proxy = service.getAdminServicesPort();
                       for(Products product:proxy.getProducts(branch)){%>
                       <div class="card card__customize flex-grow-1 bs p-3" id="itemCard" style="max-width:16rem;">   
                        <div class="card-body bg-white d-flex flex-column align-items-center">
                          <img src="<% out.print(product.getPath());%>" class="card-img-top card__image" alt="...">  
                          <h5 class="card-title text-center mb-3"><%out.print(product.getProductName());%></h5>
                          <p class="fw-bold d-none text-center"><% out.print(product.getType());%></p>
                          <p class="d-none card-text text-center" stlyle="font-size:0.8rem;"><% out.print(product.getProductDesc());%></p>
                          <p class="fw-bold text-center">RS: <% out.print(product.getPrice());%></p>
                          <p class="fw-bold text-center">Branch :<% out.print(product.getBranch());%></p>
                          <input type="hidden" value="<%out.print(product.getProductId()); %>"/>
                          <h4 class="fw-bold text-center"><% out.print(product.getQuantity());%><h4>
                         </div>
                         <div class="d-flex justify-content-center gap">
                             <button id="orderBtn" class="btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#orderModal" data-bs-whatever="@mdo">Order </button>
                         </div>
                        

                      </div>


                      <%}%>
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
        
  
                     
    <div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Order <i class="fas fa-cart"></i></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div>  
      <div class="modal-body ">
          <div class="showcase ">
            <div class="card-body bg-white d-sm-flex gap  align-items-center">
              <img src=" " class="card-img-top card__image" id="showcase__img" alt="...">  
              <div class="part">
                <h5 class="card-title " name="t2" id="showcase__text"></h5>
                <p class=" " name="testt" id="showcase__type" ></p>
                <p class="card-text " id="showcase__price" stlyle="font-size:0.8rem;"></p>
                <p class=" " id="showcase__amount"></p>
                <p class=" "id="showcase__desc"></p>
                <input type="hidden" name="showcase_productId" id="showcase__productId"/>
                <p class="" id="showcase__branch" text-center"> </p>
              </div>

                   
             </div>
          </div>
          
        <form action="userhome.jsp" method="post">
          <div class="mb-3 w-50">
              <div>Total Price <span class="m-0" id="new_showcase__amount"> </span></div>
              <input type="hidden" id="finalprice" name="finalprice">
            <label for="amt" class="col-form-label">Amount</label>
            
            <input type="number" min="0" onkeydown="return false" name="orderedAmount" class="form-control" id="orderedAmount">
             <input type="hidden" name="showcase_productId_2" id="showcase__productId_2"/>
          </div>   

       <div class="modal-footer justify-content-start ps-0">
         <input type="submit" class="btn login__btn text-white" id="order" name="order" value="Add to Cart ">  
        <button type="button" class="btn close__btn text-white"  data-bs-dismiss="modal">Close</button>
       
       
      </div>  
        </form>
          
       <% 
                      
            
//      
//      if(request.getParameter("Update")!=null){
         if(request.getParameter("order")!=null){
            // CustomerServices_Service service2 = new  CustomerServices_Service(); 
             CustomerServices OrderService = Proxy.getInstance();
             
             Order order = new Order(); 
             order.setProductid(request.getParameter("showcase_productId_2"));
             order.setUsername(customer.getUsername());
             order.setOrderedamount(Integer.parseInt(request.getParameter("orderedAmount"))); 
             order.setTotalprice(Double.parseDouble(request.getParameter("finalprice"))); 
             
             boolean isOrdered= OrderService.addOrder(order);
             
           if(isOrdered){ 

             out.println("<script type=\"text/javascript\">");
             out.println("alert('Order Successful please Pay it');");
             out.println("location.href ='userhome.jsp'");
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
                         
                         
   <%} catch(NullPointerException ex){  
                 out.print("err");
            }
            
           %>   
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/customeroperations.js"></script>
</html>
