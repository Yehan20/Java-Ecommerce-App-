<%-- 
    Document   : login
    Created on : Mar 2, 2022, 10:22:07 AM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.Proxy"%>
<%@page import="com.mycompany.techmartwebservices.CustomerServices"%>
<%@page import="com.mycompany.techmartwebservices.Customer"%>
<%@page import="com.mycompany.techmartwebservices.CustomerServices_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <title>Login</title>
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
              <form action="login.jsp" class="login__form" id="loginForm" method="post">
                <h3 class="text-center">Login</h3>
               <div class="my-3">
                 <label for="username" class="form-label">User Name</label>
                 <input type="text" class="form-control" name="username" id="username" aria-describedby="emailHelp">
                 <div class="err text-danger"></div>
               </div>
            
            
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                <div class="err text-danger"></div>
              </div>
 
              <input type="submit" name="login" value="login" class=" text-white text-uppercase btn my-3 login__btn w-100 ">
               <div class="mb-3">
                   <p>Not have an Account click  <a href="signup.jsp" target="_blank">Here </a> to Sign Up
                </div>
                     <%
                        if(request.getParameter("login")!=null){
//                       CustomerServices_Service service = new CustomerServices_Service();
                       CustomerServices proxy = Proxy.getInstance(); 
                      
                       // get the values
                       Customer customer = proxy.loginUser(request.getParameter("username"),request.getParameter("password"));

                          if(customer.getUsername()!=null && customer.getPassword()!=null ){
                           session.setAttribute("loggeduser",customer); 
                           session.setAttribute("islogged",request.getParameter("login") ); 
                           response.sendRedirect("userhome.jsp");

                         }
                         else{
                            out.print("<div class='my-3 lead text-danger text-center'>Invalid Login</div>");
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
