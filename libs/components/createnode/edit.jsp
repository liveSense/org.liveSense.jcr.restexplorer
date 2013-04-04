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
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><%!
%><%
%><sling:defineObjects /><%

	String parentPath = "/";
	if (currentNode.getDepth() > 0) parentPath = currentNode.getParent().getPath();

	String newContent = currentNode.getPath();
	if (newContent.equals("/")) newContent = "/";
	else newContent += "/";
%>

<FORM ID="CREATEFORM" METHOD="POST" ACTION="<%= newContent %>" ENCTYPE="MULTIPART/FORM-DATA">
	<fieldset>
	<legend>Add New Node</legend>
		<input type="text" name=":name" value="" required/>
		<input type="hidden" name=":operation" value="import" />
		<input type="hidden" name=":contentType" value="json" />

		<select name=":content">
			<option value="{ 'jcr:primaryType':'nt:unstructured' }">a Node</option>
			<option value="{ 'jcr:primaryType':'sling:Folder' }">Sling Folder</option>
			<option value="{ 'jcr:primaryType':'nt:file','jcr:content':{'jcr:primaryType':'nt:resource','jcr:data':'','jcr:mimeType':'text/plain'} }">Empty Text File</option>
		</select>

		<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>" />
		<INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>" />

		<BUTTON TYPE="SUBMIT">Create Node</BUTTON>
	</fieldset>
</FORM>

<FORM ID="UPLOADFORM" METHOD="POST" ACTION="<%= currentNode.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
	<fieldset>
	<legend>Upload New Node</legend>
		<INPUT TYPE="FILE" NAME="*"/>

		<BUTTON TYPE="SUBMIT">Upload File</BUTTON>
		<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>" />
		<INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>" />
	</fieldset>
</FORM>

<%
	String error = request.getParameter("error");
	if (error != null) {
		%>
		<div class="alert alert-error">
		<a href="<%=slingRequest.getRequestURL()%>" class="close">&times;</a>
		<strong>Error while saving data!</strong>
		<%= error %>
		<p>
		You may have to <a href=#">login</a> before making any changes.
		</div>
		<%
	}
%>
