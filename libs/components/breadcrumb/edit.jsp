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
									java.util.*,
									org.apache.sling.api.resource.*,
                  utils.*" 
%><%
%><%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><sling:defineObjects /><%
%>

<FORM ID="DELETE_NODE_FORM" METHOD="POST" ACTION="<%=resource.getPath() %>" ENCTYPE="MULTIPART/FORM-DATA">
	<%
		String parentPath = "/";
		if (resource.getParent() != null) parentPath = resource.getParent().getPath();
	%>
	<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=parentPath%>.edit.html" />
</FORM>

<form id="RENAME_NODE_FORM" method="POST" action="<%=resource.getPath() %>" enctype="MULTIPART/FORM-DATA">
	<input type="hidden" name=":redirect" value="<%=parentPath%>.edit.html" />

	<ul class="breadcrumb">
	<%

		Vector<Resource> v = new Vector<Resource>();
		Resource parent = resource.getParent();

		while (parent != null) {
			v.insertElementAt(parent, 0);
			parent = parent.getParent();
		}
		for (Iterator<Resource> it = v.iterator();it.hasNext();) {
			Resource r = it.next();
			String path = r.getPath();
			String title = r.getName();
			
			if (path.equals("/")) title = "root";
			if (r != resource) {
				%><li style="vertical-align: middle;height:30px"><A href="<%=path%>.edit.html"><%=title%></A><span class="divider"></span></li><%
			}
		}

		if (resource.getPath().equals("/")) { %>
			<li style="vertical-align: middle;height:30px"><A href="/.edit.html">root</A></li>
		<% } else { %>
			<li>
			<span class="controls-dynami">
				<INPUT TYPE="TEXT" NAME="new_node_name" VALUE="<%=resource.getName()%>" />

				<BUTTON class="btn" TYPE="SUBMIT"><i class="icon-ok icon-white">rename</i></BUTTON>
				<BUTTON class="btn" TYPE="SUBMIT" NAME=":operation" VALUE="delete" FORM="DELETE_NODE_FORM"><i class="icon-trash icon-white">x</i></BUTTON>

				<input type="hidden" name=":dest@ValueFrom" value="new_node_name" />
				<input type="hidden" name=":operation" value="move" />
			</span>
			</li>
		<% } %>
	</ul>
</form>
