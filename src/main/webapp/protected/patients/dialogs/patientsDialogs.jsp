<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addPatientsModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addPatientsModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">    	
	    <div class="modal-content">
	    	 <div class="modal-header">
		        <h4 id="addPatientsModalLabel" class="displayInLine">
		            <spring:message code="create"/>&nbsp;<spring:message code="patient"/>
		        </h4>
		     </div>
		     <div class="modal-body">
		        <form name="newPatientForm" class="form-inline" novalidate >		        	     
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="patients.name"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="text"
		                           class="form-control"
		                           required
		                           autofocus
		                           ng-model="patient.name"
		                           name="name"
		                           placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/>"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newPatientForm.name.$error.required">
	                                <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>  
                        <p/>                                         
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label>* <spring:message code="patients.dob"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"
								   class="form-control"
								   required
							       ng-model="patient.dob"
							       name="dob"
							       placeholder="<spring:message code='sample.date'/>"
							       OnKeyPress="mascaraData(event, this);"
							       OnKeyUp="mascaraData(event, this);" OnBlur="verificaData(this);" maxlength="10"/>
							
					        <span class="alert alert-danger"
					              ng-show="displayValidationError && newPatientForm.dob.$error.required">
					            <spring:message code="required"/>
					        </span>
					        </div>
				        </div>
				        <p/>
		            </div>	
		            <div class="input-append">
		            	<p/>
		            	<div class="row">
		            		<div class="col-md-3">
		                    <label>* <spring:message code="patients.email"/>:</label>
		                    </div>
		                    <div class="col-md-7">
		                    <input type="text"
		                    	   class="form-control"
		                           required
		                           ng-model="patient.email"
		                           name="email"
		                           placeholder="<spring:message code='sample.email'/> "/>
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newPatientForm.email.$error.required">
	                            <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>
                        <p/>
		            </div>
		            <div class="input-append">
		            	<p/>
		            	<div class="row">
			            	<div class="col-md-3">
		                    <label>* <spring:message code="patients.mobilephone"/>:</label>
		                    </div>
		                    <div class="col-md-7">
		                    <input type="text"
		                    	   class="form-control"
		                            required
		                            ng-model="patient.mobilephone"
		                            name="mobilephone"
		                            placeholder="<spring:message code='sample.phone'/> "/>
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newPatientForm.mobilephone.$error.required">
	                            <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>
                        <p/>
		             </div>		             	            	                    			
		        </form>
		        
		    </div>
		    <div class="modal-footer">	
		    	 <span class="alert alert-danger"
	        	 	   ng-show="errorOnSubmit">
	        	       <spring:message code="request.error"/>
	    		 </span>    		                                    
	             <button class="btn btn-default"
	                     data-dismiss="modal"
	                     ng-click="exit('#addPatientsModal');"
	                     aria-hidden="true">
	                 <spring:message code="cancel"/>
	             </button>
	             <input type="submit"
	                    class="btn btn-primary"
	                    ng-click="createPatient(newPatientForm);"
	                    value='<spring:message code="create"/>'/>
       		</div>           
		</div>	
	</div>    
</div>

<div id="updatePatientsModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updatePatientsModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog"> 
    <div class="modal-content">
	    <div class="modal-header">
	        <h3 id="updatePatientsModalLabel" class="displayInLine">
	            <spring:message code="update"/>&nbsp;<spring:message code="patient"/>
	        </h3>
	    </div>
	    <div class="modal-body">
	        <form name="updatePatientForm" class="form-inline" novalidate>
	            <input type="hidden"
	                   required
	                   ng-model="patient.id"
	                   name="id"
	                   value="{{patient.id}}"/>
				    <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="patients.name"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="text"
		                           required
		                           autofocus
		                           ng-model="patient.name"
		                           name="name"
		                           placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/>"
		                           value="{{patient.name}}"
		                           class="form-control"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newPatientForm.name.$error.required">
	                                <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>  
                        <p/>                                         
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label>* <spring:message code="patients.dob"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"
								   required							       
							       ng-model="patient.dob"
							       name="dob"
							       placeholder="<spring:message code='sample.date'/> "
							       value="{{patient.dob | date : 'dd/MM/yyyy'}}"
							       class="form-control"
							       OnKeyPress="mascaraData(event, this);"
							       OnKeyUp="mascaraData(event, this);" OnBlur="verificaData(this);" maxlength="10"/>
					        <span class="alert alert-danger"
					              ng-show="displayValidationError && newPatientForm.dob.$error.required">
					            <spring:message code="required"/>
					        </span>
					        
					        </div>
					    </div>					        						        					        						        						        					       
				        <p/>
		            </div>	
		            <div class="input-append">
		            	<p/>
		            	<div class="row">
		            		<div class="col-md-3">
		                    <label>* <spring:message code="patients.email"/>:</label>
		                    </div>
		                    <div class="col-md-7">
		                    <input type="text"
		                           required
		                           ng-model="patient.email"
		                           name="email"
		                           placeholder="<spring:message code='sample.email'/> "
		                           value="{{patient.email}}"
		                           class="form-control"/>
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newPatientForm.email.$error.required">
	                            <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>
                        <p/>
		            </div>
		            <div class="input-append">
		            	<p/>
		            	<div class="row">
			            	<div class="col-md-3">
		                    <label>* <spring:message code="patients.mobilephone"/>:</label>
		                    </div>
		                    <div class="col-md-7">
		                    <input type="text"
		                            required
		                            ng-model="patient.mobilephone"
		                            name="mobilephone"
		                            placeholder="<spring:message code='sample.phone'/> "
		                            value="{{patient.mobilephone}}"
		                            class="form-control"/>
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newPatientForm.mobilephone.$error.required">
	                            <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>
                        <p/>
		             </div>		             	            		            		                    			
		        </form>	            
	        </form>
	    </div>
	    <div class="modal-footer">	
	    	<span class="alert alert-danger"
	        	  ng-show="errorOnSubmit">
	        	  <spring:message code="request.error"/>
	    	</span>    	
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#updatePatientsModal');"
                    aria-hidden="true">
            <spring:message code="cancel"/></button>
            <input type="submit"
                   class="btn btn-primary"
                   ng-click="updatePatient(updatePatientForm);"
                   value='<spring:message code="update"/>'/>
			                   
		</div>	                    	    
	</div>	
	</div>    
</div>

<div id="deletePatientsModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="deletePatientsModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">	         
    <div class="modal-dialog">
    <div class="modal-content">
	    <div class="modal-header">
	        <h3 id="deletePatientsModalLabel" class="displayInLine">
	            <spring:message code="delete"/>&nbsp;<spring:message code="patient"/>
	        </h3>
	    </div>
	    <div class="modal-body">
	        <form name="deletePatientForm" novalidate>
	            <p><spring:message code="delete.confirm"/>:&nbsp;{{patient.name}}?</p>		           
	        </form>
	    </div>
	    <div class="modal-footer">	    	
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#deletePatientsModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
            <input type="submit"
                   class="btn btn-danger"
                   ng-click="deletePatient();"
                   value='<spring:message code="delete"/>'/>
		</div>	            
	    <span class="alert alert-error dialogErrorMessage"
	          ng-show="errorOnSubmit">
	        <spring:message code="request.error"/>
	    </span>
	    <span class="alert alert-error dialogErrorMessage"
	          ng-show="errorIllegalAccess">
	        <spring:message code="request.illegal.access"/>
	    </span>
    </div>
    </div>
</div>
