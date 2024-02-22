<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="dua" dataSource="jdbc/covid">
    select jsonb_pretty(jsonb_agg(foo)) as aggregate from
    (select institutionname as site_name, tenantduacontactfirst||' '||tenantduacontactlast as contact, tenantduaexecuted as date_executed
    from tenant_admin.dua_master
    order by 2) as foo;
</sql:query>

{
    "headers": [
        {"value":"site_name", "label":"Institution"},
        {"value":"contact", "label":"Local Contact"},
        {"value":"date_executed", "label":"Date Executed"}
    ],
    "rows" :
    <c:forEach items="${dua.rows}" var="row" varStatus="rowCounter">
	    ${row.aggregate}
	</c:forEach>

}
       