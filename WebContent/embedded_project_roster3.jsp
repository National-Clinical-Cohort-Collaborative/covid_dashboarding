<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<sql:query var="projects" dataSource="jdbc/covid">
	select to_json(title) as title, to_json(research_statement) as research_statement, 
	to_json(lead_investigator) as lead_investigator, 
	to_json(accessing_institution) as accessing_institution,
	CASE
		WHEN workspace_status = 'ACTIVE' THEN 'Active'
  		WHEN workspace_status = 'INACTIVE' THEN 'Inactive'
 		END workspace_status,
 	task_team, 
	CASE
		WHEN title ~ '\[N3C' THEN 'Operational'
  		WHEN title !~ '\[N3C' THEN 'General'
 		END project_type
	from n3c_admin.enclave_project
	where lead_investigator != 'Mariam Deacy'
	order by title::text;
</sql:query>


			
{
    "headers": [
        {"value":"title", "label":"Title"},
        {"value":"description", "label":"Research Statement"},
        {"value":"pi_name", "label":"Lead Investigator"},
        {"value":"accessing_institution", "label":"Accessing Institution"},
        {"value":"workspace_status", "label":"Status"},
        {"value":"task_team", "label":"Task Team?"},
        {"value":"project_type", "label":"Project Type"}
    ],
    "rows" : [
    <c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	    {
	    	"title":${row.title},
	    	"description":${row.research_statement},
	    	"pi_name":${row.lead_investigator},
	    	"accessing_institution":${row.accessing_institution},
	    	"workspace_status":"${row.workspace_status}",
	        "task_team":"${row.task_team}",
	        "project_type":"${row.project_type}"
	    }<c:if test="${!rowCounter.last}">,</c:if>
</c:forEach>
    ]
}
			