<%@page import="java.sql.*" %>


<%





        String patientid=request.getParameter("patientid");

	String patientname=request.getParameter("patientname");

	String xray=request.getParameter("xray");

	String usound=request.getParameter("usound");

	String bt=request.getParameter("bt");

	String ctscan=request.getParameter("ctscan");



        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update pathology set pname=?,x_rays=?,u_sound=?,b_test=?,ct_scan=? where id=?");
  
      	ps.setString(1,patientname);
      	ps.setString(2,xray);
     	ps.setString(3,usound);
     	ps.setString(4,bt);
     	ps.setString(5,ctscan);
     	ps.setInt(6,Integer.parseInt(patientid));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<script type="text/javascript">
function Redirect()
{
    window.location="pathology.jsp";
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
		             <p style="text-align: center; padding: 85px 0px 40px 0px; font-weight:bold; font-size: 25px; font-family: sans-serif">DIAGNOSIS DETAILS UPDATED SUCCESSFULLY.</p>
		             <p style="text-align: center; font-weight:bold; font-size: 25px; font-family: sans-serif"> REDIRECTING TO DIAGNOSIS PAGE ...</p>
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