<!DOCTYPE html>
<%
	response.setHeader("cache-control","no-cache,no-store,must-revalidate");
	
    String email=(String)session.getAttribute("email");
    
	String name=(String)session.getAttribute("name");
	
	if(email==null && name==null)
		response.sendRedirect("index.jsp");
	
	else{
%>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link href="images/logo.png" rel="icon"/> -->
       
        <title>A PLUS HOSPITALS</title>
        
        <!-- Add Bootstrap, Style, jquery -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#doctorlist').show();
                        $('.doctor li:first-child a').addClass('active');
                        $('.doctor li a').click(function(e){

                                var tabDiv=this.hash;
                                $('.doctor li a').removeClass('active');
                                $(this).addClass('.active');
                                $('.switchgroup').hide();
                                $(tabDiv).fadeIn();
                                e.preventDefault();

                        });


                });
        </script>
        
    </head>
          
         
    <body>
        
        <div class="container-fluid">
            
       
        <!------------------------------ Header Start Here -------------------------------------------->
         
		    <div class="row navbar-fixed-top">
			 
			     <nav class="navbar navbar-dark" style="background-color: #00FFFF;">
			  
			       <div class="container-fluid">
				
				      <div class="navbar-header">
				          <a class="navbar-brand logo" href="#">
					          <img alt="Brand" src="images/navbgimg.jpg">
				          </a>
				      <div class="navbar-text title"><p>A PLUS HOSPITALS <p></div>
				       
				      <div class="col-md-2 ">
                      
                      <ul class="nav nav-pills ">
                       
                        <li class="dropdown dmenu">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=name.toUpperCase()%> <span class="caret"></span></a>
                             
                              <ul class="dropdown-menu ">
                                    <!-- <li><a href="profile_patient.jsp">Change Profile</a></li>
                                    <li role="separator" class="divider"></li> -->
                                   <li><a href="logout.jsp">Logout</a></li>
                              </ul>
                        </li>
                    </ul>
                  
                   </div>
                  </div>
				 </div>
				</nav>
			  </div>
			     
			
		    </div>
	   <!------------------------------------------ Header Ends Here ---------------------------------------------->

           
  
       <!-- Footer -->
       <div class="row footer navbar-fixed-bottom">
		   <div class="col-md-12">
				<div>Designed By NewCoders</div>
		   </div>
	   </div>  
	   
</body>
</html>
<%
	}
%>