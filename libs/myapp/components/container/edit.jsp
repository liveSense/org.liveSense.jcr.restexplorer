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
%><sling:defineObjects />
<div class="container data-node="<%=resource%>">
<a href="<%=resource.getPath()+".create.html"%>">add</a>
<%

for (Resource res : resource.getChildren()) {
	%><%=res%><sling:include resource="<%=res %>" /><%
}

%>
</div>
