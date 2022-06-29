<%-- 
    Document   : manageagent
    Created on : Mar 2, 2022, 8:28:21 PM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.Admin_Proxy"%>
<%@page import="com.mycompany.techmartwebservices.SalesAgent"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices"%>
<%@page import="com.mycompany.techmartwebservices.AdminServices_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String logged = (String)( session.getAttribute("loguser")); 
 
  if(logged==null || logged.isEmpty()){ 
      response.sendRedirect("adminlogin.jsp");
   }

       
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <title>Manage Agents</title>
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
                    <a href="adminhome.jsp"><img src='img/logo.png' class="img-fluid logo__img" alt='logo'></a>
                    <h3 class="mt-3 lead img__text">The Mobile Shop</h3>
                    <a href="logoutServletManagement" class="btn login__btn text-white">Logout </a>
                </div> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navmenu">
                      <span class="navbar-toggler-icon text-secondary"></span>
                </button>
                       <ul class="navbar-nav ms-auto"> 
                            <li class="nav-item">
                                <a href="products.jsp" class="nav-link">Products</a>
                            </li>
                            <li class="nav-item">
                                <a href="manageagent.jsp" class="nav-link">Sale Agents</a>
                            </li>
                            <li class="nav-item">
                                <a href="summary.jsp" class="nav-link">Orders</a>
                            </li>
                            <!-- <li class="nav-item">
                                <button class="btn bg-primary">Button</button>
                            </li> -->
                        </ul>
                </div>
            </nav>


            </div>

            <hr>
	</header>
     
        

         <section class="manage__section my-3 p-3"> 
             <div class="container-fluid">
                <div class="d-sm-flex mb-3 justify-content-around align-items-start">
                 <h2 class="mb-sm-3 text-center">Mange Sale Agents</h2> 
                 <button type="button" class="btn login__btn text-white d-block  mx-auto mx-sm-0" data-bs-toggle="modal" data-bs-target="#addModal" data-bs-whatever="@mdo">Add sales agents</button>
               </div>
             </div>
     
           <div class="container-fluid">
            <table class="table-white  table"  border="1">
             <thead>
               <tr>
                <th>UserID</th>
                <th>FullName</th>
                <th>Branch</th>
                <th>Email</th>
                <th>Update</th>
                <th>Delete</th>
               </tr>
             </thead>      
             <tbody>
                
             <% 
     
         AdminServices proxy = Admin_Proxy.getInstance();
