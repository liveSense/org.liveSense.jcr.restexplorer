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
	<sling:include resource="<%=resource%>" resourceType="components/head" replaceSelectors="edit"/>
	<body style="background-color:gray">
    <div class="container-fluid">

	<div class="container-fluid">
				<div class="modal">
		<div class="modal-header">
			<h3>Create Node in <a href="#"><%= resource.getPath() %></a></h3>
  </div>

  <div class="modal-body">

			<sling:include resource="<%=resource%>" resourceType="components/breadcrumb" replaceSelectors="view"/>
			<sling:include resource="<%=resource%>" resourceType="components/createnode" replaceSelectors="edit"/>

	</div>
  <div class="modal-footer">
    <a href="<%= resource.getPath() + ".edit.html" %>" class="btn btn-primary">Dismiss</a>
  </div>

		</div>
		</div>
		</div>
	</body>
</html>
