<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
     
<html>

<head lang="en">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>A PLUS HOSPITALS</title>
        
		<!-- Add Bootstrap, CSS styles & java script -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<script src="js/validation.js"></script>
				
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
			         <a href="index.jsp" style="text-align:Center; font-size:18px; color:white;"> <button style="margin-left: 720px; margin-top:35px; width: 110px; height: 35px; background-color: #276B9C; border-color: #276B9C; border-width:0.5px; border-radius: 12px; "> SIGN IN </button> </a>				
		       </div>
				
			 </div>
			     
			 </nav>
		     
		     </div>	   
		  <!------------------------------------------Header Ends Here------------------------------------------------>
	  
	
	
	      <!------------------------------------------Registration Form Starts Here------------------------------------>	  
		  <div class="row" style="width: 120%; margin-left:-100px;">
			<div class="col-md-12">
				<div class="panel panel-default login">
					<div class="panel-heading logintitle">Register As Patient</div>
					
					<div class="panel-body">
                          <form class="form-horizontal center-block" role="form" action="patient_register_validation.jsp" method="post" onsubmit="return checkPassword()">
							
                                <div class="form-group">
									<label  class="col-sm-2 control-label" style="font-size:15px">Patient ID</label>
										<div class="col-sm-9">
                                               <input type="number" class="form-control" name="patientid" placeholder="Auto-generated Unique ID" readonly>
										</div>
								 </div>
                                                                                                     
								<div class="form-group">
								     <label  class="col-sm-2 control-label" style="font-size:15px">Full Name</label>
									     <div class="col-sm-9">
                                                 <input type="text" class="form-control" name="patientname" placeholder="Enter Your Full Name" required>
										</div>
							     </div>
							    
							    <div class="form-group">
								<label  class="col-sm-2 control-label" style="font-size:15px">Address</label>
									<div class="col-sm-9">
											  <input type="text" class="form-control" name="address" placeholder="Enter Your Home Address" required>
									</div>
								</div>
								
								<div class="form-group">    
                                       <label class="col-sm-2 control-label" style="font-size:15px">Sex</label>
                                              <div class="col-sm-4">
                                                    <select class="form-control" name="gender">
                                                            <option>Male</option>
                                                            <option>Female</option>
                                                    </select>
                                               </div>
                                 </div>
                                 
                                 <div class="form-group">
								       <label  class="col-sm-2 control-label" style="font-size:15px">Age</label>
								            <div class="col-sm-9">
							                    <input type="number" min="1" max="150" class="form-control" name="age" placeholder="Enter Your Age" required>
							                </div>
							     </div>
							     
							      <div class="form-group">
									<label  class="col-sm-2 control-label" style="font-size:15px">Contact Number</label>
								       <div class="col-sm-9">
							               <input type="text" class="form-control" name="phone" placeholder="Enter Your Mobile Number" title="Please Enter Valid Mobile Number" pattern="[0-9]{10}" required>
								       </div>
								  </div>
								  
						
								  <div class="form-group">    
                                       <label class="col-sm-2 control-label" style="font-size:15px">Purpose of Admission</label>
                                              <div class="col-sm-4">
                                                    <select class="form-control" name="poa">
                                                            <option>Select Purpose</option>
                                                            <option>Accident</option>
                                                            <option>Cancer</option>
                                                            <option>Fever or Dengue</option>
                                                            <option>Heart Diseases or Heart Attacks</option>
                                                            <option>Pregnancy</option>
                                                            <option>Other</option>
                                                    </select>
                                               </div>
                                  </div> <br>
                                 
                                 
                                  <div class="form-group">
								    <label class="col-sm-2 control-label" style="font-size:15px">Email</label>
										<div class="col-sm-9">
								               <input type="email" class="form-control" name="email" id="email" placeholder="example@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please Enter Valid Email ID" required>
							            </div>
							      </div>
													  
							     <div class="form-group">
									<label class="col-sm-2 control-label" style="font-size:15px">Password</label>
							            <div class="col-sm-9">
								           <input type="password"  id="pwd" name="pwd" class="form-control" placeholder="Enter a Strong Password (8-15 Characters)" pattern="[a-zA-Z0-9_#@.+-/%]{8,15}" title="Password should be 8-15 characters" required>
							            </div>
					             </div>
												  
								 <div class="form-group">
									<label class="col-sm-2 control-label" style="font-size:15px">Confirm Password</label>
							            <div class="col-sm-9">
								           <input type="password" id="rpwd" name="rpwd" class="form-control"  placeholder="Confirm Your Password" pattern="[a-zA-Z0-9_#@.+-/%]{8,15}" title="Password should be 8-15 characters" required>
							            </div>
					             </div>
					             
					             
								 <h3 style="text-align: center; font-weight: bold;" class="col-sm-12 control-label">Admin Section</h3> <br> <br> <br>
								 
								 
								 <div class="form-group">
								   <label  class="col-sm-2 control-label" style="font-size:15px">Ward Number</label>
									  <div class="col-sm-9">
									      <input type="number" min="1" max="20" class="form-control" value="" name="wardNo" placeholder="Administrative Use Only" readonly>
									  </div>
								 </div>
								 
								 <div class="form-group">
									<label  class="col-sm-2 control-label" style="font-size:15px">Room Number</label>
									  <div class="col-sm-9">
								        <input type="number" min="1" max="20" class="form-control" name="roomNo" placeholder="Administrative Use Only" readonly>
							          </div>
								 </div>

								 <div class="form-group">
									<label  class="col-sm-2 control-label" style="font-size:15px">Doctor Incharge</label>
								      <div class="col-sm-9">
								         <input type="text" class="form-control" name="doctor" placeholder="Administrative Use Only" readonly>
								      </div>
								  </div>
	                                                       

                                 <div class="form-group">
							        <label  class="col-sm-2 control-label" style="font-size:15px">Date of Admission</label>
							           <div class="col-sm-9">
							               <input type="text" class="form-control" name="admitdate" placeholder="Administrative Use Only" readonly>
							      		</div>
								</div>
	                                                    								
                                                        
							    <div class="form-group">
								   <div class="col-sm-3 col-sm-offset-2" style="margin:0 0 0 39%;" >
								     <button type="submit" class="btn btn-primary btn-block btn-lg">SIGN UP</button>
								   </div>
							    </div> <br> <br> <br>
					
						</form>
					</div>					
				</div>
			</div>				
		</div>
	 </div>   
     <!------------------------------------------Registration Form Ends Here------------------------------------>	  
		     
        
    
        <!------------------------------------------Footer Starts Here------------------------------------>	  
        <div class="row footer navbar-fixed-bottom">
		     <div class="col-md-12">
				<div>Designed By NewCoders</div>
		     </div>
	    </div>   
        <!------------------------------------------Footer Ends Here------------------------------------>	  
		
</body>

</html>