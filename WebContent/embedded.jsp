<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
{		
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.ncats where dta_executed is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"DTAs Executed": ${row.count},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.irb where cleared is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"IRB Protocols Approved": ${row.count},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard where dta_executed is not null and cleared is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"All Regulatory Requirements Completed": ${row.count},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard3;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"Sites Engaged by Data Acquisition Group": ${row.count},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard3 where first_meeting is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"First meeting held": ${row.count},
			</c:forEach>
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) from n3c_admin.dashboard3 where passing_data is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"Passing data": ${row.count}
			</c:forEach>
}