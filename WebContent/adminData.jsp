<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${param.mode == 'dta_by_state' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select state as label,count(*) from n3c_admin.dashboard where dta_executed is not null group by 1 order by 2 desc;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_by_network' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select data_network as label,count(*) from n3c_admin.dashboard where dta_executed is not null group by 1 order by 2 desc;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_by_reason' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select target_reason as label,count(*) from n3c_admin.dashboard where dta_executed is not null group by 1 order by 2 desc;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_by_wave' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select wave as label,count(*) from n3c_admin.dashboard where dta_executed is not null group by 1 order by 2 desc;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_pending' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select dta_sent as label,count(*) from n3c_admin.dashboard where dta_executed is null group by 1 order by 1;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_pending_by_state' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select state as label,count(*) from n3c_admin.dashboard where dta_executed is null group by 1 order by 2 desc, 1;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_pending_by_network' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select data_network as label,count(*) from n3c_admin.dashboard where dta_executed is null group by 1 order by 2 desc, 1;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_pending_by_reason' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select target_reason as label,count(*) from n3c_admin.dashboard where dta_executed is null group by 1 order by 2 desc;
		</sql:query>
	</c:when>
	<c:when test="${param.mode == 'dta_pending_by_wave' }">
		<sql:query var="entries" dataSource="jdbc/covid">
    		select wave as label,count(*) from n3c_admin.dashboard where dta_executed is null group by 1 order by 2 desc;
		</sql:query>
	</c:when>
</c:choose>

[
<c:forEach items="${entries.rows}" var="row" varStatus="rowCounter">
        {"element":"${row.label}","count":${row.count}}<c:if test="${ rowCounter.count < entries.rowCount }">,</c:if>
    </c:forEach>
  ]
