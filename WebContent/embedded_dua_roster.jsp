<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
			<sql:query var="dua" dataSource="jdbc/covid">
            	select institutionid,site_name,dua_contact_first,dua_contact_last,dua_contact_email,dua_executed
            	from n3c_admin.dua_master
            	where dua_executed is not null
            	order by site_name;
            </sql:query>
            <table>
            <tr><th>Institution</th><th>Local Contact</th><th>Date Executed</th></tr>
			<c:forEach items="${dua.rows}" var="row" varStatus="rowCounter">
				<tr><td>${row.site_name}</td><td><a href="mailto:${row.dua_contact_email}">${row.dua_contact_first} ${row.dua_contact_last}</a></td><td>${row.dua_executed}</td></tr>
			</c:forEach>
            </table>
			