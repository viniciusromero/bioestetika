
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addAdmissionsModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addAdmissionsModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">    	
	    <div class="modal-content">
	    	 <div class="modal-header">
		        <h4 id="addPatientsModalLabel" class="displayInLine">
		            <spring:message code="create"/>&nbsp;<spring:message code="admissions"/>
		        </h4>
		     </div>
		     <div class="modal-body">
		        <form name="newPatientForm" class="form-inline" novalidate >		        	     
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-2">		            	
	                    	<label>* <spring:message code="patients.name"/>:</label>
	                    	</div>
	                    	<div class="col-md-3" border=1>
		                    <input type="text"
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
			             	<div class="col-md-2">
		                 	<label>* <spring:message code="patients.dob"/>:</label>
		                 	</div>
		                 	<div class="col-md-5">
							<input type="text"
							       required
							       ng-model="patient.dob"
							       name="dob"
							       placeholder="<spring:message code='sample.dob'/>"
							       ui-date-mask/>
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
		            		<div class="col-md-2">
		                    <label>* <spring:message code="patients.email"/>:</label>
		                    </div>
		                    <div class="col-md-3">
		                    <input type="text"
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
			            	<div class="col-md-2">
		                    <label>* <spring:message code="patients.mobilephone"/>:</label>
		                    </div>
		                    <div class="col-md-3">
		                    <input type="text"
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
           
		    <span class="alert alert-error dialogErrorMessage"
		          ng-show="errorOnSubmit">
		        <spring:message code="request.error"/>
		    </span>
		</div>	
	</div>    
</div>

<div id="updateAdmissionsModal"
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
	        <form name="updatePatientForm" novalidate>
	            <input type="hidden"
	                   required
	                   ng-model="patient.id"
	                   name="id"
	                   value="{{patient.id}}"/>
				<form name="newPatientForm" class="form-inline" novalidate >		        	     
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-2">		            	
	                    	<label>* <spring:message code="patients.name"/>:</label>
	                    	</div>
	                    	<div class="col-md-3" border=1>
		                    <input type="text"
		                           required
		                           autofocus
		                           ng-model="patient.name"
		                           name="name"
		                           placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/>"
		                           value="{{patient.name}}"/>	                    
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
			             	<div class="col-md-2">
		                 	<label>* <spring:message code="patients.dob"/>:</label>
		                 	</div>
		                 	<div class="col-md-5">
							<input type="text"
							       required
							       ng-model="patient.dob"
							       name="dob"
							       placeholder="<spring:message code='sample.dob'/> "
							       value="{{patient.dob | date : 'dd/MM/yyyy'}}"/>
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
		            		<div class="col-md-2">
		                    <label>* <spring:message code="patients.email"/>:</label>
		                    </div>
		                    <div class="col-md-3">
		                    <input type="text"
		                           required
		                           ng-model="patient.email"
		                           name="email"
		                           placeholder="<spring:message code='sample.email'/> "
		                           value="{{patient.email}}"/>
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
			            	<div class="col-md-2">
		                    <label>* <spring:message code="patients.mobilephone"/>:</label>
		                    </div>
		                    <div class="col-md-3">
		                    <input type="text"
		                            required
		                            ng-model="patient.mobilephone"
		                            name="mobilephone"
		                            placeholder="<spring:message code='sample.phone'/> "
		                            value="{{patient.mobilephone}}"/>
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
	    <span class="alert alert-error dialogErrorMessage"
	          ng-show="errorOnSubmit">
	        <spring:message code="request.error"/>
	    </span>
	</div>	
	</div>    
</div>

<div id="listAnamenesesModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="listAnamenesesModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">	         
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
	    <div class="modal-header">
	        <h3 id="listAnamenesesModalLabel" class="displayInLine">
	            <spring:message code="list"/>&nbsp;<spring:message code="anameneses"/>
	        </h3>
	    </div>
	    <div class="modal-body">
	        
	        
	    </div>
	    <div class="modal-footer">	    	
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#listAnamenesesModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>            
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
