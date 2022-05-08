<!DOCTYPE html>
<%@page import="java.sql.*"%>

<html lang="en">
	
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Want to Delete This Bill Details?");
			}
		</script>
	</head>
	
      <%@include file="header.jsp"%>
  
  
    
   <body>

      <div class="row">
    
      <%@include file="menu.jsp"%>
   
     
      <!-------   Content Area Start  Here--------->
       <div class="col-md-10 maincontent" >

       
       <!-----------  Content Menu Tab Start Here  ------------>
       <div class="panel panel-default contentinside">
         
          <div class="panel-heading" style="font-size: 22px; font-weight: bold;">Manage Billing Information
             <div class="form-group">
        
               <!----------------------------Search  -------------------------------> 
               <form action="search_department.jsp" method="post">
                 <ul class="nav nav-tabs doctor" style="margin-left: 74%; font-size:16px">
                   <li> <input type="text"  name="searchString" placeholder="        Search By Name" required></li>
                   <li><button type="submit" style="color:black;margin:0 30%; width:100px; border-width:2px;"><b>Search</b></button></li>
                 </ul>
               </form>
  
             </div>
          </div>
        
        
        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#doctorlist">Billing List</a></li>
                    <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#adddoctor">Add Billing Information</a></li>
                    <li><button type="button"  onclick="Download()" class="btn btn-primary" style="margin-left: 595%; font-size: 17px">Generate Report</button></li>
     
            </ul>


         
  <!--------------------------------------------------  Display Billing Data List starts Here ------------------------------------------------>
          <div id="doctorlist" class="switchgroup">
             <table class="table table-bordered table-hover" id="detable">
                 <tr class="active">
                     <td>Bill No</td>
                     <td>Patient ID</td>
                     <td>Patient Name</td>
                     <td>Pathology</td>
			   <td>Other charge</td>
			   <td>Misc charge</td>
			   <td>Entry Date</td>
			   <td>Discharge Date</td>
			   <td>Options</td>
                 </tr>
<%!
			int billNo,patientId;double pathoCharge,otherCharge,miscCharge;
		String patientName,entryDate,disDate;
		PreparedStatement ps;
		ResultSet rs;
%>

<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from billing",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		billNo=rs.getInt(1);
		patientId=rs.getInt(2);
		patientName=rs.getString(3);
		otherCharge=rs.getDouble(4);
		pathoCharge=rs.getDouble(5);
		miscCharge=rs.getDouble(6);
		entryDate=rs.getString(7);
		disDate=rs.getString(8);
		
%>
                   
                   <tr>
				    <td><%=billNo%></td>
                            <td><%=patientId%></td>
                            <td><%=patientName%></td>
                            <td><%=pathoCharge%></td>
                            <td><%=otherCharge%></td>
                            <td><%=miscCharge%></td>
                            <td><%=entryDate%></td>
                            <td><%=disDate%></td>
                           <td>
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=billNo%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a href="delete_billing_validation.jsp?billNo=<%=billNo%>" class="btn btn-danger" onclick="return confirmDelete()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
						   </td>
                   </tr>
                   
<%
	}
	
	rs.first();
	rs.previous();
%>
           
          </table>
      </div>  
               
             
              
               
   <!-------------------------------------   Display Billing Information List ends   ----------------------------------------------------------->
        
        
        
        
   <!--------------------------------------  Edit Billing Information Starts Here -------------------------------------------------------------->
                            
