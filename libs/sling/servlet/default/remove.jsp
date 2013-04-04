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
		<form id="PATHSFORM" method="POST" action="<%=resource.getPath()%>" enctype="MULTIPART/FORM-DATA">
			<div class="container-fluid">
				<div class="modal">
					<div class="modal-header">
						<h3>Remove Node <a href="#"><%= resource.getPath() %></a></h3>
					</div>

					<div class="modal-body">
					<p>Are you sure you want to remove this node?
					</div>
					<div class="modal-footer">
						<input type="hidden" name=":operation" value="delete" />
						<input type="hidden" name=":redirect" value="<%=currentNode.getPath()%>.edit.html" />
						<a href="<%= parentPath+".edit.html" %>" class="btn">Cancel</a>
						<BUTTON class="btn btn-danger" TYPE="SUBMIT" NAME=":applyTo" VALUE="<%=resource.getPath()%>">Remove</BUTTON>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
