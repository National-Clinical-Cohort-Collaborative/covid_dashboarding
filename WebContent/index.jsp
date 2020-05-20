<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="head.jsp" flush="true">
    <jsp:param name="title" value="CD2H Analytics" />
</jsp:include>
<style type="text/css" media="all">
@import "resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
    <jsp:include page="header.jsp" flush="true" />

    <div class="container pl-0 pr-0">
        <br/> <br/>
        <div class="container-fluid">
        <h1>acknowledgments</h1>
<p>The acknowledgement sections of journal articles are a rich source of contributions to research that do not rise to the level of authorship.
This application is an initial deployment of a tool supporting exploration of PubMed Central acknowledgements.
We have two primary goals at this stage.  The first is to serve as a source of expertise for <a href="http://labs.cd2h.org/search/facetSearch.jsp">CTSAsearch</a>
regarding individuals key to research success
that typically are not coauthors or coinvestigators.
The second is as a source of ground truth for coathor contribution to feed into the CD2H
<a href="https://github.com/data2health/CTS-Personas">CTS Personas</a> project and the
<a href="https://github.com/data2health/scits-platform">Science of Translational Science Platform</a>.</p>
<h5>Current Status</h5>
<p>Harvesters run roughly daily to download the latest releases from the Open Access component of PubMed Central. Each publication release is distributed as
a compressed tar file.  The harvester scans the tar file, generating a table of contents, and extracting the XML version of the paper.  The XML is then
scanned for an acknowledgment section, which is extracted, separated into sentences and parsed with the Stanford NLP parser.  The Iowa extraction framework
then extracts entities and populates the database illustrated below.  While this is very much still a work in progress (particularly regarding the current
set of extraction rules!), it still provides useful data at an increasingly sophisticated level as the extraction rule set is improved.</p>
<img src="images/diagram.png" width="100%">
        </div>
        <jsp:include page="footer.jsp" flush="true" />
        </div>
</body>

</html>
