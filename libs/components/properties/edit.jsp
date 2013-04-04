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

	PropertyIterator properties = null;
	String requestPath = slingRequest.getRequestPathInfo().getResourcePath();
	String content = requestPath;
	if (resource instanceof NonExistingResource) {
		content = requestPath.substring (0, requestPath.indexOf ('.'));
	}
	else {
		properties = currentNode.getProperties();
	}

%>
<FORM ID="DELETE_PROPERTY_FORM" METHOD="POST" ACTION="<%= content %>" ENCTYPE="MULTIPART/FORM-DATA">
	<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>" />
	<INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>" />
</FORM>

<FORM ID="EDIT_PROPERTIES_FORM" class="form-horizontal" METHOD="POST" ACTION="<%= content %>" ENCTYPE="MULTIPART/FORM-DATA">
	<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>" />
	<INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>" />
		<fieldset>
		<legend>Existing Properties</legend>
		<% 
			if (properties != null) {
				for (;properties.hasNext();) {
					Property p = properties.nextProperty();
					String name = p.getName();
					if (p.isMultiple() == true) continue;
					if (name.equals("jcr:data")) continue;

					String value = p.getString();

					if (name.startsWith("cr:")) {
		%>			
		<label><%=name%> = <%=value%></label>
		<%
					}
					else {
		%>
		<div class="control-group">
		 <label class="control-label" for="<%=name%>"><%=name%></label>
		 <div class="controls">
				<INPUT id="<%=name%>" TYPE="TEXT" NAME="<%=name%>" VALUE="<%=value%>" />
				<span class="help-inline">
					<div class="btn-group">
					<BUTTON class="btn btn-success" TYPE="SUBMIT"><i class="icon-ok icon-white"></i></BUTTON>
					<BUTTON class="btn btn-danger" TYPE="SUBMIT" NAME="<%=name%>" VALUE="" FORM="DELETE_PROPERTY_FORM"><i class="icon-trash icon-white"></i></BUTTON>
					</div>
				</span>
		 </div>
		</div>
		<%  	}
				}
			}
		%>
		</fieldset>
</FORM>

<FORM ID="ADD_PROPERTY_FORM" class="form-horizontal" METHOD="POST" ACTION="<%= content %>" ENCTYPE="MULTIPART/FORM-DATA">
	<fieldset>
		<legend>Add New Property</legend>
		<div class="control-group">
			<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=slingRequest.getRequestURL()%>" />
			<INPUT TYPE="HIDDEN" NAME=":errorpage" VALUE="<%=slingRequest.getRequestURL()%>" />
			<INPUT class="input-medium" TYPE="TEXT" placeholder="new property name" NAME=":propery_name" VALUE="" required/>
			<INPUT style="margin-left:12px" TYPE="TEXT" placeholder="value" NAME=":propery_name@NameFrom" VALUE=""/>
			<BUTTON class="btn btn-success" TYPE="SUBMIT"><i class="icon-ok icon-white"></i></BUTTON>
		</div>
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
