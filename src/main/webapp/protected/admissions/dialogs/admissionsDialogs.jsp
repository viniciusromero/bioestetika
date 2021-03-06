
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
		        <h4 id="addAdmissionsModalLabel" class="displayInLine">
		            <spring:message code="create"/>&nbsp;<spring:message code="admissions"/>
		        </h4>
		     </div>
		     <div class="modal-body">
		        <form name="newAdmissionForm" class="form-inline" novalidate >		        	     
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="admissions.admdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
	                    	<input type="datetime"
		                           required
		                           autofocus
		                           ng-model="admission.admdate"
		                           name="admdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"
		                           OnKeyPress="mascaraData(event, this);"
		                           OnKeyUp="mascaraData(event, this);" OnBlur="verificaData(this);" maxlength="10"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newAdmissionForm.admdate.$error.required">
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
		                 	<label>* <spring:message code="admissions.admtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"
							       required
							       ng-model="admission.admtime"
							       name="admtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"
							       OnKeyPress="mascaraHora(event, this);"
							       OnKeyUp="mascaraHora(event, this);" OnBlur="verificaHora(this);"/>
					        <span class="alert alert-danger"
					              ng-show="displayValidationError && newAdmissionForm.admtime.$error.required">
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
	                    	<label><spring:message code="admissions.dischgdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="text"		                           		                          
		                           ng-model="admission.dischgdate"
		                           name="dischgdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"
		                           OnKeyPress="mascaraData(event, this);"
		                           OnKeyUp="mascaraData(this);" OnBlur="verificaData(this);" maxlength="10"/>	                    
	                        </div>
                        </div>  
                        <p/>                                         
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label><spring:message code="admissions.dischgtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"							       
							       ng-model="admission.dischgtime"
							       name="dischgtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"
							       OnKeyPress="mascaraHora(event, this);"
							       OnKeyUp="mascaraHora(event, this);" OnBlur="verificaHora(this);"/>
					        </div>
				        </div>
				        <p/>
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3" valign="top">
		                 	<label><spring:message code="admissions.observations"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<textarea
							       ng-model="admission.observations"
							       name="observations"
							       placeholder="<spring:message code='sample.observations'/>"
							       ng-maxlength="200"
							       class="form-control"></textarea>					        
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
	                     ng-click="exit('#addAdmissionsModal');"
	                     aria-hidden="true">
	                 <spring:message code="cancel"/>
	             </button>
	             <input type="submit"
	                    class="btn btn-primary"
	                    ng-click="createAdmission(newAdmissionForm);"
	                    value='<spring:message code="create"/>'/>
       		</div>
		</div>	
	</div>    
</div>

<div id="updateAdmissionsModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updateAdmissionsModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog"> 
    <div class="modal-content">
	    <div class="modal-header">
	        <h3 id="updateAdmissionsModalLabel" class="displayInLine">
	            <spring:message code="update"/>&nbsp;<spring:message code="admissions"/>
	        </h3>
	    </div>
	    <div class="modal-body">
	        <form name="updateAdmissionForm" class="form-inline" novalidate>
	            <input type="hidden"
	                   required
	                   ng-model="admission.id"
	                   name="id"
	                   value="{{admission.id}}"/>						        	     
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="admissions.admdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="datetime"
		                           required
		                           autofocus
		                           ng-model="admission.admdate"
		                           name="admdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"
		                           OnKeyPress="mascaraData(event, this);"
		                           OnKeyUp="mascaraData(event, this);" OnBlur="verificaData(this);" maxlength="10"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newAdmissionForm.admdate.$error.required">
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
		                 	<label>* <spring:message code="admissions.admtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"
							       required
							       ng-model="admission.admtime"
							       name="admtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"
							       OnKeyPress="mascaraHora(event, this);"
							       OnKeyUp="mascaraHora(event, this);" OnBlur="verificaHora(this);"/>
					        <span class="alert alert-danger"
					              ng-show="displayValidationError && newAdmissionForm.admtime.$error.required">
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
	                    	<label><spring:message code="admissions.dischgdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="text"		                           		                          
		                           ng-model="admission.dischgdate"
		                           name="dischgdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"
		                           OnKeyPress="mascaraData(event, this);"
		                           OnKeyUp="mascaraData(event, this);" OnBlur="verificaData(this);" maxlength="10"/>	                    
	                        </div>
                        </div>  
                        <p/>                                         
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label><spring:message code="admissions.dischgtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"							       
							       ng-model="admission.dischgtime"
							       name="dischgtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"
							       OnKeyPress="mascaraHora(event, this);"
							       OnKeyUp="mascaraHora(event, this);" OnBlur="verificaHora(this);"/>
					        </div>
				        </div>
				        <p/>
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3" valign="top">
		                 	<label><spring:message code="admissions.observations"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<textarea
							       ng-model="admission.observations"
							       name="observations"
							       placeholder="<spring:message code='sample.observations'/>"
							       ng-maxlength="200"
							       class="form-control"></textarea>					        
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
                    ng-click="exit('#updateAdmissionsModal');"
                    aria-hidden="true">
            <spring:message code="cancel"/></button>
            <input type="submit"
                   class="btn btn-primary"
                   ng-click="updateAdmission(updateAdmissionForm);"
                   value='<spring:message code="update"/>'/>
		</div>	                    

	</div>	
	</div>    
</div>
