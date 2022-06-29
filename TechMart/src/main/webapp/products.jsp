<%-- 
    Document   : products
    Created on : Mar 5, 2022, 6:02:42 PM
    Author     : Yehan_NK
--%>

<%@page import="com.mycompany.techmart.Admin_Proxy"%>
<%@page import="com.mycompany.techmartwebservices.Products"%>
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
        <title>Manage Products</title>
    </head>
    <body>
         <header class="position-sticky bg-white mb-6 w-100 top-0 pb-3 ">
            <div class="bar p-2 "  id="bar">
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
                    <div class="collapse navbar-collapse" id="navmenu" >
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
                </div>
            </nav>


            </div>

            <hr>
	</header>
        
        
    <seection class="manage">
        <div class="container">
         <h2 class="text-center">Manage products</h2>
         <div class=" d-sm-flex align-items-end">
             
          <form action="products.jsp"  method="post">
           <div class="d-flex align-items-end gap">
                <label for="type" class="form-label">Branch</label>
                <select id="branches" class="form-select " name="branches" required>
                 
                    <option value="Colombo">Colombo</option>
                     <option value="Gampaha">Gampaha</option>
                     <option value="Kandy">Kandy</option>
                </select>
                <input type="submit" class="btn login__btn text-white" value="Search" name="Search">    
                <% 
                 
                %>
            </div>
          </form>
            
              <button type="button" class="d-block align-self-end mx-auto me-md-3 mt-3  ms-md-auto  btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Add product</button>
         </div>
      
        </div>

    </seection>
        
         
        <section class="p-3 my-3 bg-light">
           <div class="container">
	        <div class="row bg-light">
                  <div class="col  gap flex-grow-1 d-flex flex-wrap justify-content-around col-md-10 ">                   
                    <% 
                        String branch="Colombo"; 
                        if(request.getParameter("Search")!=null){
                        branch=request.getParameter("branches");       
                     }
                     
                        AdminServices proxy = Admin_Proxy.getInstance();
                        
                       for(Products product:proxy.getProducts(branch)){%>
                       <div class="card card__customize flex-grow-1 bs p-3" style="max-width:16rem;">   
                        <div class="card-body bg-white d-flex flex-column align-items-center">
                          <img src="<% out.print(product.getPath());%>" class="card-img-top card__image" alt="...">  
                          <h5 class="card-title text-center"><%out.print(product.getProductName());%></h5>
                          <p class="fw-bold text-center"><% out.print(product.getType());%></p>
                          <p class="card-text text-center" stlyle="font-size:0.8rem;"><% out.print(product.getProductDesc());%></p>
                          <p class="fw-bold text-center">$: <% out.print(product.getPrice());%></p>
                          <p class="fw-bold text-center">Branch :<% out.print(product.getBranch());%></p>
                          <input type="hidden" value="<%out.print(product.getProductId()); %>"/>
                         </div>
                         <div class="d-flex justify-content-center gap">
                         <button type="button" id="update__btn" class="btn d-block  btn login__btn text-white" data-bs-toggle="modal" data-bs-target="#updateModel" data-bs-whatever="@mdo">Update</button>
                         <button type="button" id="delete__btn" class="btn d-block  btn close__btn text-white" data-bs-toggle="modal" data-bs-target="#deleteModel2" data-bs-whatever="@mdo">Delete</button>
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
        



<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add product <i class="fas fa-plus-circle"></i></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div> 
      <div class="modal-body">
          <form action="products.jsp" method="post">
              <div class="d-sm-flex gap">
                 <div class="mb-3">
                  <label for="productId" class="col-form-label">Product ID:</label>
                  <input type="text" name="productId" required class="form-control" id="productId">
                 </div>
                 <div class="mb-3">
                   <label for="productName" class="col-form-label">Product Name:</label>
                    <input type="text"  required class="form-control" name="productName" id="productName">
                  </div>
              </div>  
              
              <div class="d-sm-flex gap">        
                <div class="mb-3 w-100">
                 <label for="pride" class="col-form-label">Product Price:</label>
                 <input type="number"  class="form-control" required name="price" id="price">
               </div>
           
               <div class="mb-3 w-100">
                <label for="file" class="col-form-label">Image:</label>
                <input type="file" name="file" onchange="addPath()" required class="form-control" id="file">
                <input type="hidden" name="path" id="path">
              </div> 
         
              </div>
              
          <div class="d-sm-flex gap">
           <input type="hidden" value="0" id="qunantity" name="quantity">
            
           <div class="mb-3 flex-grow-1">
              <label for="type" class="form-label">Type</label>
                <select id="type" class="form-select mb-3" name="type" required>
                   <option value="" disabled selected>Type</option>
                    <option value="iphone">iphone</option>
                     <option value="samsung">samsung</option>
                     <option value="xiomi">Xiomi</option>
                </select>
            </div>
            
             <div class="mb-3 flex-grow-1">
                <label for="branch" class="form-label">Branch</label>
                <select id="branch" class="form-select mb-3" name="branch" required>
                   <option value="" disabled selected>Branch</option>
                    <option value="Gampaha">Gampaha</option>
                     <option value="Colombo">Colombo</option>
                     <option value="Kandy">Kandy</option>
                   </select>
                 </div>
              </div>
              
          <div class="mb-3">
            <label for="message" class="col-form-label">Description:</label>
            <textarea class="form-control" style="resize:none;" id="message" name="message"></textarea>
          </div>
        <div class="modal-footer justify-content-start ps-0">
          <input type="submit" class="btn login__btn text-white" value="Add" name="Add">    
          <button type="button" class="btn close__btn text-white" data-bs-dismiss="modal">Close</button>
       
        </form> 
         <% 


            if(request.getParameter("Add")!=null){
                
             AdminServices Add_Service = Admin_Proxy.getInstance();

             // get the values

             Products product = new Products();
             
             product.setProductId(request.getParameter("productId"));
             product.setProductName(request.getParameter("productName"));
             product.setProductDesc(request.getParameter("message"));
             product.setPrice(Double.parseDouble(request.getParameter("price")));   
             product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
             product.setPath(request.getParameter("path"));
             product.setType(request.getParameter("type")); 
             product.setBranch(request.getParameter("branch"));


             boolean addProduct = Add_Service.addProduct(product);  
               if(addProduct){ 
      //           session.setAttribute("loggeduser",custome);  
      //           response.sendRedirect("userhome.jsp");
                   out.println("<script type=\"text/javascript\">");
                   out.println("alert('Product Added');");
                   out.println("location.href ='products.jsp'");
                   out.println("</script>");

               }
               else{
                  out.print("Error occured while adding the product");
               }


            }
         
         %>
        </div>   
      </div>
      </div>
    </div>
  </div>


<!-- update prodcuts model -->
<div class="modal fade" id="updateModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update <i class="fas fa-cog"></i></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div>  
      <div class="modal-body">
        <form action="products.jsp" method="post">
          <div class="mb-3">
            <label for="newName" class="col-form-label">New Name</label>
            <input type="text" name="newName" class="form-control" id="newName">
          </div>
            <input type="hidden" id="updates_Id" name="updates_Id"/>
           <div class="mb-3">
            <label for="newPrice" class="col-form-label">New Price</label>
            <input type="number" name="newPrice" class="form-control" id="newPrice">
          </div> 
          <div class="mb-3">
            <label for="newdesc" class="col-form-label">New Description:</label>
            <textarea name="newDesc" style="resize:none;" class="form-control" id="newdesc"></textarea>
          </div>
       <div class="modal-footer justify-content-start">
         <input type="submit" class="btn login__btn text-white" id="Update" name="Update" value="Update">  
        <button type="button" class="btn close__btn text-white"  data-bs-dismiss="modal">Close</button>
       
      </div>  
    </form>
        <% 
              
      if(request.getParameter("Update")!=null){
 
       AdminServices Update_Service = Admin_Proxy.getInstance();
       
       // get the values
       
       Products product = new Products();
       product.setProductId(request.getParameter("updates_Id"));
       product.setProductName(request.getParameter("newName"));
       product.setProductDesc(request.getParameter("newDesc"));
       product.setPrice(Double.parseDouble(request.getParameter("newPrice")));   

       
        boolean uProduct = Update_Service.updateProducts(product);   
          if(uProduct){ 

              out.println("<script type=\"text/javascript\">");
              out.println("alert('Product Updated');");
              out.println("location.href ='products.jsp'");
              out.println("</script>");

          }
            else{
               out.print("Update failed");
            }
         
             
         }
         
         %>
      </div>

    </div>
  </div>
</div>
      

 <div class="modal fade" id="deleteModel2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation <i class="fas fa-trash-alt"></i> </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="bar py-3"></div>  
      <div class="modal-body">
        <form action="products.jsp" method="post">
            <div class="mb-3">
                <p>Do you want to delete<p>
                <input type="hidden" id="product__deleteid" name="product__deleteid">   
            </div>
            <div class="modal-footer justify-content-start ps-0">
            <input type="submit"  value="Delete"  id="delete__product" class="btn login__btn text-white" name="Delete" />    
            <button type="button" class="btn close__btn  text-white" data-bs-dismiss="modal">No</button>
            
           </div>

        </form>
             <% 
            String deletebtn=request.getParameter("Delete");
             if(deletebtn!=null && deletebtn.equals("Delete")){
              String del = request.getParameter("product__deleteid");

                AdminServices Delete_Service = Admin_Proxy.getInstance();
         
            boolean isRemoved=Delete_Service.deleteProduct(del);  
            if(isRemoved){
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Deleted SucessFully');");
               out.println("location.href ='products.jsp'");
               out.println("</script>");
           }
            else{
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Error in Deleting');");
               out.println("location.href ='products.jsp'");
               out.println("</script>");
            
             }
          
          }
               
               
           
          %> 
        
      </div>
    </div>
  </div>
 </div>   
      
    </body>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
   <script src="js/operations.js"></script>
   <script src='js/animation.js'></script>
</html>
