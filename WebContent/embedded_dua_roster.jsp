<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
			<sql:query var="dua" dataSource="jdbc/covid">
            	select dua_master.institutionid,site_name,name,dua_contact_first,dua_contact_last,dua_contact_email,piname,piemail,dua_executed
            	from n3c_admin.dua_master,n3c_admin.site_master,ror.organization
            	where dua_executed is not null and id=dua_master.institutionid and dua_master.institutionid=site_master.institutionid
            	order by name;
            </sql:query>
            <table>
            <tr><th>Institution (ROR)</th><th>Local Contact</th><th>Local PI</th><th>Date Executed</th></tr>
			<c:forEach items="${dua.rows}" var="row" varStatus="rowCounter">
				<tr><td>${row.name}</td><td><a href="mailto:${row.dua_contact_email}">${row.dua_contact_first} ${row.dua_contact_last}</a></td><td><a href="mailto:${row.piemail}">${row.piname}</a></td><td>${row.dua_executed}</td></tr>
			</c:forEach>
            </table>
			