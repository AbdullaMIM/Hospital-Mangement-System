<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Staff record?");
			}
		</script>
	</head>
<%@include file="header.jsp"%>
    <body>

            

       
        <div class="row">
		
<%@include file="menu.jsp"%>	
	
<!------------------------------------------------ Content Area Start  ----------------------------------------------------->
    <div class="col-md-10 maincontent" >
    
<!-------------------------------------------------   Menu Tab Start   --------------------------------------------------->
    <div class="panel panel-default contentinside">
        <div class="panel-heading" style="font-size: 18px; font-weight: bold;">Manage Staff</div>
        
        
        	<!-- -------------------------------------------Search--------------------------------------------------------- -->
        	<form action="search_nurse.jsp" method="post">
        	  <ul class="nav nav-tabs doctor" style="margin-left: 76%; font-size:16px">
        	  <li> <input type="text" name="searchString" placeholder="          Search By ID" required></li>
        	  <li><button type="submit" style="color:black;margin:0 0%; width:100px; border-width:2px;"><b>Search</b></button></li>
        	  </ul>
        	</form>
        
        <!------------------------------------------   Panel body Start   ---------------------------------------------------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#doctorlist">Staff List</a></li>
                    <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#adddoctor">Add Staff</a></li>
                    <li><button type="button"  onclick="Download()" class="btn btn-primary" style="margin-left: 713%; font-size: 17px">Generate Report</button></li>
            </ul>

        <!------------------------------------   Display Staff Data List Start  ------------------------------------------------------>
    
        <div id="doctorlist" class="switchgroup">
            <table class="table table-bordered table-hover" id="sttable">
                <tr class="active">
                        <td>Nurse ID</td>
                        <td>Nurse Name</td>
                        <td>Email</td>
                        <td>Address</td>
                        <td>Phone No.</td>
                        <td>Options</td>
                </tr>

<%!
		int nurseId;
		String nurseName,email,add,phone;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from nurse_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		nurseId=rs.getInt(1);
		nurseName=rs.getString(2);
		email=rs.getString(3);
		add=rs.getString(5);
		phone=rs.getString(6);
		
%>                  
                    <tr>
                            <td><%=nurseId%></td>
                            <td><%=nurseName%></td>
                            <td><%=email%></td>
                            <td><%=add%></td>
                            <td><%=phone%></td>
                            <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=nurseId%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a  href="delete_nurse_validation.jsp?nurseId=<%=nurseId%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                    </tr>
<%
	}
	rs.first();
	rs.previous();
%>                    
            </table>
        </div>
        <!--------------------------------------------   Display Staff Data List Ends  ------------------------------------------------------------------>

              <!-------------------------------------------- Edit Staff Modal Start --------------------------------------------------------------------->
                            
<%
	while(rs.next())
	{
		nurseId=rs.getInt(1);
		nurseName=rs.getString(2);
		email=rs.getString(3);
		add=rs.getString(5);
		phone=rs.getString(6);
		
%>   
              <div class="modal fade" id="myModal<%=nurseId%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Nurse Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_nurse_validation.jsp">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Nurse Id</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="nurseId" value="<%=nurseId%>" readonly="readonly">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Name</label>
                                    <div class="col-sm-4">
                                      <input type="text" class="form-control" name="nurseName" value="<%=nurseName%>" required="required">
                                    </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Email</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="email" value="<%=email%>" required="required">
                                       </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Address</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="add" value="<%=add%>" required="required">
                                       </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Phone</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="phone" value="<%=phone%>" pattern="[1-9][0-9]{9}" maxlength="10" required="required">
                                       </div>
                                 </div>
                               
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Update"></button>
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
<!------------------------------------------------------   Modal ends here  ----------------------------------------------------->

        <!---------------------------------------------   Add Staff Start   ------------------------------------------------------>
        <div id="adddoctor" class="switchgroup">
            <div class="panel panel-default">
                <div class="panel-body">
                <form class="form-horizontal" action="add_nurse_validation.jsp">
                    <div class="form-group">
                    
                        <label  class="col-sm-2 control-label">Nurse Id:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="id" placeholder="Nurse ID auto generated" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                             <input type="text" class="form-control" name="name" placeholder="Name" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">Email</label>
                      <div class="col-sm-10">
                          <input type="Email" class="form-control" name="email" placeholder="Email" required="required">
                      </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="address" placeholder="Address" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="number" class="form-control" name="phone" placeholder="Phone No." maxlength="10" required="required">
                        </div>
                   </div>

                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Staff</button>
                          </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
        <!---------------------------------------------------  Add Staff Ends   ------------------------------------------------------------>
        </div>
        <!--------------------------------------------------- Panel body Ends   ------------------------------------------------------------->
    </div>
<!----------------------------------------------------------   Menu Tab Ends   -------------------------------------------------------------->
    </div>
<!----------------------------------------------------------- Content Areas Ends  ----------------------------------------------------------->
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
	
	<!--------------------------------------------  Generate Report of Departments / Print Departments Starts Here ------------------------->
        <script>
        function Download(){
			 
			   var sTable = document.getElementById('sttable').outerHTML;


			        // CREATE A WINDOW OBJECT.
			        var win = window.open('', '', 'height=700,width=700');

			        win.document.write('<html><head>');
			        win.document.write('<title>List of Staff</title>');   // <title> FOR PDF HEADER.
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