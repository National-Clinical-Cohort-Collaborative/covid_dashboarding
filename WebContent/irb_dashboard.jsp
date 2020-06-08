<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="head.jsp" flush="true">
	<jsp:param name="title" value="N3C DTA Analytics" />
</jsp:include>
<style type="text/css" media="all">
@import "resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="header.jsp" flush="true" />
	<div class="container pl-0 pr-0">
		<br /> <br />
		<div class="container-fluid">
			<c:choose>
				<c:when test="${empty param.view or param.view == 'detail' }">
					<h2>Status of Protocols</h2>
					<div id=others style="float: left; width: 100%">
						<sql:query var="dta" dataSource="jdbc/covid">
                    		select site,submitted,approved,local_approval,local_receipt,(dta_executed is not null and cleared is not null) as completed from n3c_admin.dashboard order by completed desc,site;
                		</sql:query>
                		<table>
                		<tr><th>Site</th><th>Submitted to sIRB</th><th>sIRB Approved</th><th>Local IRB Approved</th><th>Receipt of Local IRB Letter</th><th>All Regulatory Completed</th></tr>
 						<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
							<tr>
								<td>${row.site}</td>
								<td>${row.submitted}</td>
								<td>${row.approved}</td>
								<td>${row.local_approval}</td>
								<td>${row.local_receipt}</td>
								<td>${row.completed}</td>
							</tr>
						</c:forEach>
               		</table>
               		</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div id=others style="float: left; width: 100%">
		<jsp:include page="/footer.jsp" flush="true" />
	</div>
</body>
</html>
