<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Patient?");
			}
		</script>
		  <script src="validation.js"></script>
	</head>
<%@include file="header.jsp"%>
    <body>
       
        <div class="row">
		
<%@include file="menu.jsp"%>
				<!---- Content Ares Start  -------->
				<div class="col-md-10 maincontent" >
			<!----------------   Menu Tab   --------------->
					
							<div class="panel panel-default contentinside">
								<div class="panel-heading">Manage Patient
								<div class="form-group">
        
               <!----------------------------Search  -------------------------------> 
               <form action="search_patients.jsp" method="post">
                 <ul class="nav nav-tabs doctor" style="margin-left: 74%; font-size:16px">
                   <li> <input type="text"  name="searchString" placeholder="        Search By Name" required></li>
                   <li><button type="submit" style="color:black;margin:0 30%; width:100px; border-width:2px;"><b>Search</b></button></li>
                 </ul>
               </form>
  
             </div>
          </div>
								
								
								
								
								
								
								
								<!----------------   Panel body Start   --------------->
								<div class="panel-body">
									<ul class="nav nav-tabs doctor">
										<li role="presentation"style="font-size: 18px; font-weight: bold;"><a href="#doctorlist">Patient List</a></li>
										<li role="presentation"style="font-size: 18px; font-weight: bold;"><a href="#adddoctor">Add Patient</a></li>
                                        <li><button type="button"  onclick="Download()" class="btn btn-primary" style="margin-left: 595%; font-size: 17px">Generate Report</button></li>
									</ul>
							
						
										<!----------------   Display Patients Data List Start  --------------->
										<div id="doctorlist" class="switchgroup" >
											<table class="table table-bordered table-hover" id="patable">
												<tr class="active">
													<td>Patient ID</td>
													<td>Patient Name</td>
													<td>Address</td>
													<td>Sex</td>
													<td>Age</td>
													<td>Contact Number</td>
													<td>Email</td>
													<td>Purpose of Admit</td>
													<td>Ward No</td>
													<td>Room No</td>
													<td>Date Of Admit</td>
													<td>Doctor</td>
													<td>Options</td>
													
												</tr>
<%!
		int doctId;
		String doctName;	
		int id,age,room_no,bed_no;
		String name,gender,phone,rov,doc_name,admit_date,add,email;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from patient_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		gender=rs.getString(3);
		age=rs.getInt(4);
		phone=rs.getString(5);
		rov=rs.getString(6);
		room_no=rs.getInt(7);
		bed_no=rs.getInt(8);
		doc_name=rs.getString(9);
		admit_date=rs.getString(10);
		email=rs.getString(11);
		add=rs.getString(13);
	
