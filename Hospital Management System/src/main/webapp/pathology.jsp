<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete this Diagnosis Information?");
			}
		</script>
	</head>
 <%@include file="header.jsp"%>
    <body>
      
        <div class="row">
		
<%@include file="menu.jsp"%>

<!------------------------------------------------------ Content Areas Start  ---------------------------------------------------------->
    <div class="col-md-10 maincontent" >
    
    
    <!-------------------------------------------------------   Menu Tab   ------------------------------------------------------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading" style="font-size: 18px; font-weight: bold;">Manage Diagnosis</div>
                
                	<!--------------------------------------------Search  ---------------------------------------------------------------> 
               <form action="search_pathology.jsp" method="post">
                 <ul class="nav nav-tabs doctor" style="margin-left: 76%; font-size:16px">
                   <li> <input type="text"  name="searchString" placeholder="          Search By Name" required></li>
                   <li><button type="submit" style="color:black;margin:0 0%; width:100px; border-width:2px;"><b>Search</b></button></li>
                 </ul>
               </form>
        	 
                <!---------------------------------------   Panel body Start   ------------------------------------------------------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#doctorlist">Diagnosis List</a></li>
                                <li role="presentation" style="font-size: 18px; font-weight: bold;"><a href="#adddoctor">Add Diagnosis</a></li>
                                <li><button type="button"  onclick="Download()" class="btn btn-primary" style="margin-left: 650%; font-size: 17px">Generate Report</button></li>
                        </ul>

<!----------------------------------------------   Display Diagnosis Data List Start  ------------------------------------------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover" id="diagtable">
                <tr class="active">
                        <td>Patient Id</td>
                        <td>Patient Name</td>
                        <td>PCR</td>
                        <td>UltraSound Remarks</td>
                        <td>Blood Type</td>
                        <td>CTScan Remarks</td>
                        <td>Options</td>
                </tr>
<%!
		int id;
		String name;	
		String xray,usound,bt,ctscan;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from pathology",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs=ps.executeQuery();
	while(rs.next())
	{
		xray=rs.getString(1);
		usound=rs.getString(2);
		bt=rs.getString(3);
		ctscan=rs.getString(4);
		name=rs.getString(5);
		id=rs.getInt(6);
		
%>                
                    <tr>
                            <td><%=id%></td>
                            <td><%=name%></td>
                            <td><%=xray%></td>
                            <td><%=usound%></td>
                            <td><%=bt%></td>
                            <td><%=ctscan%></td>
                            <td>
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=id%>" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
                            <a  href="delete_patho_validation.jsp?patientId=<%=id%>" onclick="return confirmDelete()" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                    </tr>
<%
		}
	rs.first();
	rs.previous();
%>
        </table>
        </div>
    <!--------------------------------------------   Display Diagnosis Data List Ends  ------------------------------------>
   
    <!-------------------------------------------- Diagnosis Edit Info Modal Start Here ----------------------------------->
                            
<%
	while(rs.next())
	{
		xray=rs.getString(1);
		usound=rs.getString(2);
		bt=rs.getString(3);
		ctscan=rs.getString(4);
		name=rs.getString(5);
		id=rs.getInt(6);
		
%>              
              <div class="modal fade" id="myModal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Diagnosis Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_patho_validation.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Id</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="patientid" placeholder="Patient ID" value="<%=id%>" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Patient Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="patientname" value="<%=name%>" placeholder="Name" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">PCR</label>
                                      <div class="col-sm-10">
                                          <select class="form-control" name="xray">
                     					  <option>Positive</option>                                        
                                          <option>Negative</option> 
                                          </select>
                                      </div>
                                </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">UltraSound</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" name="usound" value="<%=usound%>" placeholder="UltraSound" >
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Blood Test</label>
                        <div class="col-sm-10">
                          <select class="form-control" name="bt" required="required">
                          <option>A Positive</option>                                          
                          <option>A Negative</option>
                          <option>B Positive</option> 
                          <option>B Negative</option> 
                          <option>AB Positive</option> 
                          <option>AB Negative</option> 
                          <option>O Positive</option> 
                          <option>O Negative</option>                               
                          </select>
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">CT-Scan</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="ctscan" value="<%=ctscan%>" placeholder="CT-Scan" >
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
%>
<!-------------------------------------------------   Modal ends here  ----------------------------------------------------------->


    <!--------------------------------------------   Add Diagnosis Info Start   -------------------------------------------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="add_patho_validation.jsp" method="post">
                    <div class="form-group">
                    
                    <label  class="col-sm-2 control-label">Patient Id</label>
                    <div class="col-sm-10">                  	
                    	<select class="form-control" name="patientid">
                    	<option selected="selected">Select Patient ID</option>                              
<%
						ps=c.prepareStatement("select * from patient_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs=ps.executeQuery();
						while(rs.next())
						{
								id=rs.getInt(1);
								name=rs.getString(2);
%>		                                              
                          <option value="<%=id%>"><%=id%> - <%=name%></option>
<%
						}
%>                                                           
                        </select>                    
                        <!--<input type="number" class="form-control" name="patientid" placeholder="Patient ID" required>-->
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Patient Name</label>
                    <div class="col-sm-10">
                    	
                    	<select class="form-control" name="patientname">
                    	<option selected="selected">Select Patient Name as Above</option>
                               
<%
						ps=c.prepareStatement("select * from patient_info",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs=ps.executeQuery();
						while(rs.next())
						{
								name=rs.getString(2);
%>		                    
                          <option value="<%=name%>"><%=name%></option>
<%
						}
%>                                                          
                        </select>                       
                    </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">PCR</label>
                        <div class="col-sm-10">
                        <select class="form-control" name="xray">
                        <option selected="selected">Add ONLY if Tested</option>
                        <option>Positive</option>                                        
                        <option>Negative</option>                              
                        </select>                              
                        </div>
                    </div> 

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">UltraSound</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" name="usound" placeholder="Add ONLY if Taken" >
                        </div>
                    </div> 

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Blood Type</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="bt" required="required">
                        <option selected="selected">None</option>
                        <option>A Positive</option>                                          
                        <option>A Negative</option>
                        <option>B Positive</option> 
                        <option>B Negative</option> 
                        <option>AB Positive</option> 
                        <option>AB Negative</option> 
                        <option>O Positive</option> 
                        <option>O Negative</option>                               
                        </select>
                        </div>
                    </div> 

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">CT-Scan</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" name="ctscan" placeholder="Add ONLY if Taken" >
                        </div>
                    </div> 
                 

                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Diagnosis Info</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                           <!----------------------------   Add Diagnosis Ends   ---------------------------------------->
                </div>
           <!----------------------------------------------   Panel body Ends   ------------------------------------------>
         </div>
    </div>
	<script src="js/bootstrap.min.js"></script>
	
	<script>
        function Download(){
			 
			   var sTable = document.getElementById('diagtable').outerHTML;


			        // CREATE A WINDOW OBJECT.
			        var win = window.open('', '', 'height=700,width=700');

			        win.document.write('<html><head>');
			        win.document.write('<title>List of Patient Diagnosis</title>');   // <title> FOR PDF HEADER.
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