//                UserDb obj = new UserDb(); 
               for(SalesAgent  agent :proxy.viewAgents()) {%>
            <tr class="bg-light">
                
                <td><%out.print(agent.getUserId());%></td> 
                <td><%out.print(agent.getFullname());%></td> 
                <td><%out.print(agent.getBranch());%></td>
                <td><%out.print(agent.getEmail());%></td>
                 <td style="display:none;"><%out.print(agent.getPassword());%></td>
                <td>
              <button id="updatebtn" type="button" class="btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#upModal"> 
               Update
           </button></td>
              <td class="mb-3">
            <button id="deletebtn" type="button" class="btn btn close__btn text-white" data-bs-toggle="modal" data-bs-target="#deleteModel"> 
               Delete
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
    </footer>               
	
 <div class="modal fade bs" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content modelBody" id="modelBody">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Agent <i class="fas fa-user-alt"></i> </h5>
        <button type="button"  class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
      
      </div>
     <div class="bar  py-3"></div>
      <div class="modal-body">
          
        <form class="" action="manageagent.jsp" method="post">
            <div class="d-sm-flex gap">
               <div class="mb-3 flex-grow-1">
                <label for="userid" class="col-form-label">User ID</label>
                 <input type="text" name="userid" class="form-control" id="userid">
             </div>          
             <div class="mb-3 flex-grow-1">
               <label for="name" class="col-form-label">Full Name</label>
              <input type="text" name="fullname" class="form-control" id="recipient-name">
             </div>
            </div>  
            
           <div class="d-sm-flex gap">
             <div class="mb-3 w-100">
              <label for="email" class="col-form-label">Email</label>
               <input type="email" name="email" class="form-control" id="email">
            </div> 
           <div class="mb-3 w-100 ">
            <label for="recipient-name" class="col-form-label">Branch</label>
            <select name="branch" class="form-select mb-3">
                <option class="gampaha">Gampaha </option>
                <option class="colombo">Colombo </option>
                <option class="kandy">Kandy </option>
               </select>
              </div>
            </div>
            
            <div class="d-sm-flex gap">
               <div class="mb-3 flex-grow-1">
                   <label  for="password" class="col-form-label">Password</label>
                   <input name="password" type="password" class="form-control" id="password">
                 </div>
            
                <div class="mb-3 flex-grow-1">
                 <label for="confirm" class="col-form-label">Confirm</label>
                 <input type="password" class="form-control" id="confirm">
               </div>
            </div>        
          <div class="justify-content-start ps-0 modal-footer">
           <input type="submit" class="btn btn-primary login__btn " name="Add" value="Add" />
           <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">Cancel</button>
       
         </div>
        </form>
      </div>
       <%
           
       // String loginBtn = request.getParameter("register");
      
      if(request.getParameter("Add")!=null){

       AdminServices AddAgentService = Admin_Proxy.getInstance();
       
       // get the values
       
       SalesAgent agent = new SalesAgent();
       agent.setUserId(request.getParameter("userid"));
       agent.setFullname(request.getParameter("fullname"));
       agent.setEmail(request.getParameter("email"));
       agent.setBranch(request.getParameter("branch")); 
       agent.setPassword(request.getParameter("password")); 

       
       boolean createAgent = AddAgentService.createSalesAgent(agent);
         if(createAgent){

             out.println("<script type=\"text/javascript\">");
             out.println("alert('Agent Created');");
             out.println("location.href ='manageagent.jsp'");
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
       
      <!-- update model -->
 <div class="modal fade" id="upModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Agent <i class="fas fa-edit"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="bar  py-3"></div>   
      <div class="modal-body">      
        <form action="manageagent.jsp" method="post">           
            <div class="mb-3">
           <input type="hidden" id="exuserid"  class="form-control" name="exuserid" >
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label"> new Name:</label>
            <input type="text" class="form-control" name="newname" id="newname">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">New email:</label>
            <input type="email" class="form-control" id="newemail"  name="newemail"/>
          </div>
           <div class="mb-3">
            <label for="recipient-name" class="col-form-label"> new Password:</label>
            <input type="password" class="form-control" name="newpassword" id="newpassword">
          </div> 
            <div class="modal-footer">
            <input type="submit" value="Update" class="btn login__btn text-white" name="Update" />    
            <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">Close</button>
            
           </div>                
        </form>
       
      </div>
         <%  
             String upbutton=request.getParameter("Update");
    
           if(upbutton!=null && upbutton.equals("Update")){ 
                SalesAgent agent = new SalesAgent();
        
               
               agent.setUserId(request.getParameter("exuserid"));
               agent.setFullname(request.getParameter("newname")); 
               agent.setEmail(request.getParameter("newemail"));
               agent.setPassword(request.getParameter("newpassword"));
              
               AdminServices EditAgent_Service = Admin_Proxy.getInstance(); 
                    
              boolean isProduct=EditAgent_Service.updateAgents(agent);
              
            if(isProduct){
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Agent Updated');");
             out.println("location.href ='manageagent.jsp'");
             out.println("</script>");
            }
            else{
               out.print("<script>Alert('Error')</script>");  
             
            }             
           }
            
         %>

  </div>
</div>
</div>
         
         <!-- Delete model -->
 <div class="modal fade" id="deleteModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation <i class="fas fa-trash-alt"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div>  
      <div class="modal-body">
        <form action="manageagent.jsp" method="post">
            <div class="mb-3">
                <p>Do you want to delete<p>
                <input type="hidden" id="deleteid" name="deleteid">   
            </div>
            <div class="modal-footer justify-content-start ps-0">
            <input type="submit" value="Delete" class="btn login__btn text-white" name="Delete" />    
            <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">No</button>
            
           </div>

        </form>
              <% 
             String deletebtn=request.getParameter("Delete");
    
           if(deletebtn!=null && deletebtn.equals("Delete")){
               String del = request.getParameter("deleteid");
 
              AdminServices DeleteAgent_Service = Admin_Proxy.getInstance();
                    
                    
           
              boolean isRemoved=DeleteAgent_Service.removeAgent(del);   
            if(isRemoved){
              out.println("<script type=\"text/javascript\">");
             out.println("alert('Deleted SucessFully');");
             out.println("location.href ='manageagent.jsp'");
             out.println("</script>");
            }
            else
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Un Success');");
             out.println("location.href ='manageagent.jsp'");
             out.println("</script>");
             
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
