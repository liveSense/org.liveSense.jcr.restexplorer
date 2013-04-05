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
%><!DOCTYPE html>
<html style="min-height:100%">
	<sling:include resource="<%=resource%>" resourceType="components/head" replaceSelectors="edit" />
	<body>
		<!-- div style="float:left;height:100%;width:200px;">
			<sling:include path="/libs/myapp/components.edit.html" />
		</div -->
		<div style="height:100%;width:100%;position:fixed">
			<IFRAME height="100%" width="100%" marginwidth="0" marginheight="0" frameborder="0" src="<%=resource.getPath()+".html"%>"></IFRAME>
		</div>
	</body>
</html>

