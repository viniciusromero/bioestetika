<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
<head>
        <title><spring:message  code="project.title" /></title>
        <link href="<c:url value='/resources/css/bootstrap.min.css'  />" rel="stylesheet"/>        
        <link href="<c:url value='/resources/css/project_style.css'  />" rel="stylesheet"/>
        <script src="<c:url value='/resources/js/jquery-1.11.3.min.js' />"></script>
        <script src="<c:url value='/resources/js/angular.min.js' />"></script>
        <script src="<c:url value='/resources/js/pages/header.js' />"></script>
        <script src="<c:url value='/resources/js/pages/master.js' />"></script>
    </head>
    <body>
        <div class="container">
            <tiles:insertAttribute name="header" />
 
            <tiles:insertAttribute name="body" />
        </div>
 
        <!--[if IE]>
            <script src="<c:url value='/resources/js/bootstrap.min.ie.js' />"></script>
        <![endif]-->
        <!--[if !IE]><!-->
            <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
        <!--<![endif]-->
 
        <tiles:insertAttribute name="footer" />
        
        <div id="loadingModal" class="modal fade in"
             role="dialog"
             aria-labelledby="deletePatientsModalLabel" aria-hidden="true"
     		 data-backdrop="static" data-keyboard="false">
             <div class="modal-dialog modal-sm center-modal-sm">
             	<div class="modal-content">
             		<div class="modal-body">
             			<img src="<c:url value='/resources/img/ajax-loader.gif' />" />
             			<p/>
             			<spring:message code="loading"/>             			
             		</div>
             	</div>
             </div>                                
        </div>
        
    </body>
</html>