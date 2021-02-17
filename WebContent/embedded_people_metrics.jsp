<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
	
{		
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) as value from n3c_admin.domain_team;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">			
				"domain_teams": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) as value from n3c_admin.dua_master where duaexecuted is not null;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"number_duas": "${row.value}",
			</c:forEach>
			
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) as value from n3c_admin.enclave_project;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"projects": "${row.value}",
			</c:forEach>
			
			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(distinct(institutionid)) as value from (select institutionid from n3c_admin.dua_master UNION select institutionid from n3c_admin.dta_master) as x;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"institutions": "${row.value}",
			</c:forEach>

			<sql:query var="dta" dataSource="jdbc/covid">
            	select count(*) as value from palantir.n3c_user;
            </sql:query>
			<c:forEach items="${dta.rows}" var="row" varStatus="rowCounter">
				"users": "${row.value}"
			</c:forEach>

}