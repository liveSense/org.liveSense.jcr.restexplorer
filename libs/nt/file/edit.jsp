<%--
/************************************************************************
 **     $Date: $
 **   $Source: $
 **   $Author: $
 ** $Revision: $
 ************************************************************************/
--%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%><%@page import="java.io.*,
                  java.net.*,
									javax.jcr.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><%!
%><%
%><sling:defineObjects /><%
	String type = "unknown";
	if (currentNode.hasProperty("jcr:content/jcr:mimeType")) {
		String mimetype = currentNode.getProperty("jcr:content/jcr:mimeType").getString();
		type = mimetype.substring(0,mimetype.indexOf ('/'));
	}
%><!DOCTYPE html>
<html>
	<sling:include resource="<%=resource%>" resourceType="components/head" replaceSelectors="edit" />
	<body>
		<sling:include resource="<%=resource%>" resourceType="components/breadcrumb" replaceSelectors="edit"/>
		<a href="<%=resource.getPath() + "/_jcr_content.edit.html"%>">view jcr:content</a>
		<% if ("text".equalsIgnoreCase(type)) { %>
			<DIV style="width:100%">
				<sling:include resource="<%=resource%>" resourceType="components/editor/text"/>
			</DIV>
		<% } else { %>
			<IFRAME width="100%" src="<%=currentNode.getPath()%>"></IFRAME>
		<% } %>
	</body>
</html>
