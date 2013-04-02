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
									org.apache.sling.api.*,
                  utils.*"
%><%@ include file="/libs/components/utils.jsp" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><%!

%><%
%><sling:defineObjects /><%

String requestPath = getRequestPath(slingRequest);
String requestSelector = getRequestSelectorExtension(slingRequest);
String suffix = slingRequest.getRequestPathInfo().getSuffix();

%>

<FORM ID="PATHSFORM" METHOD="POST" ACTION="<%=currentNode.getPath()%>" ENCTYPE="MULTIPART/FORM-DATA">
	<table class="table table-condensed pathlist">
		<thead>
			<th class="nodetype"></th>
			<th>name</th>
			<th>type</th>
			<th>rtype</th>
			<th></th>
		</thead>
		<tbody>
	<%
		NodeIterator children = currentNode.getNodes();
		while (children.hasNext ()) {
			Node node = children.nextNode();
			String type = node.getProperty("jcr:primaryType").getString();
			String name = node.getName();
			String path = node.getPath();
			String rtype = "";
			if (node.hasProperty("sling:resourceType")) rtype = node.getProperty("sling:resourceType").getString();

			if (suffix != null) path = requestPath + path;
			else path = path + "." + requestSelector;
	%>
			<tr>
				<td><i class="<%=iconForType(type)%>"></i></td>
				<td><a href="<%=path%>"><%=name + (isFolder(type)?"/":"")%></a></td>
				<td><%=type%></td>
				<td><%=rtype%></td>
				<td>
					<div>
					<span class="control-toolba">
						<a class="btn" href="<%=node.getPath()+".moveto.html/"%>"><i class="icon-arrow-right icon-white">move</i></a>
						<a class="btn" href="<%=node.getPath()+".copyto.html/"%>"><i class="icon-plus icon-white">copy</i></a>
						<BUTTON class="btn" TYPE="SUBMIT" NAME=":applyTo" VALUE="<%=node.getPath()%>"><i class="icon-trash icon-white">x</i></BUTTON>
					</span>
					</div>
				</td>
			</tr>
	<%
		}
		String parentPath = "/";
		if (currentNode.getDepth() > 0) parentPath = currentNode.getParent().getPath();

		String newContent = currentNode.getPath();
		if (newContent.equals("/")) newContent = "/*";
		else newContent += "/*";
	%>
		</tbody>
	</table>
	<INPUT TYPE="HIDDEN" NAME=":operation" VALUE="delete" />
	<INPUT TYPE="HIDDEN" NAME=":redirect" VALUE="<%=currentNode.getPath()%>.edit.html" />
</FORM>

