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
		<br /> <br />
			<c:choose>
				<c:when test="${empty param.view or param.view == 'detail' }">
					<h2>Overall Status</h2>
						<sql:query var="dta" dataSource="jdbc/covid">
                    		select *, case when dta_executed is null or cleared is null then null when dta_executed > cleared then dta_executed else cleared end as completed from n3c_admin.dashboard order by site;
                		</sql:query>
						<table>
							<tr>
								<th colspan=8></th>
								<th colspan=4>NCATS</th>
								<th colspan=5>sIRB</th>
								<th colspan=3>Data Acquisition Group</th>
							</tr>
							<tr>
								<th>Site</th>
								<th>City</th>
								<th>State</th>
								<th>CTSA/Non-CTSA</th>
								<th>CTSA/Community</th>
								<th>Group/Consortium</th>
								<th>Data Ingest Date</th>
								<th>Initial Data Received</th>
								<th>DTA Sent</th>
								<th>DTA Executed</th>
								<th>DUA Sent</th>
								<th>DUA Executed</th>
								<th>Submitted to sIRB</th>
								<th>sIRB Approved</th>
								<th>Local IRB Approved</th>
								<th>Receipt of Local IRB Letter</th>
								<th>All Regulatory Completed</th>
								<th>First Meeting</th>
								<th>Data Model</th>
								<th>Passing Data</th>
							</tr>
							<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
								<tr>
									<td>${row.site}</td>
									<td>${row.city}</td>
									<td>${row.state}</td>
									<td>${row.ctsa_non_ctsa}</td>
									<td>${row.ctsa_community}</td>
									<td>${row.group_consortium}</td>
									<td>${row.data_ingest_date}</td>
									<td>${row.initial_data_received}</td>
									<td>${row.dta_sent}</td>
									<td>${row.dta_executed}</td>
									<td>${row.dua_sent}</td>
									<td>${row.dua_executed}</td>
									<td>${row.submitted}</td>
									<td>${row.approved}</td>
									<td>${row.local_approval}</td>
									<td>${row.local_receipt}</td>
									<td>${row.completed}</td>
									<td>${row.first_meeting}</td>
									<td>${row.data_model}</td>
									<td>${row.passing_data}</td>
								</tr>
							</c:forEach>
						</table>
				</c:when>
			</c:choose>
	<div id=others style="float: left; width: 100%">
		<jsp:include page="/footer.jsp" flush="true" />
	</div>
</body>
</html>
