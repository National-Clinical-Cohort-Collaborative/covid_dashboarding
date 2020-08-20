<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
			<sql:query var="projects" dataSource="jdbc/covid">
            	select title, description, pi_name, pi_institution
            	from n3c_admin.n3c_project
            	order by title;
            </sql:query>
            <ul>
			<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
				<li><b>${row.title}</b>: ${row.description}<br><b>PI</b>: ${row.pi_name} <i>(${row.pi_institution})</i>
			</c:forEach>
            </ul>
			