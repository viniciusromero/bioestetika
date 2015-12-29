
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addAnamenesesModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addAnamenesesModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">    	
	    <div class="modal-content">
	    	 <div class="modal-header">
		        <h4 id="addAnamenesesModalLabel" class="displayInLine">
		            <spring:message code="create"/>&nbsp;<spring:message code="anameneses"/>
		        </h4>
		     </div>
		     <div class="modal-body">
		        <form name="newAnameneseForm" class="form-inline" novalidate >		        	     
		            <ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="#">GERAL</a></li>
						<li role="presentation"><a href="#">MULHER</a></li>
						<li role="presentation"><a href="#">BIOTIPO</a></li>
						<li role="presentation"><a href="#">HABITOS DIARIOS</a></li>
						<li role="presentation"><a href="#">FORMA CLINICA</a></li>												
					</ul>
		            
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="anameneses.admdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
	                    	<input type="datetime"
		                           required
		                           autofocus
		                           ng-model="anamenese.admdate"
		                           name="admdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newAnameneseForm.admdate.$error.required">
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
		                 	<label>* <spring:message code="anameneses.admtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"
							       required
							       ng-model="anamenese.admtime"
							       name="admtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"/>
					        <span class="alert alert-danger"
					              ng-show="displayValidationError && newAnameneseForm.admtime.$error.required">
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
	                    	<label><spring:message code="anameneses.dischgdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="text"		                           		                          
		                           ng-model="anamenese.dischgdate"
		                           name="dischgdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"/>	                    
	                        </div>
                        </div>  
                        <p/>                                         
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label><spring:message code="anameneses.dischgtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"							       
							       ng-model="anamenese.dischgtime"
							       name="dischgtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"/>
					        </div>
				        </div>
				        <p/>
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3" valign="top">
		                 	<label><spring:message code="anameneses.observations"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<textarea
							       ng-model="anamenese.observations"
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
	                     ng-click="exit('#addAnamenesesModal');"
	                     aria-hidden="true">
	                 <spring:message code="cancel"/>
	             </button>
	             <input type="submit"
	                    class="btn btn-primary"
	                    ng-click="createAnamenese(newAnameneseForm);"
	                    value='<spring:message code="create"/>'/>
       		</div>
		</div>	
	</div>    
</div>

<div id="updateAnamenesesModal"
     class="modal fade in insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updateAnamenesesModalLabel"
     aria-hidden="true"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog"> 
    <div class="modal-content">
	    <div class="modal-header">
	        <h3 id="updateAnamenesesModalLabel" class="displayInLine">
	            <spring:message code="update"/>&nbsp;<spring:message code="anameneses"/>
	        </h3>
	    </div>
	    <div class="modal-body">
	        <form name="updateAnameneseForm" novalidate>
	            <input type="hidden"
	                   required
	                   ng-model="anamenese.id"
	                   name="id"
	                   value="{{anamenese.id}}"/>						        	     
		            <div class="input-append">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="anameneses.admdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="datetime"
		                           required
		                           autofocus
		                           ng-model="anamenese.admdate"
		                           name="admdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newAnameneseForm.admdate.$error.required">
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
		                 	<label>* <spring:message code="anameneses.admtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"
							       required
							       ng-model="anamenese.admtime"
							       name="admtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"/>
					        <span class="alert alert-danger"
					              ng-show="displayValidationError && newAnameneseForm.admtime.$error.required">
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
	                    	<label><spring:message code="anameneses.dischgdate"/>:</label>
	                    	</div>
	                    	<div class="col-md-7" border=1>
		                    <input type="text"		                           		                          
		                           ng-model="anamenese.dischgdate"
		                           name="dischgdate"
		                           placeholder="<spring:message code='sample.date'/>"
		                           class="form-control"/>	                    
	                        </div>
                        </div>  
                        <p/>                                         
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label><spring:message code="anameneses.dischgtime"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"							       
							       ng-model="anamenese.dischgtime"
							       name="dischgtime"
							       placeholder="<spring:message code='sample.time'/>"
							       maxlength="5"
							       class="form-control"/>
					        </div>
				        </div>
				        <p/>
		            </div>
		            <div class="input-append">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3" valign="top">
		                 	<label><spring:message code="anameneses.observations"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<textarea
							       ng-model="anamenese.observations"
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
                    ng-click="exit('#updateAnamenesesModal');"
                    aria-hidden="true">
            <spring:message code="cancel"/></button>
            <input type="submit"
                   class="btn btn-primary"
                   ng-click="updateAnamenese(updateAnameneseForm);"
                   value='<spring:message code="update"/>'/>
		</div>	                    

	</div>	
	</div>    
</div>
