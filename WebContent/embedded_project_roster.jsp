<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
			<sql:query var="projects" dataSource="jdbc/covid">
            	select title, description, pi_name, pi_institution
            	from palantir.n3c_project_test
            	order by title;
            </sql:query>
			
{
    "headers": [
        {"value":"title", "label":"Title"},
        {"value":"description", "label":"Description"},
        {"value":"pi_name", "label":"PI Name"},
        {"value":"pi_institution", "label":"PI Institution"}
    ],
    "rows" : [
    <c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	    {
	    	"title":"${row.title}",
	    	"description":"${row.description}",
	    	"pi_name":"${row.pi_name}",
	        "pi_institution":"${row.pi_institution}"
	    }<c:if test="${!rowCounter.last}">,</c:if>
</c:forEach>
    ]
}
			