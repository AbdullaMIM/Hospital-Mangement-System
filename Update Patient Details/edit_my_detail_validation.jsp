<%@page import="java.sql.*" %>


<%


    String pid=request.getParameter("patientid");

	String pname=request.getParameter("patientname");

	String email=request.getParameter("email");

	String address=request.getParameter("address");

	String phone=request.getParameter("phone");

	String poa=request.getParameter("poa");

	String wardNo=request.getParameter("wardNo");

	String roomNo=request.getParameter("room_no");

	String doctor=request.getParameter("doctor");

	String gender=request.getParameter("gender");

	String admitDate=request.getParameter("admit_date");

	String age=request.getParameter("age");

	

        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update patient_info set pname=?,gender=?,age=?,phone=?,purpose_of_adm=?,ward_no=?,room_no=?,doc_name=?,date_ad=?,email=?,address=? where id=?");
  
      	ps.setString(1,pname);
      	ps.setString(2,gender);
     	ps.setInt(3,Integer.parseInt(age));
     	ps.setString(4,phone);
     	ps.setString(5,poa);
      	ps.setInt(6,Integer.parseInt(wardNo));
      	ps.setInt(7,Integer.parseInt(roomNo));
      	ps.setString(8,doctor);
      	ps.setString(9,admitDate);
      	ps.setString(10,email);
      	ps.setString(11,address);
      	ps.setInt(12,Integer.parseInt(pid));
	    int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

       <div style="text-align:center;margin-top:25%">
       <font color="green">
       <script type="text/javascript">
       function Redirect()
       {
           window.location="patient_page.jsp";
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




<html>

<head lang="en">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>A PLUS HOSPITALS</title>
        
		<!-- Add Bootstrap, CSS styles & jquery -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<script src="js/jquery.js"></script>		
</head>


   <body>

        <div class="container-fluid">
           
            <!------------------------------------------Header Starts Here------------------------------------------>	   
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
		   <!------------------------------------------Header Ends Here------------------------------------------------>
	     
		    
		    
		    <!---------------------------------------------Body--------------------------------------------------------->
		    <div style=" margin-top: -200px; margin-left: 400px;  height: 300px; width: 700px; background-color:#276B9C; color: #fff; ">
		             <p style="text-align: center; padding: 85px 0px 40px 0px; font-weight:bold; font-size: 25px; font-family: sans-serif">YOU HAVE SUCCESSFULLY UPDATED YOUR DETAILS.</p>
		             <p style="text-align: center; font-weight:bold; font-size: 25px; font-family: sans-serif"> REDIRECT TO PROFILE PAGE ...</p>
		    </div>
	        
	       
	       <!---------------------------------------------Footer--------------------------------------------------------->
           <div class="row footer navbar-fixed-bottom">
		     <div class="col-md-12">
				 <div>Designed By NewCoders</div>
		     </div>
		   </div>  
   
    </div> 
    
    
</body>
</html>
  
 