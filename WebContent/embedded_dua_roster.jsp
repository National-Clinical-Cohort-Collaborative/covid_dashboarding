<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" id='bootstrap main'
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
			<sql:query var="dua" dataSource="jdbc/covid">
            	select dua_master.institutionid,site_name,name,dua_contact_first,dua_contact_last,dua_contact_email,piname,piemail,dua_executed
            	from n3c_admin.dua_master,n3c_admin.site_master,ror.organization
            	where dua_executed is not null and id=dua_master.institutionid and dua_master.institutionid=site_master.institutionid
            	order by name;
            </sql:query>
            <table class="table table-hover">
            <thead><tr><th><i class="fa fa-university" aria-hidden="true" style="color: #376076;"></i> Institution (ROR)</th><th><i class="fa fa-user" aria-hidden="true" style="color: #376076;"></i> Local Contact</th><th><i class="fa fa-user" aria-hidden="true" style="color: #376076;"></i> Local PI</th><th><i class="fa fa-calendar-o" aria-hidden="true" style="color: #376076;"></i> Date Executed</th></tr></thead>
			<c:forEach items="${dua.rows}" var="row" varStatus="rowCounter">
				<tr><td>${row.name}</td><td>${row.dua_contact_first} ${row.dua_contact_last}</td><td>${row.piname}</td><td>${row.dua_executed}</td></tr>
			</c:forEach>
            </table>