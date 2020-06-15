<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="../head.jsp" flush="true">
    <jsp:param name="title" value="N3C N3C-IRB Site Mapping" />
</jsp:include>
<style type="text/css" media="all">
@import "../resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
    <jsp:include page="../header.jsp" flush="true" />
       <div class="container pl-0 pr-0">
        <br /> <br />
        <div class="container-fluid">
			<h2>Mapping Unbound IRB Connections</h2>
 		      <br /> <br />
             <form method='GET' action='submit_irb.jsp'>
			<button type="submit" name="action" value="submit">Submit</button>
 			
             <div id=others style=" float:left; width:45%">
               <sql:query var="cd2h" dataSource="jdbc/covid">
                    select site from n3c_admin.n3c
                    where site not in (select n3c from n3c_admin.mapping_irb)
                       or site in (select n3c from n3c_admin.mapping_irb where irb is null) order by site;
                </sql:query>
                <h3>CD2H/N3C</h3>
                <ul>
                <c:forEach items="${cd2h.rows}" var="row" varStatus="rowCounter">
                    <input id="slot1_${row.site}" name=slot1 type="radio" value="${row.site}">${row.site}<br>
                </c:forEach>
                </ul>
            </div>
 			
             <div id=others style=" float:left; width:45%">
               <sql:query var="ncats" dataSource="jdbc/covid">
                    select institution from n3c_admin.irb where institution not in (select irb from n3c_admin.mapping_irb where irb is not null) order by institution;
                </sql:query>
                <h3>IRB</h3>
                <ul>
                <c:forEach items="${ncats.rows}" var="row" varStatus="rowCounter">
                    <input id="slot2_${row.institution}" name=slot2 type="radio" value="${row.institution}">${row.institution}<br>
                </c:forEach>
                </ul>
            </div>
            </form>
		</div>
	</div>
</body>
</html>
            