
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
		        <form name="newAnameneseForm" novalidate >		        	     
		            <ul class="nav nav-tabs">
						<li role="presentation" ng-class="{'active': navactive == 'general', '': navactive != 'general'}"><a href="#" ng-click="changeNavBar('general')"><spring:message code="anameneses.navbar.general"/></a></li>
						<li role="presentation" ng-class="{'active': navactive == 'woman', '': navactive != 'woman'}"><a href="#" ng-click="changeNavBar('woman')"><spring:message code="anameneses.navbar.woman"/></a></li>
						<li role="presentation" ng-class="{'active': navactive == 'morphologicalprofile', '': navactive != 'morphologicalprofile'}"><a href="#" ng-click="changeNavBar('morphologicalprofile')"><spring:message code="anameneses.navbar.morphologicalprofile"/></a></li>
						<li role="presentation" ng-class="{'active': navactive == 'biotype', '': navactive != 'biotype'}"><a href="#" ng-click="changeNavBar('biotype')"><spring:message code="anameneses.navbar.biotype"/></a></li>
						<li role="presentation" ng-class="{'active': navactive == 'dailyhabits', '': navactive != 'dailyhabits'}"><a href="#" ng-click="changeNavBar('dailyhabits')"><spring:message code="anameneses.navbar.dailyhabits"/></a></li>
						<li role="presentation" ng-class="{'active': navactive == 'clinicalshape', '': navactive != 'clinicalshape'}"><a href="#" ng-click="changeNavBar('clinicalshape')"><spring:message code="anameneses.navbar.clinicalshape"/></a></li>												
					</ul>
		            
		            <div ng-class="{'input-append': navactive == 'general', 'none': navactive != 'general'}">	
		            	<p/>	 		            	     	
		            	<div class="row">
		            		<div class="col-md-3">		            	
	                    	<label>* <spring:message code="anameneses.description"/>:</label>
	                    	</div>
	                    	<div class="col-md-6" border=1>
		                    <input type="text"
		                           class="form-control"
		                           required
		                           autofocus
		                           ng-model="anamenese.description"
		                           name="description"
		                           placeholder="<spring:message code='anameneses.description'/>"/>	                    
	                        <span class="alert alert-danger"
	                              ng-show="displayValidationError && newAnameneseForm.description.$error.required">
	                                <spring:message code="required"/>
	                        </span>
	                        </div>
                        </div>  
                        <p/>	 		            	     	
		            	<div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.currentmeds"/>:</label>
	                    	</div>
	                    	<div class="col-md-2" border=1>
	                    		<label class="radio-inline"><input type="radio" name="currentmedsbl" ng-model="anamenese.currentmedsbl" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="currentmedsbl" ng-model="anamenese.currentmedsbl" ng-value=false><spring:message code="anameneses.no"/></label>																	                       								
	                        </div>
	                        <div class="col-md-1" border=1>
	                        	<label><spring:message code="anameneses.which"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.currentmeds"
		                           name="currentmeds"
		                           placeholder="<spring:message code='anameneses.which'/>"/>
	                        </div>
                        </div>  
                        <p/>	 		            	     	
		            	<div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.allergies"/>:</label>
	                    	</div>
	                    	<div class="col-md-2" border=1>
	                    		<label class="radio-inline"><input type="radio" name="allergiesbl" ng-model="anamenese.allergiesbl" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="allergiesbl" ng-model="anamenese.allergiesbl" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                        </div>
	                        <div class="col-md-1" border=1>
	                        	<label><spring:message code="anameneses.what"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.allergies"
		                           name="allergies"
		                           placeholder="<spring:message code='anameneses.what'/>"/>
	                        </div>
                        </div>  
                        <p/>	 		            	     			            	
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.pathologies"/>:</label>
	                    	</div>
	                    	<div class="col-md-9" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patcardio" ng-model="anamenese.patcardio"><spring:message code="anameneses.patcardio"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patneuro" ng-model="anamenese.patneuro"><spring:message code="anameneses.patneuro"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patpulmo" ng-model="anamenese.patpulmo"><spring:message code="anameneses.patpulmo"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patderma" ng-model="anamenese.patderma"><spring:message code="anameneses.patderma"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patendo" ng-model="anamenese.patendo"><spring:message code="anameneses.patendo"/></label>																									                       							
	                        </div>	                        
                        </div>                         	 		            	     			            
                        <div class="row">
                        	<div class="col-md-3" border=1>
	                        	<label><spring:message code="anameneses.observations"/>:</label>
	                        </div>
	                        <div class="col-md-6" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.pathobserv"
		                           name="pathobserv"
		                           placeholder="<spring:message code='anameneses.observations'/>"/>
	                        </div>
						</div> 	
						<p/>	 		            	     			            	
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.bodychanges"/>:</label>
	                    	</div>
	                    	<div class="col-md-9" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangesova" ng-model="anamenese.bodychangesova"><spring:message code="anameneses.bodychangesova"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangeskidn" ng-model="anamenese.bodychangeskidn"><spring:message code="anameneses.bodychangeskidn"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangesvariz" ng-model="anamenese.bodychangesvariz"><spring:message code="anameneses.bodychangesvariz"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangeshipe" ng-model="anamenese.bodychangeshipe"><spring:message code="anameneses.bodychangeshipe"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangeshipo" ng-model="anamenese.bodychangeshipo"><spring:message code="anameneses.bodychangeshipo"/></label>																									                       							
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangesdiab" ng-model="anamenese.bodychangesdiab"><spring:message code="anameneses.bodychangesdiab"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangescirur" ng-model="anamenese.bodychangescirur"><spring:message code="anameneses.bodychangescirur"/></label>
	                        </div>	                        
                        </div>                         	 		            	     			            
                        <div class="row">
                        	<div class="col-md-3" border=1>
	                        	<label><spring:message code="anameneses.observations"/>:</label>
	                        </div>
	                        <div class="col-md-6" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.bodychangesobserv"
		                           name="bodychangesobserv"
		                           placeholder="<spring:message code='anameneses.observations'/>"/>
	                        </div>
						</div>                        
                        <p/>                                          
		            </div>
		            <div ng-class="{'input-append': navactive == 'woman', 'none': navactive != 'woman'}">
		             	<p/>	 		            	     			            	
                        <div class="row">		            		    						        														    		            		
	                    	<div class="col-md-11" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="pregnant" ng-model="anamenese.pregnant"><spring:message code="anameneses.pregnant"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="puberty" ng-model="anamenese.puberty"><spring:message code="anameneses.puberty"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="menopause" ng-model="anamenese.menopause"><spring:message code="anameneses.menopause"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="tpm" ng-model="anamenese.tpm"><spring:message code="anameneses.tpm"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="birthcontrol" ng-model="anamenese.birthcontrol"><spring:message code="anameneses.birthcontrol"/></label>																									                       							
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="fibroids" ng-model="anamenese.fibroids"><spring:message code="anameneses.fibroids"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="lactation" ng-model="anamenese.lactation"><spring:message code="anameneses.lactation"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="neoplasia" ng-model="anamenese.neoplasia"><spring:message code="anameneses.neoplasia"/></label>								
	                        </div>	                        
                        </div>  
                        <p/>                       	 		            	     			            
                        <div class="row">
                        	<div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.observations"/>:</label>
	                        </div>
	                        <div class="col-md-6" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.womenobs"
		                           name="womenobs"
		                           placeholder="<spring:message code='anameneses.observations'/>"/>
	                        </div>
						</div> 	
						<p/>	
		            </div>	
		            <div ng-class="{'input-append': navactive == 'morphologicalprofile', 'none': navactive != 'morphologicalprofile'}">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-2">
		                 	<label><spring:message code="anameneses.height"/>:</label>
		                 	</div>
		                 	<div class="col-md-2">
							<input type="text"
							       ng-model="anamenese.height"
							       name="height"
							       placeholder="<spring:message code='anameneses.height'/>"							       
							       class="form-control"/>
					        </div>
				        </div>
				        <p/>
				        <p/>
		             	<div class="row">
			             	<div class="col-md-2">
		                 	<label><spring:message code="anameneses.weight"/>:</label>
		                 	</div>
		                 	<div class="col-md-2">
							<input type="text"
							       ng-model="anamenese.weight"
							       name="weight"
							       placeholder="<spring:message code='anameneses.weight'/>"							       
							       class="form-control"/>
					        </div>
				        </div>
				        <p/>
				        <p/>
		             	<div class="row">
			             	<div class="col-md-2">
		                 	<label><spring:message code="anameneses.imc"/>:</label>
		                 	</div>
		                 	<div class="col-md-2">
							<input type="text"
							       ng-model="anamenese.imc"
							       name="imc"
							       placeholder="<spring:message code='anameneses.imc'/>"							       
							       class="form-control"/>
					        </div>
				        </div>
				        <p/>
		            </div>
		            <div ng-class="{'input-append': navactive == 'biotype', 'none': navactive != 'biotype'}">	
		            	<p/>	 		            	     	
		            	<div class="row">		            		    						        														    
	                    	<div class="col-md-9" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="gynoid" ng-model="anamenese.gynoid"><spring:message code="anameneses.gynoid"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="android" ng-model="anamenese.android"><spring:message code="anameneses.android"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="athletic" ng-model="anamenese.athletic"><spring:message code="anameneses.athletic"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="leptossimic" ng-model="anamenese.leptossimic"><spring:message code="anameneses.leptossimic"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="picnico" ng-model="anamenese.picnico"><spring:message code="anameneses.picnico"/></label>																									                       																							
	                        </div>	                        
                        </div>   
                        <p/>                                         
		            </div>		            
		            <div ng-class="{'input-append': navactive == 'dailyhabits', 'none': navactive != 'dailyhabits'}">
		             	<p/>
		             	<div class="row">
			             	<div class="col-md-3">
		                 	<label><spring:message code="anameneses.foodtype"/>:</label>
		                 	</div>
		                 	<div class="col-md-7">
							<input type="text"							       
							       ng-model="anamenese.foodtype"
							       name="foodtype"
							       placeholder="<spring:message code='anameneses.foodtype'/>"							       
							       class="form-control"/>
					        </div>
				        </div>
				        <p/>				        
		             	<div class="row">
		             		<div class="col-md-3">
		                 	<label><spring:message code="anameneses.smoker"/>:</label>
		                 	</div>
					        <div class="col-md-2" border=1>
		                   		<label class="radio-inline"><input type="radio" name="smoker" ng-model="anamenese.smoker" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="smoker" ng-model="anamenese.smoker" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
		                    </div>
	                    </div>
	                    <p/>
	                    <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.alcoholic"/>:</label>
	                    	</div>
	                    	<div class="col-md-2" border=1>
	                    		<label class="radio-inline"><input type="radio" name="alcoholic" ng-model="anamenese.alcoholic" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="alcoholic" ng-model="anamenese.alcoholic" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                        </div>
	                        <div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.alcoholicfreq"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.alcoholicfreq"
		                           name="alcoholicfreq"
		                           placeholder="<spring:message code='anameneses.alcoholicfreq'/>"/>
	                        </div>
                        </div> 
                        <p/>
	                    <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.water"/>:</label>
	                    	</div>
	                    	<div class="col-md-2" border=1>
	                    		<label class="radio-inline"><input type="radio" name="water" ng-model="anamenese.water" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="water" ng-model="anamenese.water" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                        </div>
	                        <div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.waterfreq"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.waterfreq"
		                           name="waterfreq"
		                           placeholder="<spring:message code='anameneses.waterfreq'/>"/>
	                        </div>
                        </div>
                        <p/>
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.dailyposition"/>:</label>
	                    	</div>
	                    	<div class="col-md-5" border=1>
	                    		<label class="radio-inline"><input type="radio" name="dailyposition" ng-model="anamenese.dailyposition" ng-value=true><spring:message code="anameneses.seated"/></label>
								<label class="radio-inline"><input type="radio" name="dailyposition" ng-model="anamenese.dailyposition" ng-value=false><spring:message code="anameneses.standing"/></label>									                       								
	                        </div>
	                    </div>	                    
	                    <p/>
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.constipation"/>:</label>
	                    	</div>
	                    	<div class="col-md-2" border=1>
	                    		<label class="radio-inline"><input type="radio" name="constipation" ng-model="anamenese.constipation" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="constipation" ng-model="anamenese.constipation" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                        </div>
	                    </div>
	                    <p/>
	                    <div class="row">
		            		<div class="col-md-3">		            	
	                    	<label><spring:message code="anameneses.hourssplet"/>:</label>
	                    	</div>
	                    	<div class="col-md-3" border=1>
		                    <input type="text"
		                           class="form-control"
		                           ng-model="anamenese.hourssplet"
		                           name="hourssplet"
		                           placeholder="<spring:message code='anameneses.hourssplet'/>"/>	                    
	                        </div>
                        </div>
                        <p/>
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.cosmetics"/>:</label>
	                    	</div>
	                    	<div class="col-md-2" border=1>
	                    		<label class="radio-inline"><input type="radio" name="cosmetics" ng-model="anamenese.cosmetics" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="cosmetics" ng-model="anamenese.cosmetics" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                        </div>
	                        <div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.cosmeticsfreq"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.cosmeticsfreq"
		                           name="cosmeticsfreq"
		                           placeholder="<spring:message code='anameneses.cosmeticsfreq'/>"/>
	                        </div>
                        </div>
                        <p/>
		            </div>
		            <div ng-class="{'input-append': navactive == 'clinicalshape', 'none': navactive != 'clinicalshape'}">
		             	<p/>
		             	<div class="row">		            		    						        														    
		            		<div class="col-md-2">		            	
	                    		<label><spring:message code="anameneses.hldg"/>:</label>
	                    	</div>
	                    	<div class="col-md-9" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgI" ng-model="anamenese.hldgI"><spring:message code="anameneses.hldgI"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgII" ng-model="anamenese.hldgII"><spring:message code="anameneses.hldgII"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgIII" ng-model="anamenese.hldgIII"><spring:message code="anameneses.hldgIII"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgIV" ng-model="anamenese.hldgIV"><spring:message code="anameneses.hldgIV"/></label>								
	                        </div>	                        
                        </div> 
				        <p/>
				        <div class="row">		            		    						        														    
		            		<div class="col-md-2">		            	
	                    		<label><spring:message code="anameneses.consistensy"/>:</label>
	                    	</div>
	                    	<div class="col-md-9" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="consistensytough" ng-model="anamenese.consistensytough"><spring:message code="anameneses.consistensytough"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="consistensyflaccid" ng-model="anamenese.consistensyflaccid"><spring:message code="anameneses.consistensyflaccid"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="consistensyedematous" ng-model="anamenese.consistensyedematous"><spring:message code="anameneses.consistensyedematous"/></label>									
	                        </div>	                        
                        </div>
                        <p/>
                        <div class="row">		            		    						        														    
	                    	<div class="col-md-9" border=1>
	                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="nodules" ng-model="anamenese.nodules"><spring:message code="anameneses.nodules"/></label>																	                       								
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="atrphicdep" ng-model="anamenese.atrphicdep"><spring:message code="anameneses.atrphicdep"/></label>
								<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="palpain" ng-model="anamenese.palpain"><spring:message code="anameneses.palpain"/></label>																																	                       																					
	                        </div>	                        
                        </div>
                        <p/>
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.flabs"/>:</label>
	                    	</div>
	                    	<div class="col-md-3" border=1>
	                    		<label class="radio-inline"><input type="radio" name="flabs" ng-model="anamenese.flabs" ng-value="1"><spring:message code="anameneses.flabstis"/></label>
								<label class="radio-inline"><input type="radio" name="flabs" ng-model="anamenese.flabs" ng-value="2"><spring:message code="anameneses.flabsmus"/></label>									                       								
	                        </div>
	                        <div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.regionflabs"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.regionflabs"
		                           name="regionflabs"
		                           placeholder="<spring:message code='anameneses.regionflabs'/>"/>
	                        </div>
                        </div>
                        <p/>
                        <div class="row">		            		    						        														    
		            		<div class="col-md-3">		            	
	                    		<label><spring:message code="anameneses.localfat"/>:</label>
	                    	</div>
	                    	<div class="col-md-3" border=1>
	                    		<label class="radio-inline"><input type="radio" name="localfat" ng-model="anamenese.localfat" ng-value=true><spring:message code="anameneses.yes"/></label>
								<label class="radio-inline"><input type="radio" name="localfat" ng-model="anamenese.localfat" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                        </div>
	                        <div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.regionfat"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.regionfat"
		                           name="regionfat"
		                           placeholder="<spring:message code='anameneses.regionfat'/>"/>
	                        </div>
                        </div>
                        <p/>                        
                        <div class="row">
                        	<div class="col-md-3" border=1>
	                        	<label><spring:message code="anameneses.aesthctreat"/>:</label>
	                        </div>
	                        <div class="col-md-5" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.aesthctreat"
		                           name="aesthctreat"
		                           placeholder="<spring:message code='anameneses.aesthctreat'/>"/>
	                        </div>
                        </div>
                        <p/>
                        <div class="row">
                        	<div class="col-md-3" border=1>
	                        	<label><spring:message code="anameneses.aesthccomplains"/>:</label>
	                        </div>
	                        <div class="col-md-5" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.aesthccomplains"
		                           name="aesthccomplains"
		                           placeholder="<spring:message code='anameneses.aesthccomplains'/>"/>
	                        </div>
                        </div>
                        <p/>
                        <div class="row">
                        	<div class="col-md-3" border=1>
	                        	<label><spring:message code="anameneses.proptreat"/>:</label>
	                        </div>
	                        <div class="col-md-5" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.proptreat"
		                           name="proptreat"
		                           placeholder="<spring:message code='anameneses.proptreat'/>"/>
	                        </div>
                        </div>
                        <p/>
                        <div class="row">
                        	<div class="col-md-3" border=1>
	                        	<label><spring:message code="anameneses.sessionum"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.sessionum"
		                           name="sessionum"
		                           placeholder="<spring:message code='anameneses.sessionum'/>"/>
	                        </div>
	                        <div class="col-md-2" border=1>
	                        	<label><spring:message code="anameneses.sessionfreq"/>:</label>
	                        </div>
	                        <div class="col-md-3" border=1>
	                        	<input type="text"
		                           class="form-control"		                           		                           
		                           ng-model="anamenese.sessionfreq"
		                           name="sessionfreq"
		                           placeholder="<spring:message code='anameneses.sessionfreq'/>"/>
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
    <div class="modal-dialog modal-lg"> 
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
		    	<ul class="nav nav-tabs">
					<li role="presentation" ng-class="{'active': navactive == 'general', '': navactive != 'general'}"><a href="#" ng-click="changeNavBar('general')"><spring:message code="anameneses.navbar.general"/></a></li>
					<li role="presentation" ng-class="{'active': navactive == 'woman', '': navactive != 'woman'}"><a href="#" ng-click="changeNavBar('woman')"><spring:message code="anameneses.navbar.woman"/></a></li>
					<li role="presentation" ng-class="{'active': navactive == 'morphologicalprofile', '': navactive != 'morphologicalprofile'}"><a href="#" ng-click="changeNavBar('morphologicalprofile')"><spring:message code="anameneses.navbar.morphologicalprofile"/></a></li>
					<li role="presentation" ng-class="{'active': navactive == 'biotype', '': navactive != 'biotype'}"><a href="#" ng-click="changeNavBar('biotype')"><spring:message code="anameneses.navbar.biotype"/></a></li>
					<li role="presentation" ng-class="{'active': navactive == 'dailyhabits', '': navactive != 'dailyhabits'}"><a href="#" ng-click="changeNavBar('dailyhabits')"><spring:message code="anameneses.navbar.dailyhabits"/></a></li>
					<li role="presentation" ng-class="{'active': navactive == 'clinicalshape', '': navactive != 'clinicalshape'}"><a href="#" ng-click="changeNavBar('clinicalshape')"><spring:message code="anameneses.navbar.clinicalshape"/></a></li>												
				</ul>
	            
	            <div ng-class="{'input-append': navactive == 'general', 'none': navactive != 'general'}">	
	            	<p/>	 		            	     	
	            	<div class="row">
	            		<div class="col-md-3">		            	
                    	<label>* <spring:message code="anameneses.description"/>:</label>
                    	</div>
                    	<div class="col-md-6" border=1>
	                    <input type="text"
	                           class="form-control"
	                           required
	                           autofocus
	                           ng-model="anamenese.description"
	                           name="description"
	                           placeholder="<spring:message code='anameneses.description'/>"/>	                    
                        <span class="alert alert-danger"
                              ng-show="displayValidationError && newAnameneseForm.description.$error.required">
                                <spring:message code="required"/>
                        </span>
                        </div>
                       </div>  
                       <p/>	 		            	     	
	            	<div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.currentmeds"/>:</label>
                    	</div>
                    	<div class="col-md-2" border=1>
                    		<label class="radio-inline"><input type="radio" name="currentmedsbl" ng-model="anamenese.currentmedsbl" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="currentmedsbl" ng-model="anamenese.currentmedsbl" ng-value=false><spring:message code="anameneses.no"/></label>																	                       								
                        </div>
                        <div class="col-md-1" border=1>
                        	<label><spring:message code="anameneses.which"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.currentmeds"
	                           name="currentmeds"
	                           placeholder="<spring:message code='anameneses.which'/>"/>
                        </div>
                       </div>  
                       <p/>	 		            	     	
	            	<div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.allergies"/>:</label>
                    	</div>
                    	<div class="col-md-2" border=1>
                    		<label class="radio-inline"><input type="radio" name="allergiesbl" ng-model="anamenese.allergiesbl" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="allergiesbl" ng-model="anamenese.allergiesbl" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
                        </div>
                        <div class="col-md-1" border=1>
                        	<label><spring:message code="anameneses.what"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.allergies"
	                           name="allergies"
	                           placeholder="<spring:message code='anameneses.what'/>"/>
                        </div>
                       </div>  
                       <p/>	 		            	     			            	
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.pathologies"/>:</label>
                    	</div>
                    	<div class="col-md-9" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patcardio" ng-model="anamenese.patcardio"><spring:message code="anameneses.patcardio"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patneuro" ng-model="anamenese.patneuro"><spring:message code="anameneses.patneuro"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patpulmo" ng-model="anamenese.patpulmo"><spring:message code="anameneses.patpulmo"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patderma" ng-model="anamenese.patderma"><spring:message code="anameneses.patderma"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="patendo" ng-model="anamenese.patendo"><spring:message code="anameneses.patendo"/></label>																									                       							
                        </div>	                        
                       </div>                         	 		            	     			            
                       <div class="row">
                       	<div class="col-md-3" border=1>
                        	<label><spring:message code="anameneses.observations"/>:</label>
                        </div>
                        <div class="col-md-6" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.pathobserv"
	                           name="pathobserv"
	                           placeholder="<spring:message code='anameneses.observations'/>"/>
                        </div>
					</div> 	
					<p/>	 		            	     			            	
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.bodychanges"/>:</label>
                    	</div>
                    	<div class="col-md-9" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangesova" ng-model="anamenese.bodychangesova"><spring:message code="anameneses.bodychangesova"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangeskidn" ng-model="anamenese.bodychangeskidn"><spring:message code="anameneses.bodychangeskidn"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangesvariz" ng-model="anamenese.bodychangesvariz"><spring:message code="anameneses.bodychangesvariz"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangeshipe" ng-model="anamenese.bodychangeshipe"><spring:message code="anameneses.bodychangeshipe"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangeshipo" ng-model="anamenese.bodychangeshipo"><spring:message code="anameneses.bodychangeshipo"/></label>																									                       							
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangesdiab" ng-model="anamenese.bodychangesdiab"><spring:message code="anameneses.bodychangesdiab"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="bodychangescirur" ng-model="anamenese.bodychangescirur"><spring:message code="anameneses.bodychangescirur"/></label>
                        </div>	                        
                       </div>                         	 		            	     			            
                       <div class="row">
                       	<div class="col-md-3" border=1>
                        	<label><spring:message code="anameneses.observations"/>:</label>
                        </div>
                        <div class="col-md-6" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.bodychangesobserv"
	                           name="bodychangesobserv"
	                           placeholder="<spring:message code='anameneses.observations'/>"/>
                        </div>
					</div>                        
                       <p/>                                          
	            </div>
	            <div ng-class="{'input-append': navactive == 'woman', 'none': navactive != 'woman'}">
	             	<p/>	 		            	     			            	
                       <div class="row">		            		    						        														    		            		
                    	<div class="col-md-11" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="pregnant" ng-model="anamenese.pregnant"><spring:message code="anameneses.pregnant"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="puberty" ng-model="anamenese.puberty"><spring:message code="anameneses.puberty"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="menopause" ng-model="anamenese.menopause"><spring:message code="anameneses.menopause"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="tpm" ng-model="anamenese.tpm"><spring:message code="anameneses.tpm"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="birthcontrol" ng-model="anamenese.birthcontrol"><spring:message code="anameneses.birthcontrol"/></label>																									                       							
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="fibroids" ng-model="anamenese.fibroids"><spring:message code="anameneses.fibroids"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="lactation" ng-model="anamenese.lactation"><spring:message code="anameneses.lactation"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="neoplasia" ng-model="anamenese.neoplasia"><spring:message code="anameneses.neoplasia"/></label>								
                        </div>	                        
                       </div>  
                       <p/>                       	 		            	     			            
                       <div class="row">
                       	<div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.observations"/>:</label>
                        </div>
                        <div class="col-md-6" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.womenobs"
	                           name="womenobs"
	                           placeholder="<spring:message code='anameneses.observations'/>"/>
                        </div>
					</div> 	
					<p/>	
	            </div>	
	            <div ng-class="{'input-append': navactive == 'morphologicalprofile', 'none': navactive != 'morphologicalprofile'}">
	             	<p/>
	             	<div class="row">
		             	<div class="col-md-2">
	                 	<label><spring:message code="anameneses.height"/>:</label>
	                 	</div>
	                 	<div class="col-md-2">
						<input type="text"
						       ng-model="anamenese.height"
						       name="height"
						       placeholder="<spring:message code='anameneses.height'/>"							       
						       class="form-control"/>
				        </div>
			        </div>
			        <p/>
			        <p/>
	             	<div class="row">
		             	<div class="col-md-2">
	                 	<label><spring:message code="anameneses.weight"/>:</label>
	                 	</div>
	                 	<div class="col-md-2">
						<input type="text"
						       ng-model="anamenese.weight"
						       name="weight"
						       placeholder="<spring:message code='anameneses.weight'/>"							       
						       class="form-control"/>
				        </div>
			        </div>
			        <p/>
			        <p/>
	             	<div class="row">
		             	<div class="col-md-2">
	                 	<label><spring:message code="anameneses.imc"/>:</label>
	                 	</div>
	                 	<div class="col-md-2">
						<input type="text"
						       ng-model="anamenese.imc"
						       name="imc"
						       placeholder="<spring:message code='anameneses.imc'/>"							       
						       class="form-control"/>
				        </div>
			        </div>
			        <p/>
	            </div>
	            <div ng-class="{'input-append': navactive == 'biotype', 'none': navactive != 'biotype'}">	
	            	<p/>	 		            	     	
	            	<div class="row">		            		    						        														    
                    	<div class="col-md-9" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="gynoid" ng-model="anamenese.gynoid"><spring:message code="anameneses.gynoid"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="android" ng-model="anamenese.android"><spring:message code="anameneses.android"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="athletic" ng-model="anamenese.athletic"><spring:message code="anameneses.athletic"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="leptossimic" ng-model="anamenese.leptossimic"><spring:message code="anameneses.leptossimic"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="picnico" ng-model="anamenese.picnico"><spring:message code="anameneses.picnico"/></label>																									                       																							
                        </div>	                        
                       </div>   
                       <p/>                                         
	            </div>		            
	            <div ng-class="{'input-append': navactive == 'dailyhabits', 'none': navactive != 'dailyhabits'}">
	             	<p/>
	             	<div class="row">
		             	<div class="col-md-3">
	                 	<label><spring:message code="anameneses.foodtype"/>:</label>
	                 	</div>
	                 	<div class="col-md-7">
						<input type="text"							       
						       ng-model="anamenese.foodtype"
						       name="foodtype"
						       placeholder="<spring:message code='anameneses.foodtype'/>"							       
						       class="form-control"/>
				        </div>
			        </div>
			        <p/>				        
	             	<div class="row">
	             		<div class="col-md-3">
	                 	<label><spring:message code="anameneses.smoker"/>:</label>
	                 	</div>
				        <div class="col-md-2" border=1>
	                   		<label class="radio-inline"><input type="radio" name="smoker" ng-model="anamenese.smoker" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="smoker" ng-model="anamenese.smoker" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
	                    </div>
                    </div>
                    <p/>
                    <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.alcoholic"/>:</label>
                    	</div>
                    	<div class="col-md-2" border=1>
                    		<label class="radio-inline"><input type="radio" name="alcoholic" ng-model="anamenese.alcoholic" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="alcoholic" ng-model="anamenese.alcoholic" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
                        </div>
                        <div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.alcoholicfreq"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.alcoholicfreq"
	                           name="alcoholicfreq"
	                           placeholder="<spring:message code='anameneses.alcoholicfreq'/>"/>
                        </div>
                       </div> 
                       <p/>
                    <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.water"/>:</label>
                    	</div>
                    	<div class="col-md-2" border=1>
                    		<label class="radio-inline"><input type="radio" name="water" ng-model="anamenese.water" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="water" ng-model="anamenese.water" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
                        </div>
                        <div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.waterfreq"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.waterfreq"
	                           name="waterfreq"
	                           placeholder="<spring:message code='anameneses.waterfreq'/>"/>
                        </div>
                       </div>
                       <p/>
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.dailyposition"/>:</label>
                    	</div>
                    	<div class="col-md-5" border=1>
                    		<label class="radio-inline"><input type="radio" name="dailyposition" ng-model="anamenese.dailyposition" ng-value=true><spring:message code="anameneses.seated"/></label>
							<label class="radio-inline"><input type="radio" name="dailyposition" ng-model="anamenese.dailyposition" ng-value=false><spring:message code="anameneses.standing"/></label>									                       								
                        </div>
                    </div>	                    
                    <p/>
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.constipation"/>:</label>
                    	</div>
                    	<div class="col-md-2" border=1>
                    		<label class="radio-inline"><input type="radio" name="constipation" ng-model="anamenese.constipation" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="constipation" ng-model="anamenese.constipation" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
                        </div>
                    </div>
                    <p/>
                    <div class="row">
	            		<div class="col-md-3">		            	
                    	<label><spring:message code="anameneses.hourssplet"/>:</label>
                    	</div>
                    	<div class="col-md-3" border=1>
	                    <input type="text"
	                           class="form-control"
	                           ng-model="anamenese.hourssplet"
	                           name="hourssplet"
	                           placeholder="<spring:message code='anameneses.hourssplet'/>"/>	                    
                        </div>
                       </div>
                       <p/>
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.cosmetics"/>:</label>
                    	</div>
                    	<div class="col-md-2" border=1>
                    		<label class="radio-inline"><input type="radio" name="cosmetics" ng-model="anamenese.cosmetics" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="cosmetics" ng-model="anamenese.cosmetics" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
                        </div>
                        <div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.cosmeticsfreq"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.cosmeticsfreq"
	                           name="cosmeticsfreq"
	                           placeholder="<spring:message code='anameneses.cosmeticsfreq'/>"/>
                        </div>
                       </div>
                       <p/>
	            </div>
	            <div ng-class="{'input-append': navactive == 'clinicalshape', 'none': navactive != 'clinicalshape'}">
	             	<p/>
	             	<div class="row">		            		    						        														    
	            		<div class="col-md-2">		            	
                    		<label><spring:message code="anameneses.hldg"/>:</label>
                    	</div>
                    	<div class="col-md-9" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgI" ng-model="anamenese.hldgI"><spring:message code="anameneses.hldgI"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgII" ng-model="anamenese.hldgII"><spring:message code="anameneses.hldgII"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgIII" ng-model="anamenese.hldgIII"><spring:message code="anameneses.hldgIII"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="hldgIV" ng-model="anamenese.hldgIV"><spring:message code="anameneses.hldgIV"/></label>								
                        </div>	                        
                       </div> 
			        <p/>
			        <div class="row">		            		    						        														    
	            		<div class="col-md-2">		            	
                    		<label><spring:message code="anameneses.consistensy"/>:</label>
                    	</div>
                    	<div class="col-md-9" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="consistensytough" ng-model="anamenese.consistensytough"><spring:message code="anameneses.consistensytough"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="consistensyflaccid" ng-model="anamenese.consistensyflaccid"><spring:message code="anameneses.consistensyflaccid"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="consistensyedematous" ng-model="anamenese.consistensyedematous"><spring:message code="anameneses.consistensyedematous"/></label>									
                        </div>	                        
                       </div>
                       <p/>
                       <div class="row">		            		    						        														    
                    	<div class="col-md-9" border=1>
                    		<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="nodules" ng-model="anamenese.nodules"><spring:message code="anameneses.nodules"/></label>																	                       								
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="atrphicdep" ng-model="anamenese.atrphicdep"><spring:message code="anameneses.atrphicdep"/></label>
							<label class="checkbox-inline"><input type="checkbox" ng-value="1" name="palpain" ng-model="anamenese.palpain"><spring:message code="anameneses.palpain"/></label>																																	                       																					
                        </div>	                        
                       </div>
                       <p/>
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.flabs"/>:</label>
                    	</div>
                    	<div class="col-md-3" border=1>
                    		<label class="radio-inline"><input type="radio" name="flabs" ng-model="anamenese.flabs" ng-value="1"><spring:message code="anameneses.flabstis"/></label>
							<label class="radio-inline"><input type="radio" name="flabs" ng-model="anamenese.flabs" ng-value="2"><spring:message code="anameneses.flabsmus"/></label>									                       								
                        </div>
                        <div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.regionflabs"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.regionflabs"
	                           name="regionflabs"
	                           placeholder="<spring:message code='anameneses.regionflabs'/>"/>
                        </div>
                       </div>
                       <p/>
                       <div class="row">		            		    						        														    
	            		<div class="col-md-3">		            	
                    		<label><spring:message code="anameneses.localfat"/>:</label>
                    	</div>
                    	<div class="col-md-3" border=1>
                    		<label class="radio-inline"><input type="radio" name="localfat" ng-model="anamenese.localfat" ng-value=true><spring:message code="anameneses.yes"/></label>
							<label class="radio-inline"><input type="radio" name="localfat" ng-model="anamenese.localfat" ng-value=false><spring:message code="anameneses.no"/></label>									                       								
                        </div>
                        <div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.regionfat"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.regionfat"
	                           name="regionfat"
	                           placeholder="<spring:message code='anameneses.regionfat'/>"/>
                        </div>
                       </div>
                       <p/>                        
                       <div class="row">
                       	<div class="col-md-3" border=1>
                        	<label><spring:message code="anameneses.aesthctreat"/>:</label>
                        </div>
                        <div class="col-md-5" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.aesthctreat"
	                           name="aesthctreat"
	                           placeholder="<spring:message code='anameneses.aesthctreat'/>"/>
                        </div>
                       </div>
                       <p/>
                       <div class="row">
                       	<div class="col-md-3" border=1>
                        	<label><spring:message code="anameneses.aesthccomplains"/>:</label>
                        </div>
                        <div class="col-md-5" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.aesthccomplains"
	                           name="aesthccomplains"
	                           placeholder="<spring:message code='anameneses.aesthccomplains'/>"/>
                        </div>
                       </div>
                       <p/>
                       <div class="row">
                       	<div class="col-md-3" border=1>
                        	<label><spring:message code="anameneses.proptreat"/>:</label>
                        </div>
                        <div class="col-md-5" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.proptreat"
	                           name="proptreat"
	                           placeholder="<spring:message code='anameneses.proptreat'/>"/>
                        </div>
                       </div>
                       <p/>
                       <div class="row">
                       	<div class="col-md-3" border=1>
                        	<label><spring:message code="anameneses.sessionum"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.sessionum"
	                           name="sessionum"
	                           placeholder="<spring:message code='anameneses.sessionum'/>"/>
                        </div>
                        <div class="col-md-2" border=1>
                        	<label><spring:message code="anameneses.sessionfreq"/>:</label>
                        </div>
                        <div class="col-md-3" border=1>
                        	<input type="text"
	                           class="form-control"		                           		                           
	                           ng-model="anamenese.sessionfreq"
	                           name="sessionfreq"
	                           placeholder="<spring:message code='anameneses.sessionfreq'/>"/>
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
