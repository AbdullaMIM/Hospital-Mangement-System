<!DOCTYPE html>
<%@page import="java.sql.*"%>

<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Want to Delete This Doctor?");
			}
		</script>
	</head>
 
 <%@include file="header.jsp"%>
    <body>
      
        <div class="row">
		
 <%@include file="menu.jsp"%>

<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    
    <!----------------   Menu Tab   --------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading" style="font-size: 18px; font-weight: bold;">Manage Doctor</div>
                
                
                
                
                
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#doctorlist">Doctor List</a></li>
                                <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#adddoctor">Add New Doctor</a></li>
                        </ul>

    <!----------------   Display Doctor Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Doctor ID</td>
                        <td>Full Name</td>
                        <td>Email</td>
                        <td>Address</td>
                        <td>Contact Number</td>
                        <td>Department</td>
                        <td>Options</td>
                </tr>
<%!
		int deptId;
		String deptName;	
		int id;
		String name,email,pwd,add,phone,dept;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
    Connection c=(Connection)application.getAttribute("connection");
    String searchString=request.getParameter("searchString");
    PreparedStatement ps=c.prepareStatement("select * from doctor_info where name like '%"+searchString+"%' or deptname like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs=ps.executeQuery();
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		email=rs.getString(3);
		add=rs.getString(4);
		phone=rs.getString(5);
		dept=rs.getString(6);
		
%>                
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=email%></td>
                            <td><%=add%></td>
                            <td><%=phone%></td>
                            <td><%=dept%></td>
                            <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=id%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                           <a  href="delete_doct_validation.jsp?doctId=<%=id%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                    </tr>
<%
		}
	rs.first();
	rs.previous();
%>
                 
        </table>
        </div>
    <!----------------   Display Doctor Data List Ends  --------------->
   
   
   
   
   
    <!------ Doctor Edit Info Modal Start Here ---------->
                            
<%
	while(rs.next())
	{
		id=rs.getInt(1);
		name=rs.getString(2);
		email=rs.getString(3);
		//pwd=rs.getString(4);
		add=rs.getString(4);
		phone=rs.getString(5);
		dept=rs.getString(6);
		
%>              
              <div class="modal fade" id="myModal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Doctor</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_doct_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Doctor ID</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="doctid" placeholder="Doctor ID" value="<%=id%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Full Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="doctname" value="<%=name%>" placeholder="Enter Doctor Name" required>
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">Email</label>
                                      <div class="col-sm-10">
                                          <input type="email" class="form-control" name="email" value="<%=email%>" placeholder="example@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please Enter Valid Email ID" required >
                                      </div>
                                </div>

                    

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" value="<%=add%>" placeholder="Enter Home Address of Doctor" required>
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Contact Number</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="<%=phone%>" placeholder="Enter a Mobile Number of Doctor" title="Please Enter Valid Mobile Number" pattern="[0-9]{10}" required >
                        </div>
                    </div>
              
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="dept">
                               
<%
	ps=c.prepareStatement("select * from department",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		deptId=rs.getInt(1);
		deptName=rs.getString(2);
%>		                       
                        
                          <option value="<%=deptName%>"><%=deptName%>(<%=deptId%>)</option>
<%
	}
%>
                                                           
                        </select>
                   
                              
                   
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
<!----------------   Modal ends here  --------------->





    <!----------------   Add Doctor Start   --------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="add_doctor_validation.jsp" method="post">
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Doctor ID</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control" name="doctid" placeholder="Auto-generated Unique ID" readonly>
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Full Name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="doctname" placeholder="Enter Doctor Name" required>
                    </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Email</label>
                          <div class="col-sm-8">
                              <input type="email" class="form-control" name="email" placeholder="example@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please Enter Valid Email ID" required>
                          </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="add" placeholder="Enter Home Address of Doctor" required>
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Contact Number</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="phone" placeholder="Enter a Mobile Number of Doctor" title="Please Enter Valid Mobile Number" pattern="[0-9]{10}" required>
                        </div>
                    </div>
                 
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-8">

                        <select class="form-control" name="dept">
                        <option selected="selected">Select Department</option>
<%
	ps=c.prepareStatement("select * from department",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		deptId=rs.getInt(1);
		deptName=rs.getString(2);
%>		                       
                        
                          <option value="<%=deptName%>"><%=deptName%>(<%=deptId%>)</option>
<%
	}
%>
                                                           
                        </select>
                        </div>
                    </div>


                    <div class="form-group">
                          <div class="col-sm-offset-5 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Doctor</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                           <!----------------   Add Doctor Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>

	<script src="js/bootstrap.min.js"></script>
	</body>
</html>