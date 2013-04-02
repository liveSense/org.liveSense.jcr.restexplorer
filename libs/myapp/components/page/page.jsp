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
                  java.util.*,
									javax.jcr.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/libs/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="/libs/jquery/js/jquery.js"></script>
    <script src="/libs/bootstrap/js/bootstrap.js"></script>
  </head>
	<body>
<%
for (Resource res: resource.getChildren()) {
	%><sling:include resource="<%=res%>"/><%
}
%>
	</body>
</html>
