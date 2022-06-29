<%-- 
    Document   : adminlogin
    Created on : Mar 1, 2022, 11:51:35 PM
    Author     : Yehan_NK
--%>


<%@page import="com.mycompany.techmart.Supplier_Proxy"%>
<%@page import="com.mycompany.techmart.SaleAgent_Proxy"%>
<%@page import="com.mycompany.techmart.Admin_Proxy"%>
<%@page import="com.mycompany.techmartwebservices.SupplierServices"%>
<%@page import="com.mycompany.techmartwebservices.SupplierServices_Service"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgent"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgentServices"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgentServices_Service"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <title>Management Login</title>
    </head>
    <body>
        <header class="position-sticky bg-white mb-6 w-100 top-0 pb-3 ">
            <div class="bar p-2">
                <h3  class="text-white lead text-center text-uppercase ">Tech Mart</h3>
            </div>
            <div class="container-fluid  bg-white my-3">
                <div>
                    <a href="index.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
                    <h3 class="mt-3 lead img__text">The Mobile Shop</h3>
                </div>   
	    
            </div>
            <hr>
	</header>

           <section class="login my-4 p-3">
          <div class="container">
              <h2 class="text-center">Management <i class="fas fa-users-cog"></i></h2>
              <form action="adminlogin.jsp" class="login__form" id="loginForm" method="post">
                <h3 class="text-center">Login</h3>
               <div class="my-3">
                 <label for="username" class="form-label">User ID</label>
                 <input type="text" class="form-control" name="username" id="username" aria-describedby="emailHelp">
                 <div class="err text-danger"></div>
               </div>
            
            
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                <div class="err text-danger"></div>
              </div>
                
              <div class="mb-3">
                <label for="type" class="form-label">Type</label>
                <select id="type" class="form-select mb-3" name="type" required>
                   <option value="" disabled selected>Select your option</option>
                    <option value="admin">Admin</option>
                     <option value="agent">Sales Agent</option>
                     <option value="supplier">Supplier</option>
                </select>
            </div>
              <input type="submit" name="login" value="login" class=" text-white text-uppercase btn my-3 login__btn w-100 ">
                 <% 
                    if(request.getParameter("login")!=null){

                      String userType = request.getParameter("type");   
                      if(userType.equals("admin")){

                     AdminServices LoginService = Admin_Proxy.getInstance();
                      // get the values
                      boolean checkLogin = LoginService.login(request.getParameter("username"), request.getParameter("password"));  

                         if(checkLogin){
                           session.setAttribute("loguser",request.getParameter("username"));   
                           response.sendRedirect("adminhome.jsp");
                          }
                         
                         else{
                          out.print("<div class='text-danger text-center'>Invalid Login</div>");
                          }                         
                       }

                      else if(userType.equals("agent")){

                          SalesAgentServices proxy = SaleAgent_Proxy.getInstance();

                          SalesAgent agent = new SalesAgent();
                          agent = proxy.loginAgent(request.getParameter("username"), request.getParameter("password")); 

                        if(agent.getUserId()!=null && agent.getPassword()!=null ){
                           session.setAttribute("loggeduser",agent);
                           session.setAttribute("notLogged",request.getParameter("login")); 
                           response.sendRedirect("agenthome.jsp");

                          }
                       else{
                          out.print("<div class='text-danger text-center'>Invalid Login</div>");
                        }
                      }

                      else{ // supplier login

                     SupplierServices proxy = Supplier_Proxy.getInstance();
                     // get the values
                     boolean checkLogin = proxy.login(request.getParameter("username"), request.getParameter("password")); 
                       if(checkLogin){
                         session.setAttribute("loguser",request.getParameter("username"));  
                         response.sendRedirect("supplierhome.jsp");
                       }
                       else{
                          out.print("<div class='text-danger text-center'>Invalid Login</div>");
                         }
                       }

                    }
               %>   
              </form>

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
       
 
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
   <script src="js/validations.js"></script>
</body>
</html>
