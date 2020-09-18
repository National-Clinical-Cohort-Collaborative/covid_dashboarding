<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<html>
	<jsp:include page="head.jsp" flush="true" />

<style type="text/css" media="all">
@import "resources/n3c_login_style.css";
</style>

<body>

	<div class="container center-box shadow-border">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3C Dashboard
		</h2>
		
		<div class="container center-box" id=others style="float: left; width: 45%">
		<h3>Clinical Data Summary</h3>
	    <table class="table table-hover">
	    <thead>
	    <tr><th>Metric</th><th>Count</th></tr>
	    </thead>
	    <sql:query var="duas" dataSource="jdbc/covid">
	        select title,count from n3c_admin.enclave_stats order by count;
	    </sql:query>
	    <c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
	        <tr><td>${row.title}</td><td align=right><fmt:formatNumber type = "number" groupingUsed = "true" value = "${row.count}" /></td></tr>
	    </c:forEach>
	    </table>

	</div>
	</div>
	<div id=others style="float: left; width: 100%">
		<jsp:include page="footer.jsp" flush="true" />
		</div>
</body>
</html>
