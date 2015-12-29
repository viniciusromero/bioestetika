<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagebody" ng-controller="patientsController" id="patientsController">
	
	<div class="panel panel-primary">
	  <div class="panel-heading">
	    <h3 class="panel-title"><spring:message code="search.for"/></h3>
	  </div>
	  <div class="panel-body">	    
    	<form class="form-inline" name="searchPatientForm" novalidate>    		
    		<div class="form-group">
    			<input type="text"
	                   autofocus
	                   required
	                   ng-model="searchFor"
	                   name="searchFor"                           
	                   placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/> "
	                   class="form-control"/>
	            <!-- <span class="alert alert-danger"
	                  ng-show="displayValidationError && searchPatientForm.searchFor.$error.required">
	                <spring:message code="required"/>
	            </span> -->                   
                
	            <input type="submit"
	                  class="btn btn-default "
	                  ng-click="searchPatient(searchPatientForm, false);"
	                  value='<spring:message code="search"/>' />
	                              	           
            </div>
       	</form>    	
	  </div>
	</div>

    <h4>
        <div ng-class="{'': state == 'list', 'none': state != 'list'}">
            <p class="text-center">
                <spring:message code="message.total.records.found"/>:&nbsp;{{page.totalPatients}}
            </p>
        </div>
    </h4>

    <div>        
		<!--
        <div ng-class="{'alert badge-inverse': displaySearchMessage == true, 'none': displaySearchMessage == false}">
            <h4>
                <p class="messageToUser"><i class="icon-info-sign"></i>&nbsp;{{page.searchMessage}}</p>
            </h4>
            <a href="#"
               role="button"
               ng-click="resetSearch();"
               ng-class="{'': displaySearchMessage == true, 'none': displaySearchMessage == false}"
               title="<spring:message code='search.reset'/>"
               class="btn btn-inverse" data-toggle="modal">
                <i class="icon-remove"></i> <spring:message code="search.reset"/>
            </a>
        </div>-->

        <div ng-class="{'alert alert-block alert-danger': state == 'error', 'none': state != 'error'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="error.generic.header"/></h4><br/>
            <p><spring:message code="error.generic.text"/></p>
        </div>

        <div ng-class="{'alert alert-info': state == 'noresult', 'none': state != 'noresult'}">
            <h4><i class="icon-info-sign"></i> <spring:message code="patients.emptyData"/></h4><br/>

            <p><spring:message code="patients.emptyData.text"/></p>
        </div>

        <div id="gridContainer" ng-class="{'': state == 'list', 'none': state != 'list'}">
            <table class="table table-hover">
                <thead>
                <tr>
                	<th scope="col"><spring:message code="patients.id"/></th>
                    <th scope="col"><spring:message code="patients.name"/></th>
                    <th scope="col"><spring:message code="patients.dob"/></th>                    
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="patient in page.source">
                    <td class="tdTableData">{{patient.id}}</td>
                    <td class="tdTableData">{{patient.name}}</td>
                    <td class="tdTableData">{{patient.dob | date:'dd/MM/yyyy'}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{patient.id}}"/>
                            <a href="#updatePatientsModal"
                               ng-click="selectedPatient(patient);"
                               role="button"
                               title="<spring:message code="update"/>&nbsp;<spring:message code="patient"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </a>
                            <!-- <a href="#deletePatientsModal"
                               ng-click="selectedPatient(patient);"
                               role="button"
                               title="<spring:message code="delete"/>&nbsp;<spring:message code="patient"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-remove"></i>
                            </a> -->
                            <a ng-href="{{urladmission}}"
                               ng-click="addPatientSession(patient);"
                               role="button"
                               title="<spring:message code="list"/>&nbsp;<spring:message code="admissions"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-list"></i>
                            </a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="text-center">
                <button href="#" class="btn btn-default"
                        ng-class="{'btn-inverse': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
                        title='<spring:message code="pagination.first"/>'
                        >
                    <spring:message code="pagination.first"/>
                </button>
                <button href="#"
                        class="btn btn-default"
                        ng-class="{'btn-default': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" class="btn btn-inverse"
                        ng-click="changePage(page.currentPage - 1)"
                        title='<spring:message code="pagination.back"/>'
                        >&lt;</button>
                <span>{{page.currentPage + 1}} <spring:message code="pagination.of"/> {{page.pagesCount}}</span>
                <button href="#"
                        class="btn btn-default"
                        ng-class="{'btn-default': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-click="changePage(page.currentPage + 1)"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        title='<spring:message code="pagination.next"/>'
                        >&gt;</button>
                <button href="#"
                        class="btn btn-default"
                        ng-class="{'btn-default': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        ng-click="changePage(page.pagesCount - 1)"
                        title='<spring:message code="pagination.last"/>'
                        >
                    <spring:message code="pagination.last"/>
                </button>
            </div>
        </div>
        <div ng-class="{'text-center': displayCreatePatientButton == true, 'none': displayCreatePatientButton == false}">
            <br/>
            <a href="#addPatientsModal"
               role="button"
               ng-click="resetPatient();"
               title="<spring:message code='create'/>&nbsp;<spring:message code='patient'/>"
               class="btn btn-primary"
               data-toggle="modal">
                <i class="glyphicon glyphicon-plus"></i>
                &nbsp;&nbsp;<spring:message code="create"/>&nbsp;<spring:message code="patient"/>
            </a>
         </div>
         <jsp:include page="dialogs/patientsDialogs.jsp"/>
         
         
	</div>
	
	
</div>

<script src="<c:url value="/resources/js/pages/patients.js" />"></script>