<%@page import="java.sql.*" %>


<%



        String pid=request.getParameter("patientid");

	String pname=request.getParameter("patientname");

	String email=request.getParameter("email");

	String pwd=request.getParameter("pwd");

	String add=request.getParameter("add");

	String phone=request.getParameter("phone");

	String rov=request.getParameter("rov");

	String roomNo=request.getParameter("roomNo");

	String bedNo=request.getParameter("bed_no");

	String doct=request.getParameter("doct");

	String gender=request.getParameter("gender");

	String joindate=request.getParameter("joindate");

	String age=request.getParameter("age");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into patient_info(pname,gender,age,phone,purpose_of_adm,ward_no,room_no,doc_name,date_ad,email,address) values(?,?,?,?,?,?,?,?,?,?,?)");
  
      	ps.setString(1,pname);
      	ps.setString(2,gender);
     	ps.setInt(3,Integer.parseInt(age));
     	ps.setString(4,phone);
     	ps.setString(5,rov);
      	ps.setInt(6,Integer.parseInt(roomNo));
      	ps.setInt(7,Integer.parseInt(bedNo));
      	ps.setString(8,doct);
      	ps.setString(9,joindate);
      	ps.setString(10,email);
      	ps.setString(12,add);

	int i =ps.executeUpdate();
  
	if(i>0)

	{
		ps=con.prepareStatement("update room_info set status=? where room_no=? and bed_no=?");
		ps.setString(1,"busy");
      		ps.setInt(2,Integer.parseInt(roomNo));
	      	ps.setInt(3,Integer.parseInt(bedNo)); 
		ps.executeUpdate();
%>
<div style="text-align:center;margin-top:25%">
<font color="magenta">
<script type="text/javascript">
function Redirect()
{
    window.location="patients.jsp";
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
		             <p style="text-align: center; padding: 85px 0px 40px 0px; font-weight:bold; font-size: 25px; font-family: sans-serif">NEW PATIENT DETAILS ADDED SUCCESSFULLY.</p>
		             <p style="text-align: center; font-weight:bold; font-size: 25px; font-family: sans-serif"> REDIRECTING TO PATIENT PAGE ...</p>
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
  
 


  
