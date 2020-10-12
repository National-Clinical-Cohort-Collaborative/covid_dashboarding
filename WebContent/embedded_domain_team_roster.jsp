<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/covid">
select
    jsonb_pretty(json_agg(team)::jsonb)
from
    (select
        'https://covid.cd2h.org/node/'||nid as url,
        cross_cutting::boolean,
        title,
        substring(summary from '<p>(.*)</p.*') as summary,
        substring(description from '<h2>Mission</h2>[^<]*(.*)') as description,
        ( select jsonb_agg(leads)
        	from (select
        				delta,
        				'https://covid.cd2h.org/node/'||lead_nid as url,
        				bio.title as name,
        				substring(bio.body_value from '<p>(.*)</p.*') as institution
        			from n3c_web.domain_team_lead, n3c_web.bio
        			where domain_team_lead.nid = domain_team.nid
        			  and lead_nid = bio.nid
        			order by delta
        			) as leads
        	) as leads
     from n3c_web.domain_team
    ) as team
;
</sql:query>
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
			