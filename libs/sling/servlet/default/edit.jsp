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
%><sling:defineObjects /><%
%><!DOCTYPE html>
<html>
	<sling:include resource="<%=resource%>" resourceType="components/head"/>
	<body>
		<sling:include resource="<%=resource%>" resourceType="components/navbar"/>
    <div class="container-fluid">
			<sling:include resource="<%=resource%>" resourceType="components/breadcrumb"/>

			<a class="btn" href="<%=resource.getPath() + ".properties.html"%>">properties</a>
			<a class="btn" href="<%=resource.getPath() + ".create.html"%>">new</a>

			<% if (currentNode.hasNodes()) { %>
			<sling:include resource="<%=resource%>" resourceType="components/pathlist"/>
			<% } else { %>
			<h3>this node has no children</h3>
			<% } %>
		</div>
	</body>
</html>