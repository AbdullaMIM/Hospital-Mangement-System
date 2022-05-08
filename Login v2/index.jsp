<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
   
      <%
	     response.setHeader("cache-control","no-cache,no-store,must-revalidate");
	     
         String email=(String)session.getAttribute("email");
	     String role=(String)session.getAttribute("role");
	     
	     if(email!=null && role!=null & role.equals("admin"))
		       response.sendRedirect("admin.jsp");

	     else if(email!=null && role!=null & role.equals("patient"))
		       response.sendRedirect("patient_page.jsp");
      %>


<html lang="en">

<head>

	    <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>A PLUS HOSPITALS</title>
        
		<!--Add Bootstrap & External CSS & jquery -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<script src="js/jquery.js"></script>		
   
</head>



<body>

       <div class="container-fluid">
           
          <!--------------------------------Header----------------------------------->
		   
		   <div class="row navbar-fixed-top">
			 
		   <nav class="navbar navbar-dark" style="background-color: #00FFFF;">
			  
		   <div class="container-fluid">
				
			   <div class="navbar-header">
			      
			      <a class="navbar-brand logo" href="#">
				     <img alt="Brand" src="images/navbgimg.jpg">
			      </a>
			     
			      <div class="navbar-text title"><p>A PLUS HOSPITALS <p></div>
		      
		       </div>
				
			</div>
			     
			</nav>
		     
		    </div>
		   
		  <!--- -------------------------Header Ends Here --------------------------->
		    
		    
		    
		  <!-- Login Form -->
		    
		    <div class="row ">
			  <div class="col-md-12">
				<div class="panel panel-default login">
					
					<div class="panel-heading logintitle">SIGN IN</div>
					  <div class="panel-body">
                            
                            <form class="form-horizontal center-block" role="form" action="login_validation.jsp" method="post">
							   <div class="input-group input-group-lg">
								  <span class="input-group-addon" id="sizing-addon1"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
								    
								    <select class="form-control" name="userrole">
										 <option selected="selected">Select User</option>
										 <option value="admin">Admin</option>
										 <option value="patient">Patient</option>			  
								    </select>
								
							   </div> <br/>
                        <div>                                                 
                     </div>
                    
				               <div class="input-group input-group-lg">
					             <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
						            <input type="email" class="form-control" name="email" placeholder="example@gmail.com" required aria-describedby="sizing-addon1">
				               </div> <br/>
								
				               <div class="input-group input-group-lg">
					             <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
						           <input type="password" name="password" class="form-control" placeholder="Password" required aria-describedby="sizing-addon1">
				               </div> <br/>
								
				               <div class="col-sm-7 col-sm-offset-2">
					               <button type="submit" class="btn btn-primary btn-block btn-lg">SIGN IN</button>
				               </div>
						
			               </form>
		
		           </div>
		
		            <a href="patient_register.jsp" style="text-align:Center;font-weight:bold;font-size:140%;padding: 20px">Register As Patient</a>	
		            					
		        </div>
	        </div>				
        </div>
     </div>
 
 
     <!-- footer -->
       <div class="row footer navbar-fixed-bottom">
		  <div class="col-md-12">
				<div>Designed By NewCoders</div>
		 </div>
	 </div>  
        
</body>

</html>