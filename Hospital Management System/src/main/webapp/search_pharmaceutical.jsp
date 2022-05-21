<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Pharmaceuticals?");
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
                <div class="panel-heading">Manage Pharmaceuticals</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Pharmaceuticals List</a></li>
                                <li role="presentation"><a href="#adddoctor">Add Pharmaceuticals</a></li>
                        </ul>

    <!----------------   Display pharmaceutical Data  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Pharmaceutical ID</td>
                        <td>Pharmaceutical Name</td>
                        <td>Quantity</td>
                        <td>Stock Sufficient</td>
                        <td>Options</td>
                </tr>
<%!
		int pharmaceuticalId,quantity;
		String pharmaceuticalName,stock;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	String searchString=request.getParameter("searchString");
	PreparedStatement ps=c.prepareStatement("select * from pharmaceutical where name like '%"+searchString+"%'",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		pharmaceuticalId=rs.getInt(1);
		pharmaceuticalName=rs.getString(2);
		quantity=rs.getInt(3);
		stock=rs.getString(4);
		
		
%>                
                    <tr>
                            <td><%=pharmaceuticalId%></td>
                            <td><%=pharmaceuticalName%></td>
                            <td><%=quantity%></td>
                            <td><%=stock%></td>
                            
                            <td>
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=pharmaceuticalId%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
                            <a  href="delete_pharmaceutical_validation.jsp?pharmaceuticalId=<%=pharmaceuticalId%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                    </tr>
<%
		}
	rs.first();
	rs.previous();
%>
                    
        </table>
        </div>
    
                            
<%
	while(rs.next())
	{
		pharmaceuticalId=rs.getInt(1);
		pharmaceuticalName=rs.getString(2);
		quantity=rs.getInt(3);
		stock=rs.getString(4);
		
%>              
              <div class="modal fade" id="myModal<%=pharmaceuticalId%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Pharmaceutical Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_pharmaceutical_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Pharmaceutical Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="pharmaceuticalId" placeholder="Pharmaceutical ID" value="<%=pharmaceuticalId%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Pharmaceutical Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="pharmaceuticalName" value="<%=pharmaceuticalName%>" placeholder="Pharmaceutical Name" >
                                </div>
                                </div>


                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Quantity</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="quantity" value="<%=quantity%>" placeholder="Quantity" >
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Stock (Sufficient)</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="stock" value="<%=stock%>" placeholder="Stock" >
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



    <!----------------   Add Pharamceuticals Start   --------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="add_pharamceutical_validation.jsp" method="post">
                    
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Pharamceutical Id:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="pharmaceuticalId" placeholder="Pharmaceutical ID Auto Generated" readonly>
                    </div>
                    </div>
                    

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Pharmaceutical Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="pharmaceuticalName" placeholder="Pharmaceutical Name" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Quantity</label>
                    <div class="col-sm-10">
                    <input type="text" class="form-control" name="quantity" placeholder="Pharmaceutical Quantity" required="required">
                     
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">stock (sufficient)</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="stock" placeholder="stock" required="required">
                    </div>
                    </div>

                    


                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Pharmaceutical</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                          
                </div>
           
         </div>
    </div>
	</div>

	<script src="js/bootstrap.min.js"></script>
	</body>
</html>