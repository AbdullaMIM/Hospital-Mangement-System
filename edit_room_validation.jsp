<%@page import="java.sql.*" %>


<%



 

        String roomNo=request.getParameter("roomNo");

	String bedNo=request.getParameter("bedNo");

	String status=request.getParameter("status");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update room_info set status=? where room_no=? and bed_no=?");
  
      	ps.setString(1,status);
      	ps.setInt(2,Integer.parseInt(roomNo));
      	ps.setInt(3,Integer.parseInt(bedNo));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="ward.jsp";
}
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
<%
	}
	else
	{
%>
<div style="text-align:center;margin-top:25%">
<font color="red">
<script type="text/javascript">
function Redirect()
{
    window.location="ward.jsp";
}
setTimeout('Redirect()', 3000);
</script>
</font>
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
        
		<!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<script src="js/jquery.js"></script>		
</head>

   <body>

        <div class="container-fluid">
           
            <!--- Header --------------------------->
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
		    <!--- Header Ends Here --------------------------->
		    
		    
		    <div style=" margin-top: -300px; margin-left: 400px;  height: 300px; width:700px; background-color:#276B9C; color: #fff; ">
		             <p style="text-align: center; padding: 85px 0px 40px 0px; font-weight:bold; font-size: 25px; font-family: sans-serif">Updated Ward Number and Room Number Status</p>
		             <p style="text-align: center; font-weight:bold; font-size: 25px; font-family: sans-serif"> Redirecting to Ward Page ...</p>
		    </div>
	        
        <div class="row footer navbar-fixed-bottom">
		<div class="col-md-12">
				<div>Designed By NewCoders</div>
		</div>
	</div>  
    </div> 
</body>
</html>
  
 

