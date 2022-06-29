<%-- 
    Document   : signup
    Created on : Mar 2, 2022, 10:21:38 AM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmartwebservices.Customer"%>
<%@page import="com.mycompany.techmartwebservices.CustomerServices"%>
<%@page import="com.mycompany.techmartwebservices.CustomerServices_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <title>Sign Up</title>
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
        
        
	<section class="signUp mt-6 mb-4 p-3">
           <div class="container mb-3">
	      <div class="row bs  ">
                  <div class="col-md-8 mb-3 ">
                     <form action="signup.jsp" class="mt-3 p-3" id="signUpform" method="post">  
                         <h2 class="mb-3">Sign Up</h2> 
                         <div class="d-md-flex gap">
                            <div class="mb-3 flex-grow-1">
                            <label for="username" class="form-label">User Name</label>
                            <input type="text" class="form-control" name="username" id="username" aria-describedby="emailHelp">
                            <div class="err text-danger"></div>
                           </div>

                           <div class="mb-3 flex-grow-1">
                            <label for="username" class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullname" id="fullname" aria-describedby="emailHelp">
                            <div class="err text-danger"></div>
                           </div>                                
                          </div>
                         
                         <div class="d-md-flex gap">
                          <div class="mb-3 w-100">
                           <label for="nic" class="form-label">NIC</label>
                           <input type="text" class="form-control" name="nic" id="nic" aria-describedby="emailHelp">
                           <div class="err text-danger"></div>
                          </div>

                              <div class="mb-3 w-100">
                               <label for="" class="form-label ">Gender</label>
                               <select id="id" class="form-select mb-3" name="gender">
                                  <option value="male">Male</option>
                                  <option value="female">Female</option>
                               </select>
                              </div>      
                         </div>
                         
                         <div class="d-md-flex gap">
                            <div class="mb-3 flex-grow-1">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            <div class="err text-danger"></div>
                          </div>

                          <div class="mb-3 flex-grow-1">
                           <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                           <input type="password" class="form-control" id="exampleInputPassword1">
                           <div class="err text-danger"></div>
                         </div>

                         </div>             
                          <input type="submit" name="register" value="register" class="w-50 mx-auto text-uppercase btn__register d-block btn btn-primary">
                      </form>
                           <% 
                            String loginBtn = request.getParameter("register");

                            if(request.getParameter("register")!=null){
                             CustomerServices_Service service = new CustomerServices_Service();
                             CustomerServices proxy = service.getCustomerServicesPort();


                      //       String password = request.getParameter("password");
                             Customer customer = new Customer(); 
                             customer.setFullname(request.getParameter("fullname"));
                             customer.setGender(request.getParameter("gender"));
                             customer.setNic(request.getParameter("nic"));
                             customer.setPassword(request.getParameter("password"));
                             customer.setUsername(request.getParameter("username")); 

                             boolean createUser = proxy.createUser(customer); 
                               if(createUser){
                                 session.setAttribute("loggeduser",customer);  // passing a session object
                                 session.setAttribute("islogged",loginBtn );  // p
                                 response.sendRedirect("userhome.jsp"); // auto login
                      //          out.print("User created");
                               }
                               else{
                                  out.print("<p class='text-center text-danger'>Username or Nic has been used</p>");
                               }

                            }
                         %>
                  </div>
	        <div class="col-md-4 p-3 second d-flex flex-column">
                    <img src="img/cart.svg" style="max-width:200px;" class="align-self-center img img-fluid w-50 "/>
                    <ul class="align-self-center  mt-3">
                        <h3 class=" mb-3 lead">Registered Users can</h3> 
                        <li class="mb-3"><i class="fas text-success fa-check-circle"></i> Order Items</li>
                        <li class="mb-3"><i class="fas text-success fa-check-circle"></i> View Latest Products</li>
                        <li class="mb-3"><i class="fas text-success fa-check-circle"></i> Buy for the Cheapest Prices</li>
                    </ul>
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
            <div>
              
            </div>
              
        </div>
       <p class=" mt-3 mb-0 p-0 text-center">© 2022. Designed and developed by Yehan Nilanga.</p> 
    </footer> 
                  
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>      
   <script src="js/validations.js"></script>
    </body>
</html>
