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
				<c:when test="${empty param.view or param.view == 'executed' }">
					<h2>Data Acquisition Group Engagement</h2>
					<div id=others style="float: left; width: 100%">
						<br />
						<div id="graph_block" style="float: left; width: 45%">
							<h3>Count by State</h3>
							<div id="acq_by_state" align="left"></div>
						</div>
						<div id="graph_block" style="float: left; width: 45%">
							<jsp:include page="graphs/verticalBarChart.jsp">
								<jsp:param name="data_page"
									value="adminData.jsp?mode=acq_by_state" />
								<jsp:param name="dom_element" value="#acq_by_state" />
							</jsp:include>
							<div id="graph_block" style="float: left; width: 45%">
								<h3>Count by Data Model</h3>
								<div id="acq_by_model" align="left"></div>
							</div>
							<jsp:include page="graphs/verticalBarChart.jsp">
								<jsp:param name="data_page"
									value="adminData.jsp?mode=acq_by_model" />
								<jsp:param name="dom_element" value="#acq_by_model" />
							</jsp:include>
						</div>
					</div>
					<div id=others style="float: left; width: 100%">
						<br />
						<div id="graph_block" style="float: left; width: 45%">
							<h3>Count by First Meeting Date</h3>
							<div id="acq_meeting" align="left"></div>
						</div>
						<div id="graph_block" style="float: left; width: 45%">
							<jsp:include page="graphs/verticalBarChart.jsp">
								<jsp:param name="data_page"
									value="adminData.jsp?mode=acq_meeting" />
								<jsp:param name="dom_element" value="#acq_meeting" />
							</jsp:include>
						</div>
					</div>
					<div id=others style="float: left; width: 100%">
					<br/>
					<h2>Status</h2>
						<sql:query var="dta" dataSource="jdbc/covid">
                    		select site,city,state,first_meeting,data_model,passing_data from n3c_admin.dashboard3 order by site;
                		</sql:query>
                		<table>
                		<tr><th>Site</th><th>City</th><th>State</th><th>First Meeting</th><th>Data Model</th><th>Passing Data</th></tr>
 						<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
							<tr>
								<td>${row.site}</td>
								<td>${row.city}</td>
								<td>${row.state}</td>
								<td>${row.first_meeting}</td>
								<td>${row.data_model}</td>
								<td>${row.passing_data}</td>
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
