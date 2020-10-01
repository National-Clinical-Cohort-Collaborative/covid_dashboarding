<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
			<sql:query var="projects" dataSource="jdbc/covid">
            	select title, count
            	from n3c_admin.enclave_stats
            	order by title;
            </sql:query>
			
{
    "headers": [
        {"value":"sites_ingested", "label":"Title"},
        {"value":"visit_rows", "label":"Number of Visits"},
        {"value":"death_rows", "label":"Number of Deaths"},
        {"value":"person_rows", "label":"Number of Patients"},
        {"value":"covid_positive_patients", "label":"Number of COVID-19-positive Patients"},
        {"value":"observation_rows", "label":"Number of Observations"},
        {"value":"measurement_rows", "label":"Number of Measurements"}
    ],
    "rows" : [
    <c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	    {
	    	"${row.title}":"${row.count}"
	    }<c:if test="${!rowCounter.last}">,</c:if>
</c:forEach>
    ]
}
			