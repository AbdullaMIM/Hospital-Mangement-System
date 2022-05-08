<%@page import="java.sql.*" %>


<%

        String doctid=request.getParameter("doctid");

	    String doctname=request.getParameter("doctname");

	    String email=request.getParameter("email");

	    String address=request.getParameter("address");

	    String phone=request.getParameter("phone");

	    String dept=request.getParameter("dept");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into doctor_info(name,email,address,phone,deptname) values(?,?,?,?,?)");
  
      	ps.setString(1,doctname);
      	ps.setString(2,email);
     	ps.setString(3,address);
     	ps.setString(4,phone);
     	ps.setString(5,dept);

	    int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<script type="text/javascript">
function Redirect()
{
    window.location="doctor.jsp";
}
setTimeout('Redirect()', 2000);
</script>
</div>

<%
	}

	ps.close();
	con.commit();	
%>



<head lang="en">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>A PLUS HOSPITALS</title>
        
		<!--Add Bootstrap, Style, jQuery -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<script src="js/jquery.js"></script>		
</head>

   <body>

        <div class="container-fluid">
           
           <!------------------------------------------ Header Starts Here ------------------------------->
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
		  <!------------------------------------------ Header Starts Here ------------------------------->
			    
		   
		  <!-- Body -->
		    <div style=" margin-top: -200px; margin-left: 400px;  height: 300px; width:700px; background-color:#276B9C; color: #fff; ">
		             <p style="text-align: center; padding: 85px 0px 40px 0px; font-weight:bold; font-size: 25px; font-family: sans-serif">NEW DOCTOR DETAILS ADDED SUCCESSFULLY.</p>
		             <p style="text-align: center; font-weight:bold; font-size: 25px; font-family: sans-serif"> REDIRECTING TO DOCTOR PAGE ...</p>
		    </div>
	        
         
         <!-- Footer -->
            <div class="row footer navbar-fixed-bottom">
		       <div class="col-md-12">
				 <div>Designed By NewCoders</div>
		      </div>
	        </div>  
	        
    </div> 
    
</body>
</html>
  
 