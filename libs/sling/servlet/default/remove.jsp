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
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%

	String parentPath = "/";
	if (resource.getParent() != null) parentPath = resource.getParent().getPath();

%><!DOCTYPE html>
<html>
	<sling:include resource="<%=resource%>" resourceType="components/head" replaceSelectors="edit"/>
	<body style="background-color:gray">
<FORM ID="PATHSFORM" METHOD="POST" ACTION="<%=resource.getPath()%>" ENCTYPE="MULTIPART/FORM-DATA">
    <div class="container-fluid">

	<div class="container-fluid">
				<div class="modal">
		<div class="modal-header">
			<h3>Remove Node <a href="#"><%= resource.getPath() %></a></h3>
  </div>

  <div class="modal-body">

	</div>
  <div class="modal-footer">
		<INPUT TYPE="HIDDEN" NAME=":operation" VALUE="delete" />
		<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=currentNode.getPath()%>.edit.html" />
    <a href="<%= parentPath+".edit.html" %>" class="btn">Cancel</a>
		<BUTTON class="btn" TYPE="SUBMIT" NAME=":applyTo" VALUE="<%=resource.getPath()%>">Remove</BUTTON>
  </div>

		</div>
		</div>
</FORM>
	</body>
</html>
