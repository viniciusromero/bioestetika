<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagebody" ng-controller="admissionsController" id="admissionsController">

    <div ng-class="{'panel panel-primary': state != 'nosession', 'none': state == 'nosession'}">
	  <div class="panel-heading">
	    <h3 class="panel-title"><spring:message code='admissions.title'/></h3>
	  </div>
	  <div class="panel-body">
	    <div class="col-md-3">		            	
       		<b><spring:message code='patients.id'/>:</b>&nbsp;{{patient.id}}       		
       	</div>
       	<div class="col-md-3">	
       		<b><spring:message code='patients.name'/>:</b>&nbsp;{{patient.name}}
       	</div>
       	<div class="col-md-3">	
       		<b><spring:message code='patients.dob'/>:</b>&nbsp;{{patient.dob | date : 'dd/MM/yyyy'}}
       	</div>
	  </div>
	</div>
   	<div ng-class="{'alert alert-info': state == 'nosession', 'none': state != 'nosession'}">
    	<h4><i class="icon-info-sign"></i> <spring:message code="admissions.patient.emptyData"/></h4><br/>            
    </div>
    <h4>
        <div ng-class="{'': state == 'list', 'none': state != 'list'}">
            <p class="text-center">
                <spring:message code="message.total.records.found"/>:&nbsp;{{page.totalAdmissions}}
            </p>
        </div>
    </h4>
    <div ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="admissions.emptyData"/></h4><br/>

            <p><spring:message code="admissions.emptyData.text"/></p>
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
                	<th scope="col"><spring:message code="admissions.id"/></th>
                    <th scope="col"><spring:message code="admissions.admdate"/></th>
                    <th scope="col"><spring:message code="admissions.admtime"/></th>
                    <th scope="col"><spring:message code="admissions.dischgdate"/></th>
                    <th scope="col"><spring:message code="admissions.dischgtime"/></th>                    
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="admission in page.source">                	
                    <td class="tdTableData">{{admission.id}}</td>
                    <td class="tdTableData">{{admission.admdate | date:'dd/MM/yyyy'}}</td>
                    <td class="tdTableData">{{admission.admtime | date:'HH:mm'}}</td>
                    <td class="tdTableData">{{admission.dischgdate | date:'dd/MM/yyyy'}}</td>
                    <td class="tdTableData">{{admission.dischgtime | date:'HH:mm'}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{admission.id}}"/>
                            <a href="#updateAdmissionsModal"
                               ng-click="selectedAdmission(admission);"
                               role="button"
                               title="<spring:message code="update"/>&nbsp;<spring:message code="admissions"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </a>                                                    
                            <input type="hidden" value="{{admission.id}}"/>
                            <a href="{{urlanamenese}}"
                               ng-click="addAdmissionSession(admission);"
                               role="button"
                               title="<spring:message code="list"/>&nbsp;<spring:message code="anameneses"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-list"></i>
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
        <div ng-class="{'text-center': displayCreateAdmissionButton == true, 'none': displayCreateAdmissionButton == false}">
            <br/>
            <a href="#addAdmissionsModal"
               role="button"
               ng-click="resetAdmission();"
               title="<spring:message code='create'/>&nbsp;<spring:message code='admissions'/>"
               class="btn btn-primary"
               data-toggle="modal">
                <i class="glyphicon glyphicon-plus"></i>
                &nbsp;&nbsp;<spring:message code="create"/>&nbsp;<spring:message code="admissions"/>
            </a>
         </div>
         <jsp:include page="dialogs/admissionsDialogs.jsp"/>     
	</div>

</div>

<script src="<c:url value="/resources/js/pages/admissions.js" />"></script>