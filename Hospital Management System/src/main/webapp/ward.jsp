<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Want to Delete this Bed in the Ward?");
			}
		</script>
	</head>
<%@include file="header.jsp"%>
    <body>

       
        <div class="row">
    
<%@include file="menu.jsp"%>
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading" style="font-size: 18px; font-weight: bold;">Manage Ward</div>

        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#doctorlist" >Ward List</a></li>
                    <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#adddoctor">Add Ward</a></li>
                    <li><button type="button"  onclick="Download()" class="btn btn-primary" style="margin-left: 595%; font-size: 17px">Generate Report</button></li>
     
            </ul>

            <!----------------   Display Room Data List start   --------------->
           
               <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover" id="watable">
                   <tr class="active">
                           <td>Ward Number</td>
                           <td>Room Number</td>
                           <td>Availability Status</td>
                           <td>Options</td>
                   </tr>
<%!
		int roomNo;
		int bedNo;
		String status;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from room_info order by room_no,bed_no asc",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		roomNo=rs.getInt(1);
		bedNo=rs.getInt(2);
		status=rs.getString(3);
		
%>
                   <tr>
                           <td><%=roomNo%></td>
                           <td><%=bedNo%></td>
                           <td><%=status%></td>
                           <td>
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=roomNo%><%=bedNo%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a href="delete_room_validation.jsp?roomNo=<%=roomNo%>&bedNo=<%=bedNo%>" class="btn btn-danger" onclick="return confirmDelete()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                           
						   </td>
                   </tr>
<%
	}
	rs.first();
	rs.previous();
%>
           
                  </table>
               </div>  
              <!----------------   Display Room Data List ends   --------------->
              
              <!------ Edit Room Modal Start ---------->
                            
<%
	while(rs.next())
	{
		roomNo=rs.getInt(1);
		bedNo=rs.getInt(2);
		status=rs.getString(3);
		
%>   
              <div class="modal fade" id="myModal<%=roomNo%><%=bedNo%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Ward Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_room_validation.jsp">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Ward Number</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="roomNo" value="<%=roomNo%>" readonly="readonly">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Room Number</label>
                                    <div class="col-sm-4">
                                      <input type="text" class="form-control" name="bedNo" value="<%=bedNo%>" readonly>
                                    </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Status</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="status" value="<%=status%>">
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
<!----------------   Modal ends here  --------------->

        
              
              
              <!----------------   Add Room Start   --------------->
               <div id="adddoctor" class="switchgroup">
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <form class="form-horizontal" action="add_room_validation.jsp">
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Ward Number</label>
                                <div class="col-sm-4">
                                  <input type="number" min="1" max="150" class="form-control" name="roomNo" placeholder="Enter Ward Number" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Room Number</label>
                                <div class="col-sm-4">
                                  <input type="text" min="1" max="150" class="form-control" name="bedNo" placeholder="Enter Bed Number" required>
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Availability Status</label>
                                <div class="col-sm-4">
                                   <input type="text" class="form-control" name="status" placeholder="Available" value="Available" required readonly>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Add Ward Info</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
                   <!----------------   Add Room Ends   --------------->
        </div>
        <!----------------   Panel Body Ends   --------------->
    </div>
    <!-----------  Content Menu Tab Ends   ------------>
</div>
<!-------   Content Area Ends  --------->
        </div>
        <script src="js/bootstrap.min.js"></script>
        
         <script>
        function Download(){
			 
			   var sTable = document.getElementById('watable').outerHTML;

			        // CREATE A WINDOW OBJECT.
			        var win = window.open('', '', 'height=700,width=700');

			        win.document.write('<html><head>');
			        win.document.write('<title>List of Wards with Room</title>');   // <title> FOR PDF HEADER.    
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