<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="masthead">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <ul class="nav nav-pills" ng-controller="LocationController">
                    <li ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}" >
                        <a href="<c:url value="/"/>"
                           title='<spring:message code="header.home"/>'>
                            <p><spring:message code="header.home"/></p>
                        </a>
                    </li>
                    <li ng-class="{'active': activeURL == 'patients', '': activeURL != 'patients'}">
						<a title='<spring:message code="header.patients"/>' href="<c:url value='/protected/patients'/>">
							<p><spring:message code="header.patients"/></p>
						</a>
					</li>
					<li ng-class="{'active': activeURL == 'admissions', '': activeURL != 'admissions'}">
						<a title='<spring:message code="header.admissions"/>' href="<c:url value='/protected/admissions'/>">
							<p><spring:message code="header.admissions"/></p>
						</a>
					</li>
					
					<li class="pull-right"><a href="<c:url value='/logout' />" title='<spring:message code="header.logout"/>'><p class="displayInLine"><spring:message code="header.logout"/>&nbsp;</p></a></li>
                </ul> 
  </div>
</nav>
</div>
<!--  
<div class="masthead">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav nav-pills" ng-controller="LocationController">
                    <li ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}" >
                        <a href="<c:url value="/"/>"
                           title='<spring:message code="header.home"/>'
                                >
                            <p><spring:message code="header.home"/></p>
                        </a>
                    </li>
                    <li ng-class="{'active': activeURL == 'patients', '': activeURL != 'patients'}">
						<a title='<spring:message code="header.patients"/>' href="<c:url value='/protected/patients'/>">
							<p><spring:message code="header.patients"/></p>
						</a>
					</li>
					<li ng-class="{'active': activeURL == 'admissions', '': activeURL != 'admissions'}">
						<a title='<spring:message code="header.admissions"/>' href="<c:url value='/protected/admissions'/>">
							<p><spring:message code="header.admissions"/></p>
						</a>
					</li>
					
					<li class="pull-right"><a href="<c:url value='/logout' />" title='<spring:message code="header.logout"/>'><p class="displayInLine"><spring:message code="header.logout"/>&nbsp;</p></a></li>
                </ul>                
            </div>
        </div>
    </div>
</div>
-->