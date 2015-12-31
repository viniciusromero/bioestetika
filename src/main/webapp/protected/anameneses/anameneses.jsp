<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagebody" ng-controller="anamenesesController" id="anamenesesController">
	<div ng-class="{'panel panel-primary': state != 'nosession', 'none': state == 'nosession'}">      
	  <div class="panel-heading">
	    <h3 class="panel-title"><spring:message code='anameneses.title'/></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row"> 	
	    <div class="col-md-3">		            	
       		<b><spring:message code='patients.id'/>:</b>&nbsp;{{admission.patient.id}}       		
       	</div>
       	<div class="col-md-4">	
       		<b><spring:message code='patients.name'/>:</b>&nbsp;{{admission.patient.name}}
       	</div>
       	<div class="col-md-3">	
       		<b><spring:message code='patients.dob'/>:</b>&nbsp;{{admission.patient.dob | date : 'dd/MM/yyyy'}}
       	</div>
       	</div>       	
       	<div class="row">
       	<p/> 	
	    <div class="col-md-3">		            	
       		<b><spring:message code='admissions.id'/>:</b>&nbsp;{{admission.id}}       		
       	</div>
       	<div class="col-md-4">	
       		<b><spring:message code='admissions.admdate'/>:</b>&nbsp;{{admission.admdate | date : 'dd/MM/yyyy'}}
       	</div>
       	<div class="col-md-3">	
       		<b><spring:message code='admissions.admtime'/>:</b>&nbsp;{{admission.admtime | date : 'hh:mm'}}
       	</div>
       	</div>
	  </div>
	</div>
   	<div ng-class="{'alert alert-info': state == 'nosession', 'none': state != 'nosession'}">
    	<h4><i class="icon-info-sign"></i> <spring:message code="anameneses.admission.emptyData"/></h4><br/>            
    </div>
    <h4>
        <div ng-class="{'': state == 'list', 'none': state != 'list'}">
            <p class="text-center">
                <spring:message code="message.total.records.found"/>:&nbsp;{{page.totalAnameneses}}
            </p>
        </div>
    </h4>
    <div ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="anameneses.emptyData"/></h4><br/>

            <p><spring:message code="anameneses.emptyData.text"/></p>
        </div>
    <div>        
		
        <div ng-class="{'alert alert-block alert-danger': state == 'error', 'none': state != 'error'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="error.generic.header"/></h4><br/>
            <p><spring:message code="error.generic.text"/></p>
        </div>
        <div id="gridContainer" ng-class="{'': state == 'list', 'none': state != 'list'}">
            <table class="table table-hover">
                <thead>
                <tr>
                	<th scope="col"><spring:message code="anameneses.id"/></th>
                    <th scope="col"><spring:message code="anameneses.description"/></th>
                    <th scope="col"><spring:message code="anameneses.createdate"/></th>
                    <th scope="col"><spring:message code="anameneses.createtime"/></th>   
                    <th scope="col"><spring:message code="anameneses.updatedate"/></th>
                    <th scope="col"><spring:message code="anameneses.updatetime"/></th>                                       
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="anamenese in page.source">                	
                    <td class="tdTableData">{{anamenese.id}}</td>
                    <td class="tdTableData">{{anamenese.description}}</td> 
                    <td class="tdTableData">{{anamenese.createdate | date:'dd/MM/yyyy'}}</td>
                    <td class="tdTableData">{{anamenese.createtime | date:'HH:mm'}}</td>                   
                    <td class="tdTableData">{{anamenese.updatedate | date:'dd/MM/yyyy'}}</td>
                    <td class="tdTableData">{{anamenese.updatetime | date:'HH:mm'}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{anamenese.id}}"/>
                            <a href="#updateAnamenesesModal"
                               ng-click="selectedAnamenese(anamenese);"
                               role="button"
                               title="<spring:message code="update"/>&nbsp;<spring:message code="anameneses"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </a>                                                                                                                                                               
                        </div>
                    </td>                    
                </tr>
                </tbody>
            </table>
            <div class="text-center">
                <button href="#" class="btn btn-inverse"
                        ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
                        title='<spring:message code="pagination.first"/>'
                        >
                    <spring:message code="pagination.first"/>
                </button>
                <button href="#"
                        class="btn btn-inverse"
                        ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" class="btn btn-inverse"
                        ng-click="changePage(page.currentPage - 1)"
                        title='<spring:message code="pagination.back"/>'
                        >&lt;</button>
                <span>{{page.currentPage + 1}} <spring:message code="pagination.of"/> {{page.pagesCount}}</span>
                <button href="#"
                        class="btn btn-inverse"
                        ng-class="{'btn-inverse': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-click="changePage(page.currentPage + 1)"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        title='<spring:message code="pagination.next"/>'
                        >&gt;</button>
                <button href="#"
                        class="btn btn-inverse"
                        ng-class="{'btn-inverse': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        ng-click="changePage(page.pagesCount - 1)"
                        title='<spring:message code="pagination.last"/>'
                        >
                    <spring:message code="pagination.last"/>
                </button>
                

            </div>
        </div>
        <div ng-class="{'text-center': displayCreateAnameneseButton == true, 'none': displayCreateAnameneseButton == false}">
            <br/>
            <a href="#addAnamenesesModal"
               role="button"
               ng-click="resetAnamenese();"
               title="<spring:message code='create'/>&nbsp;<spring:message code='anameneses'/>"
               class="btn btn-primary"
               data-toggle="modal">
                <i class="glyphicon glyphicon-plus"></i>
                &nbsp;&nbsp;<spring:message code="create"/>&nbsp;<spring:message code="anameneses"/>
            </a>
         </div>
         <jsp:include page="dialogs/anamenesesDialogs.jsp"/>     
	</div>

</div>

<script src="<c:url value="/resources/js/pages/anameneses.js" />"></script>