%>          
							<tr>
				                 <td><%=id%></td>
				                 <td><%=name%></td>
				                 <td><%=add%></td>
				                 <td><%=gender%></td>
				                 <td><%=age%></td>
				                 <td><%=phone%></td>
                                 <td><%=email%></td>
                                 <td><%=rov%></td>
                                 <td><%=room_no%></td>
                                 <td><%=bed_no%></td>
                                 <td><%=admit_date%></td>
                                 <td><%=doc_name%></td>
                              
								 <td>
						<a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=id%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
			            <a  href="delete_patient_validation.jsp?patientId=<%=id%>&roomNo=<%=room_no%>&bedNo=<%=bed_no%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>	
								</td>
							</tr>
						<%
							}
							rs.first();
							rs.previous();
						%>
																		
						</table>
						</div>
						<!----------------   Display Patient Data List Ends  --------------->
				
					    <!------ Patient Edit Info Modal Start Here ---------->
                            
										<%
											while(rs.next())
											{
												id=rs.getInt(1);
												name=rs.getString(2);
												gender=rs.getString(3);
												age=rs.getInt(4);
												phone=rs.getString(5);
												rov=rs.getString(6);
												room_no=rs.getInt(7);
												bed_no=rs.getInt(8);
												doc_name=rs.getString(9);
												admit_date=rs.getString(10);
												email=rs.getString(11);
												add=rs.getString(13);
												
										%>              
              <div class="modal fade" id="myModal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Patient Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_patient_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="patientid" placeholder="Auto-generated Unique Id" value="<%=id%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Full Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="patientname" value="<%=name%>" placeholder="Enter Patient Full Name" required>
                                </div>
                                </div>

								<div class="form-group">
	                           <label class="col-sm-2 control-label">Address</label>
	                           <div class="col-sm-10">
	                            <input type="text" class="form-control" name="add" value="<%=add%>" placeholder="Enter Patient Address" required>
	                           </div>
	                    	   </div>
	                    	   
	                    	   
	                    	   <div class="form-group">
                                <label  class="col-sm-2 control-label">Sex</label>
                                <div class="col-sm-10">
                                   <select class="form-control" name="gender" >
                                      <option>Male</option>
                                      <option> Female</option>                    
                                   </select>
                                </div>
                                </div>
                                
                         		<div class="form-group">
                        <label  class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="age" value="<%=age%>" min="1" max="150" placeholder="Enter Your Age" required>
                        </div>
                    </div>

                                <div class="form-group">
                        <label  class="col-sm-2 control-label">Contact Number</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="<%=phone%>" placeholder="Enter Your Mobile Number" title="Please Enter Valid Mobile Number" required >
                        </div>
                    </div>
                                
                                <div class="form-group">
                                      <label class="col-sm-2 control-label">Email</label>
                                      <div class="col-sm-10">
                                          <input type="email" class="form-control" name="email" value="<%=email%>" placeholder="Email" required>
                                      </div>
                                </div>

                    

                    <div class="form-group">
                                <label  class="col-sm-2 control-label">Purpose of Admission</label>
                                <div class="col-sm-10">
                                      <select class="form-control" name="rov">
                                                            <option>Fever / Dengue</option>
                                                            <option>Accident</option>
                                                             <option>COVID 19</option>
                                                            <option>Pregnancy</option>
                                                            <option>Heart Diseases / Heart Attacks</option>
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
                        <select class="form-control" name="roomNo" id="roomNo<%=id%>" onchange="retrieveBeds2('<%=id%>')">
                        <option selected="selected"><%=room_no%></option>
<%! int roomNo1,bedNo1;%>
<%
	PreparedStatement ps1=c.prepareStatement("select distinct room_no from room_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		roomNo1=rs1.getInt(1);
%>		                       
                        
                          <option value="<%=roomNo1%>"><%=roomNo1%></option>
<%
	}
	ps1.close();
	rs1.close();
%>                        
                        
                        </select>
                        </div>
                    </div>  

						<div class="form-group">
						<label  class="col-sm-2 control-label">Room No</label>
						<div class="col-sm-10" id="beds<%=id%>">
						  <select class="form-control" name="bed_no">
						<option selected="selected"><%=bed_no%></option>
<%
	PreparedStatement ps3=c.prepareStatement("select distinct bed_no from room_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs3=ps3.executeQuery();
	while(rs3.next())
	{
		 bedNo1=rs3.getInt(1);
%>		                       
                        
                          <option value="<%=bedNo1%>"><%=bedNo1%></option>
<%
	}
	ps3.close();
	rs3.close();
%>   						
						</select>	
						</div>
						</div>


						<div class="form-group">
						<label  class="col-sm-2 control-label">Doctor Incharge</label>
						<div class="col-sm-10">
							<select class="form-control" name="doct">
							<option selected="selected"><%=doc_name%></option>
																					  
<%
	PreparedStatement ps2=c.prepareStatement("select * from doctor_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs2=ps2.executeQuery();
	while(rs2.next())
	{
		doctId=rs2.getInt(1);
		doctName=rs2.getString(2);
%>		                       
                        
                          <option value="<%=doctName%>"><%=doctName%>(<%=doctId%>)</option>
<%
	}
	ps2.close();
	rs2.close();
%>
</select>
	</div>
	</div>

                     
                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Date of Admit</label>
                        <div class="col-sm-10">
                          <input type="date" class="form-control" name="admit_date" value="<%=admit_date%>" placeholder="Admit Date " >
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
<!----------------   Modal ends here  --------------->
										<!----------------   Add Patient Start   --------------->
										<div id="adddoctor" class="switchgroup">
											<div class="panel panel-default">
												<div class="panel-body">
													<form class="form-horizontal" action="add_patient_validation.jsp">
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Patient Id</label>
															 <div class="col-sm-10">
                                                                <input type="number" class="form-control" name="patientid" placeholder="Auto-generated Unique Id" readonly>
															</div>
												        </div>
                                                                                                            
															<div class="form-group">
															<label  class="col-sm-2 control-label">Full Name</label>
															<div class="col-sm-10">
                                                                <input type="text" class="form-control" name="patientname"  placeholder="Enter Your Full Name" required>
															</div>
												            </div>
												            
												            <div class="form-group">
															<label  class="col-sm-2 control-label">Address</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="add" placeholder="Enter Patient Address" required>
															</div>
															</div>
															
															
															<div class="form-group">    
                                                                <label class="col-sm-2 control-label">Sex</label>
                                                                <div class="col-sm-2">
                                                            <select class="form-control" name="gender">
                                                                  <option>Male</option>
                                                                  <option>Female</option>
                                                                  </select>
                                                                    </div>
                                                            </div>
															
															
															<div class="form-group">
															<label  class="col-sm-2 control-label">Age</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="age" min="1" max="150" placeholder="Enter Patient Age" required>
															</div>
															</div>
															
															<div class="form-group">
															<label  class="col-sm-2 control-label">Contact No</label>
															<div class="col-sm-10">
															  <input type="text" class="form-control" name="phone" placeholder="Enter Patient Contact No." title="Please Enter Valid Mobile Number"  required>
															</div>
															</div>
															
															
															<div class="form-group">
															<label class="col-sm-2 control-label">Email</label>
															<div class="col-sm-10">
															  <input type="email" class="form-control" name="email" placeholder="example@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please Enter Valid Email ID" required>
															</div>
														  </div>
														  
														
															
															<div class="form-group">
															<label  class="col-sm-2 control-label">Purpose of Admit</label>
															<div class="col-sm-10">
															  
													<select class="form-control" name="rov">
                                                            <option>Fever / Dengue</option>
                                                            <option>Accident</option>
                                                             <option>COVID 19</option>
                                                            <option>Pregnancy</option>
                                                            <option>Heart Diseases / Heart Attacks</option>
                                                            <option>Other</option>
                                       				</select>
															  
															  </div>
															</div>


						 									<div class="form-group">
															<label  class="col-sm-2 control-label">Ward No</label>
															<div class="col-sm-10">
															  <select class="form-control" name="roomNo" id="roomNo" onchange="retrieveBeds()">
															<option selected="selected">Select Ward</option>
<% int roomNo,bedNo;%>
<%
	PreparedStatement ps3=c.prepareStatement("select distinct room_no from room_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs3=ps3.executeQuery();
	while(rs3.next())
	{
		roomNo=rs3.getInt(1);
%>		                       
                        
                          <option value="<%=roomNo%>"><%=roomNo%></option>
<%
	}
	ps3.close();
	rs3.close();
%>
															</select>
															</div>
															</div>

															 <div class="form-group">
															<label  class="col-sm-2 control-label">Room No.</label>
															<div class="col-sm-10" id="beds">
															  <select class="form-control" name="bed_no">
															<option selected="selected">Select Room</option>
<%
	PreparedStatement ps2=c.prepareStatement("select distinct room_no from room_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs2=ps2.executeQuery();
	while(rs2.next())
	{
		bedNo=rs2.getInt(1);
%>		                       
                        
                          <option value="<%=bedNo%>"><%=bedNo%></option>
<%
	}
	ps2.close();
	rs2.close();
%>																
															</select>	
															</div>
															</div>
															
															
														

						 									<div class="form-group">
															<label  class="col-sm-2 control-label">Doctor In Charge</label>
																<div class="col-sm-10">
															<select class="form-control" name="doct">
															<option selected="selected">Select Doctor</option>
															  
<%
	PreparedStatement ps4=c.prepareStatement("select * from doctor_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs4=ps4.executeQuery();
	while(rs4.next())
	{
		doctId=rs4.getInt(1);
		doctName=rs4.getString(2);
%>		                       
                        
                          <option value="<%=doctName%>"><%=doctName%>(<%=doctId%>)</option>
<%
	}
	ps4.close();
	rs4.close();
%>
															</select>
															</div>
															</div>
                                                            
                                                        <div class="form-group">
															<label  class="col-sm-2 control-label">Admit Date</label>
															<div class="col-sm-10">
															  <input type="date" class="form-control" name="joindate" placeholder="Admit Date">
															</div>
															</div>
                                                        
														 
														  <div class="form-group">
															<div class="col-sm-offset-2 col-sm-10">
															  <button type="submit" class="btn btn-primary">Add Patient</button>
															</div>
														  </div>
													</form>
												
												 </div>
											</div>
										</div>
										<!----------------   Add Patients Ends   --------------->
								</div>
								<!----------------   Panel body Ends   --------------->
							</div>
				</div>
			</div>
	
				
				
				
		
		<script src="js/bootstrap.min.js"></script>
		
		
		 <script>
        function Download(){
			 
			   var sTable = document.getElementById('patable').outerHTML;

			        // CREATE A WINDOW OBJECT.
			        var win = window.open('', '', 'height=700,width=700');

			        win.document.write('<html><head>');
			        win.document.write('<title>List of Departments</title>');   // <title> FOR PDF HEADER.    
			        win.document.write('</head>');
			        win.document.write('<body>');
			        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
			        win.document.write('</body></html>');

			        win.document.close(); 	// CLOSE THE CURRENT WINDOW.

			        win.print();    // PRINT THE CONTENTS.
			    
			}
        </script>
	</body>
</html>