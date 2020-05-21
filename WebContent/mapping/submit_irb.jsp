<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

    <sql:update dataSource="jdbc/covid">
        delete from n3c_admin.mapping_irb where n3c = ?
        <sql:param>${param.slot1}</sql:param>
    </sql:update>

    <sql:update dataSource="jdbc/covid">
        insert into n3c_admin.mapping_irb select coalesce(substring(site from '(.*) \([^)]+\)$'),site) as site,substring(site from '.* \(([^),]+).*\)$') as city,substring(site from '.* \([^),]+, *(.*)\)$') as state,site as n3c,institution as irb from n3c_admin.site_tracking,n3c_admin.irb where site=? and institution=?;
        <sql:param>${param.slot1}</sql:param>
        <sql:param>${param.slot2}</sql:param>
    </sql:update>

<c:redirect url="mapper_irb.jsp"/>
