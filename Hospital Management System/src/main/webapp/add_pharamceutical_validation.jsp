<%@page import="java.sql.*" %>


<%



		    String id=request.getParameter("pharmaceuticalId");
		
			String name=request.getParameter("pharmaceuticalName");
		
			String quantity=request.getParameter("quantity");
		
			String stock=request.getParameter("stock");



        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into pharmaceutical (name,quantity,stock) values(?,?,?)");
  
      	ps.setString(1,name);
      	ps.setInt(2,Integer.parseInt(quantity));
      	ps.setString(3,stock);
 

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:25%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="pharmaceutical.jsp";
}

setTimeout('Redirect()', 2000);
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
        
		<!--Add Bootstrap, Style, jQuery -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<script src="js/jquery.js"></script>		
</head>


   <body>

        <div class="container-fluid">
           
            <!---------------------------------- Header Starts Here -------------------------------------------->
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
		 <!------------------------------------- Header Ends Here --------------------------------------------------->
		    
		    
		    <!-- Body -->
		    <div style=" margin-top: -200px; margin-left: 400px;  height: 300px; width:700px; background-color:#276B9C; color: #fff; ">
		             <p style="text-align: center; padding: 85px 0px 40px 0px; font-weight:bold; font-size: 25px; font-family: sans-serif">NEW PHARMACEUTICALS DETAILS ADDED SUCCESSFULLY.</p>
		             <p style="text-align: center; font-weight:bold; font-size: 25px; font-family: sans-serif"> REDIRECTING TO PHARMACEUTICALS PAGE ...</p>
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
  
 


  