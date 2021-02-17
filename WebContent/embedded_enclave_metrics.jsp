<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
{		
			<sql:query var="dta" dataSource="jdbc/covid">
            	select title, round(value::int/1000000.0,1) as value from n3c_admin.enclave_stats where title='person_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">			
				"${row.title}": {
					"value": "${row.value}",
					"unit": "M"
				},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title, value::int as value from n3c_admin.enclave_stats where title='covid_positive_patients';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": {
					"value": "${row.value}",
					"unit": ""
				},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title, round(value::bigint/1000000000.0, 1) as value from n3c_admin.enclave_stats where title='total_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": {
					"value": "${row.value}",
					"unit": "B"
				},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title, round(value::int/1000000.0, 1) as value from n3c_admin.enclave_stats where title='observation_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": {
					"value": "${row.value}",
					"unit": "M"
				}
			</c:forEach>


}
