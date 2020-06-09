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
			<h1>N3C Status</h1>
			<br>
			
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.ncats where dta_executed is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				<h3>DTAs Executed: ${row.count}</h3>
			</c:forEach>
			<br>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.irb where cleared is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				<h3>IRB Protocols Approved: ${row.count}</h3>
			</c:forEach>
			<br>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard where dta_executed is not null and cleared is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				<h3>All Regulatory Requirements Completed: ${row.count}</h3>
			</c:forEach>
			<br>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard3;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				<h3>Sites Engaged by Data Acquisition Group: ${row.count}</h3>
			</c:forEach>
           	<ul>
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard3 where first_meeting is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				<li>First meeting held: ${row.count}
			</c:forEach>
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard3 where passing_data is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				<li>Passing data: ${row.count}
			</c:forEach>
           	</ul>
			<br>

		</div>
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>

</html>
