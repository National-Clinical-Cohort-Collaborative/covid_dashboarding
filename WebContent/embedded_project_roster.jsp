<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${param.type == 'operational' }">
		<sql:query var="projects" dataSource="jdbc/covid">
            	select title, research_statement, lead_investigator, accessing_institution, task_team
            	from n3c_admin.enclave_project
            	where title ~ '\[N3C'
            	order by title;
         </sql:query>
	</c:when>
	<c:otherwise>
		<sql:query var="projects" dataSource="jdbc/covid">
            	select title, research_statement, lead_investigator, accessing_institution, task_team
            	from n3c_admin.enclave_project
            	where title !~ '\[N3C'
            	order by title;
         </sql:query>
	</c:otherwise>
</c:choose>
			
{
    "headers": [
        {"value":"title", "label":"Title"},
        {"value":"description", "label":"Research Statement"},
        {"value":"pi_name", "label":"Lead Investigator"},
        {"value":"accessing_institution", "label":"Accessing Institution"},
        {"value":"task_team", "label":"Task Team?"}
    ],
    "rows" : [
    <c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	    {
	    	"title":"${row.title}",
	    	"description":"${row.research_statement}",
	    	"pi_name":"${row.lead_investigator}",
	    	"accessing_institution":"${row.accessing_institution}",
	        "task_team":"${row.task_team}"
	    }<c:if test="${!rowCounter.last}">,</c:if>
</c:forEach>
    ]
}
			