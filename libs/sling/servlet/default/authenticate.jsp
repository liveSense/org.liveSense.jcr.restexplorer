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
			<h3>Login <a href="#"><%= resource.getPath() %></a></h3>
  </div>

  <div class="modal-body">


<form method="post" action="/j_security_check" enctype="MULTIPART/FORM-DATA" accept-charset="UTF-8">

	<input type="hidden" name="_charset_" value="UTF-8">
	<input type="hidden" name="resource" value="<%= resource.getPath() %>.edit.html">
	<input type="hidden" name="selectedAuthType" value="form">
	<input id="j_username" name="j_username" type="text" accesskey="u">
	<input id="j_password" name="j_password" type="password" accesskey="p">
	<button id="login" accesskey="l" class="btn" type="submit"><u>L</u>ogin</button>

</form>

	</div>
  <div class="modal-footer">
    <a href="<%= resource.getPath() + ".edit.html" %>" class="btn">Ok</a>
  </div>

		</div>
		</div>
		</div>
	</body>
</html>
