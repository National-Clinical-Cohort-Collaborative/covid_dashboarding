<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="head.jsp" flush="true">
	<jsp:param name="title" value="N3C Analytics" />
</jsp:include>
<style type="text/css" media="all">
@import "resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br /> <br />
		<div class="container-fluid">
			<h1>N3C Administrative Dashboard</h1>
			<p>Currently we are only tracking progress on the Data Transfer Agreements.  We aree merging IRB protocol status data.
			Once the Data Use Agreement processing begins, we will also include that data.</p>
			<table>
				<tr>
					<th>Element</th>
					<th>Total</th>
					<th>Completed</th>
				</tr>
				<tr>
					<td>DTA</td>
					<td align=right>
						<sql:query var="dta" dataSource="jdbc/covid">
                    		select count(*) from n3c_admin.ncats where dta_sent is not null;
                		</sql:query>
						<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
							${row.count}
						</c:forEach>
					</td>
					<td align=right>
						<sql:query var="dta" dataSource="jdbc/covid">
                    		select count(*) from n3c_admin.ncats where dta_executed is not null;
                		</sql:query>
						<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
							${row.count}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>IRB</td>
					<td align=right>
						<sql:query var="dta" dataSource="jdbc/covid">
                    		select count(*) from n3c_admin.irb;
                		</sql:query>
						<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
							${row.count}
						</c:forEach>
					</td>
					<td align=right></td>
				</tr>
				<tr>
					<td>DUA</td>
					<td align=right></td>
					<td align=right></td>
				</tr>
			</table>
		</div>
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>

</html>
