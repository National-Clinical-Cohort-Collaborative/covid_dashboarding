<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
{		

			<sql:query var="dta" dataSource="jdbc/covid">
            	select 'release_date' as title,to_char(substring(value from '[a-zA-Z]*-v[0-9]*-(.*)')::date, 'MonthFMDD, YYYY') as value from n3c_admin.enclave_stats where title='release_name';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,value from n3c_admin.enclave_stats where title='release_name';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,value from n3c_admin.enclave_stats where title='sites_ingested';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": ${row.value},
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::int/1000000.0,'999.9')||' million') as value from n3c_admin.enclave_stats where title='person_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::int,'FM999,999,999')) as value from n3c_admin.enclave_stats where title='covid_positive_patients';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::bigint/1000000000.0,'999.9')||' billion') as value from n3c_admin.enclave_stats where title='total_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::int/1000000.0,'999.9')||' million') as value from n3c_admin.enclave_stats where title='observation_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::bigint/1000000000.0,'999.9')||' billion') as value from n3c_admin.enclave_stats where title='measurement_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::int/1000000.0,'999.9')||' million') as value from n3c_admin.enclave_stats where title='drug_exposure_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::int/1000000.0,'999.9')||' million') as value from n3c_admin.enclave_stats where title='procedure_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select title,trim(to_char(value::int/1000000.0,'999.9')||' million') as value from n3c_admin.enclave_stats where title='visit_rows';
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"${row.title}": "${row.value}"
			</c:forEach>
}
