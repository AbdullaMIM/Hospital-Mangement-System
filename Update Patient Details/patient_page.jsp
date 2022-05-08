
<!DOCTYPE html>

<%@page import="java.sql.*"%>

<html lang="en">
	
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Want to Delete Your Account?");
			}
		</script>
		<script src="validation.js"></script>
	</head>
	
	
       <%@include file="header_patient.jsp"%>
    
    
    
       
   <body>
       
       <div class="row">

       <%@include file="menu_patient.jsp"%>
				
				
		<!---- Content Of Patient Profile Details Start  -------->
		<div class="col-md-10 maincontent" >
			   
			    
		<!----------------   Menu Tab   --------------->
	     <br><br>
					
		<div class="panel panel-default contentinside">
								
								
		<!----------------   Panel body Start   --------------->
		
		<div class="panel-body">
		<ul class="nav nav-tabs doctor">
	         <li style="font-size: 20px; font-weight: bold; "role="presentation"><a href="#doctorlist">My Details</a></li>
        </ul>
			
			
			
						
		<!-----------------------------------  Display Patients Data List Start  --------------------------------->
		<div id="doctorlist" class="switchgroup">
			<table class="table table-bordered table-hover">
				<tr class="active">
				 <td>ID</td>
				 <td>Full Name</td>
				 <td>Address</td>
				 <td>Sex</td>
				 <td>Age</td>											
				 <td>Contact Number</td>
				 <td>Email</td>
				 <td>Purpose of Admission</td>
				 <td>Ward Number</td>
				 <td>Room Number</td>
				 <td>Date of Admission</td>
				 <td>Doctor</td>	
				 <td>Options</td>	
				</tr>
                                   
          <%!
		                        
	                                 int id,age,ward_no,room_no;
		                             String name,gender,phone,poa,doctor,admit_date,address,email,pwd;
		                             PreparedStatement ps;
		                             ResultSet rs;
          %>
                                   
          <%
	                                  Connection c=(Connection)application.getAttribute("connection");
	                                  id=Integer.parseInt((String)session.getAttribute("id"));
	                                  PreparedStatement ps=c.prepareStatement("select * from patient_info where id=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                      ps.setInt(1,id);
	                                  rs=ps.executeQuery();
	
	                                  if(rs.next())
	                                  {
	                                    	id=rs.getInt(1);
		                                    name=rs.getString(2);
	                                     	gender=rs.getString(3);
	                                    	age=rs.getInt(4);
		                                    phone=rs.getString(5);
		                                    poa=rs.getString(6);
		                                    ward_no=rs.getInt(7);
		                                    room_no=rs.getInt(8);
		                                    doctor=rs.getString(9);
		                                    admit_date=rs.getString(10);
		                                    email=rs.getString(11);
	                                        address=rs.getString(13);
	 
           %>          
			                    
			                    <tr>
				                 <td><%=id%></td>
				                 <td><%=name%></td>
				                 <td><%=address%></td>
				                 <td><%=gender%></td>
				                 <td><%=age%></td>
				                 <td><%=phone%></td>
                                 <td><%=email%></td>
                                 <td><%=poa%></td>
                                 <td><%=ward_no%></td>
                                 <td><%=room_no%></td>
                                 <td><%=admit_date%></td>
                                 <td><%=doctor%></td>
                              
								 <td>
								   <a  href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=id%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
			                       <a  href="delete_patient_validation.jsp?patientId=<%=id%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>	
								</td>
			                   </tr>
                              
            <%
	                          }
	                          rs.first();
	                          rs.previous();
            %>
												
			</table>
		</div>
    <!---------------------------------------------  Display Patient Data List Ends  ------------------------------------------>
				
					   
					   
					   
					   
	<!---------------------------------------------  Patient Edit Info Modal Start Here ----------------------------------------->
                            
    <%
	   if(rs.next())
	   {
		  id=rs.getInt(1);
		  name=rs.getString(2);
		  gender=rs.getString(3);
		  age=rs.getInt(4);
		  phone=rs.getString(5);
		  poa=rs.getString(6);
		  ward_no=rs.getInt(7);
		  room_no=rs.getInt(8);
		  doctor=rs.getString(9);
		  admit_date=rs.getString(10);
		  email=rs.getString(11);
		  address=rs.getString(13);
		
    %>              
              
     <div class="modal fade" id="myModal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
       <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
                       
                    
                <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <h4 class="modal-title" id="myModalLabel">Edit Your Profile</h4>
                </div>
                        
                        
                <div class="modal-body">
                  <div class="panel panel-default">
                     <div class="panel-body">
                             
                        <form class="form-horizontal" action="edit_my_detail_validation.jsp" method="post">
                               
                            <div class="form-group">
							    <label  class="col-sm-2 control-label" style="font-size:15px ">Patient ID</label>
									<div class="col-sm-10">
                                          <input type="number" class="form-control" name="patientid" value="<%=id%>" placeholder="Auto-generated Unique Id" readonly>
									</div>
							</div>


                             <div class="form-group">
								   <label  class="col-sm-2 control-label" style="font-size:15px">Full Name</label>
									   <div class="col-sm-10">
                                            <input type="text" class="form-control" name="patientname"  value="<%=name%>" placeholder="Enter Your Full Name" required>
									   </div>
							 </div>
                               
                               
                               <div class="form-group">
								<label  class="col-sm-2 control-label" style="font-size:15px">Address</label>
									<div class="col-sm-10">
											  <input type="text" class="form-control" name="address" value="<%=address%>" placeholder="Enter Your Home Address" required>
									</div>
								</div>
                               
                               
                                <div class="form-group">
                                 <label  class="col-sm-2 control-label">Sex</label>
                                   <div class="col-sm-10">
                                     <select class="form-control" name="gender">
                                       <option>Male</option>
                                       <option> Female</option>                    
                                     </select>
                                   </div>
                                </div>
                               
                               
                                <div class="form-group">
								  <label  class="col-sm-2 control-label" style="font-size:15px">Age</label>
								     <div class="col-sm-10">
							             <input type="number" min="1" max="150" class="form-control" name="age" value="<%=age%>" placeholder="Enter Your Age" required>
							         </div>
							     </div>
                                
                                
                                 <div class="form-group">
									<label  class="col-sm-2 control-label" style="font-size:15px">Contact Number</label>
								       <div class="col-sm-10">
							               <input type="text" class="form-control" name="phone" placeholder="Enter Your Mobile Number"  value="<%=phone%>" title="Please Enter Valid Mobile Number" pattern="[0-9]{10}" required>
								       </div>
								  </div>

                               

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Purpose of Admission</label>
                                <div class="col-sm-10">
                                      <select class="form-control" name="poa">
                                                            <option>Fever or Dengue</option>
                                                            <option>Accident</option>
                                                            <option>Cancer</option>
                                                            <option>Heart Diseases or Heart Attacks</option>
                                                            <option>Pregnancy</option>
                                                            <option>Other</option>
                                       </select>
                                </div>
                                </div>
                                
                                
                                <div class="form-group">
								    <label class="col-sm-2 control-label" style="font-size:15px">Email</label>
										<div class="col-sm-10">
								               <input type="email" class="form-control" name="email" id="email" value="<%=email%>" placeholder="example@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please Enter Valid Email ID" required>
							            </div>
							    </div>

                                
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Ward Number</label>
                                <div class="col-sm-10">
                                     <input  type="number" min="1" max="20" class="form-control" name="wardNo" value="<%=ward_no%>" placeholder="Room Number" readonly>
                                </div>
                                </div>  
 
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Room Number</label>
                                <div class="col-sm-10" id="beds1">
                                     <input  type="number" min="1" max="20" class="form-control" name="room_no" value="<%=room_no%>" placeholder="Bed Number" readonly>	
                                </div>
                                </div>
                                
                                
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Doctor Incharge</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="doctor" value="<%=doctor%>" placeholder="doc name" readonly>
	                            </div>
	                            </div>
                                
             
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Date of Admission</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="admit_date" value="<%=admit_date%>" placeholder="Admission Date " readonly>
                                </div>
                                </div>
                                                      
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Update">
                                 </div>
                                 
                         </form>
                      
                     </div>
                   </div>
                 </div>
                    
               </div>
             </div>
           </div>

           <%
	           }
	          ps.close();
	          rs.close();
           %>
  <!---------------------------------------------  Patient Edit Info Modal Ends Here ----------------------------------------->

              
		   </div>
			  
  <!----------------------------------------------------   Panel body Ends   -------------------------------------------------->
		
		</div>
	  </div>
	</div>
	
	
		<script src="js/bootstrap.min.js"></script>	
		  
   </body>
</html>