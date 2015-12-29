<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="logo">
	<img src="<c:url value='/resources/img/logo.jpg'/>" height="100px"/>
	<br/><br/>
	<div class="login panel panel-primary" ng-controller="loginController">
	  <div class="panel-heading">
	    <h3 class="panel-title"><spring:message code="login.header" /></h3>
	  </div>
	  <div class="panel-body">	    
	    <div class="alert alert-danger" ng-class="{'': displayLoginError == true, 'none': displayLoginError == false}">
	    	<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
	    	&nbsp;
	    	<spring:message code="login.error" />
	    </div>
	   	<form method="post" action="j_spring_security_check">    		
			<input name="j_username" id="j_username" type="text" placeholder="<spring:message code='sample.email'/> "><br><br>
	        <input name="j_password" id="j_password" type="password"  placeholder="Password"><br/><br>
	        <button type="submit" name="submit" class="btn btn-primary"><spring:message code="login.signIn" /></button>   		
	    </form>    	
	  </div>
	</div>
</div>

<script src="<c:url value='/resources/js/pages/login.js' />"></script>