<%
	while(rs.next())
	{
		billNo=rs.getInt(1);
		patientId=rs.getInt(2);
		patientName=rs.getString(3);
		otherCharge=rs.getDouble(4);
		pathoCharge=rs.getDouble(5);
		miscCharge=rs.getDouble(6);
		entryDate=rs.getString(7);
		disDate=rs.getString(8);
		
%>   
              <div class="modal fade" id="myModal<%=billNo%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Department</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            
                             <form class="form-horizontal"  action="edit_billing_validation.jsp" method="post">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-3 control-label">Bill No</label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" name="billNo" value="<%=billNo%>" readonly="readonly">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-3 control-label">Patient ID</label>
                                    <div class="col-sm-8">
                                      <input type="text" class="form-control" name="patientid" value="<%=patientId%>" placeholder="Patient Id">
                                    </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-3 control-label">Patient Name</label>
                                       <div class="col-sm-8">
                                         <input type="text" class="form-control" name="patientname" value="<%=patientName%>"  style="height: 50px" placeholder="Name">
                                       </div>
                                 </div>
                               
						
					   <div class="form-group">
                                       <label class="col-sm-3 control-label">Pathology</label>
                                       <div class="col-sm-8">
                                         <input type="text" class="form-control" name="pathoCharge" value="<%=pathoCharge%>"  style="height: 50px" placeholder="pathology">
                                       </div>
                                 </div>


						<div class="form-group">
                                       <label class="col-sm-3 control-label">Other charge</label>
                                       <div class="col-sm-8">
                                        <!--   <input type="text" class="form-control" name="deptDesc" value="<%=deptDesc%>"  style="height: 50px" required> -->
                                       </div>
                                 </div>

						<div class="form-group">
                                       <label class="col-sm-3 control-label">Misc charge</label>
                                       <div class="col-sm-8">
                                         <input type="text" class="form-control" name="miscCharge" value="<%=miscCharge%>"  style="height: 50px" placeholder="Misc Charge">
                                       </div>
                                 </div>

					<div class="form-group">
                                       <label class="col-sm-3 control-label">Entry Date</label>
                                       <div class="col-sm-8">
                                         <input type="text" class="form-control" name="entryDate" value="<%=entryDate%>"  style="height: 50px" placeholder="Entry">
                                       </div>
                                 </div>
					
					<div class="form-group">
                                       <label class="col-sm-3 control-label">Discharge Date</label>
                                       <div class="col-sm-8">
                                         <input type="text" class="form-control" name="disDate" value="<%=disDate%>"  style="height: 50px" placeholder="Discharge Date">
                                       </div>
                                 </div>
					
					

						<div class="form-group">
                                       <label class="col-sm-3 control-label">Options</label>
                                       <div class="col-sm-8">
                                       <!--   <input type="text" class="form-control" name="deptDesc" value="<%=deptDesc%>"  style="height: 50px" required>  -->
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
%>
<!--------------------------------------  Edit Billing Information Ends Here -------------------------------------------------------------->
   
        
        
        
 <!-------------------------------------Add  Billing Information Start Here -------------------------------------------------------------------->
               <div id="adddoctor" class="switchgroup">
                   <div class="panel panel-default">
                       <div class="panel-body">
                          
                           <form class="form-horizontal" method="post" action="add_billing_validation.jsp">
                            
                            <div class="form-group">
                                <label  class="col-sm-3 control-label">Bill No</label>
                                <div class="col-sm-7">
                                  <input type="number" class="form-control" name="billNo" placeholder="Auto-generated Unique ID" readonly>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-3 control-label">Patient ID</label>
                                <div class="col-sm-7">
                                  <input type="text" class="form-control" name="patientid" placeholder="Patient ID" >
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"> Patient Name</label>
                                <div class="col-sm-7">
                                   <input type="text" class="form-control" name="patientname" placeholder="Name" style="height: 50px" required>
                                </div>
                            </div>
					
					  <div class="form-group">
                                <label class="col-sm-3 control-label"> Pathology</label>
                                <div class="col-sm-7">
                                   <input type="text" class="form-control" name="pathoCharge" placeholder="Pathology Charge" style="height: 50px" required>
                                </div>
                            </div>
					
					  <div class="form-group">
                                <label class="col-sm-3 control-label">Other charge</label>
                                <div class="col-sm-7">
                                   <input type="text" class="form-control" name="otherCharge" placeholder="Charge" style="height: 50px" required>
                                </div>
                            </div>
					  <div class="form-group">
                                <label class="col-sm-3 control-label"> Misc charge</label>
                                <div class="col-sm-7">
                                   <input type="text" class="form-control" name="miscCharge" placeholder="Misc Charge" style="height: 50px" required>
                                </div>
                            </div>
					  <div class="form-group">
                                <label class="col-sm-3 control-label">Entry Date</label>
                                <div class="col-sm-7">
                                   <input type="text" class="form-control" name="entryDate"  style="height: 50px" required>
                                </div>
                            </div>
					
					  <div class="form-group">
                                <label class="col-sm-3 control-label">Discharge Date</label>
                                <div class="col-sm-7">
                                   <input type="text" class="form-control" name="disDate"  style="height: 50px" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-10">
                                  <button type="submit" class="btn btn-primary" style="width: 14%; font-size:18px">Add Department</button>
                                </div>
                            </div>
                            
                        </form>
                        
                    </div>
                  </div>
               </div>
 <!-------------------------------------   Add Billing Ends Here ---------------------------------------------------- --------------->
                   
        </div>
 <!--------------------------------------  Panel Body Ends Here ------------------------------------------------------------------------>
   
    </div>
 <!--------------------------------------  Content Menu Tab Ends Here ------------------------------------------------------------------>

 </div>
<!----------------------------------------  Content Area Ends Here --------------------------------------------------------------------->
        
  </div>
        
        
        <script src="js/bootstrap.min.js"></script>
        
        
        <!----------------------------------------------------  Generate Report of Billing / Print Billing Starts Here -------------------->
        <script>
        function Download(){
			 
			   var sTable = document.getElementById('detable').outerHTML;

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