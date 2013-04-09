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
									javax.jcr.query.QueryResult,
                  javax.jcr.query.QueryManager,
                  javax.jcr.query.Query,
									org.apache.sling.api.*,
                  utils.*"
%><%@ include file="/apps/rested/components/utils.jsp" %>
<%@ taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0" %><%
%><%!

NodeIterator listNodes (Node currentNode) throws Exception {
	NodeIterator children = currentNode.getNodes();
	return children;
}

NodeIterator searchNodes (SlingHttpServletRequest req, String q) throws Exception {
	String queryType = "JCR-SQL2";
	String statement = "SELECT * FROM [nt:base] as N WHERE contains(N.*, 'ondrej')";//ISDESCENDANTNODE([/%])";
	Session session = req.getResourceResolver ().adaptTo (Session.class);
	QueryManager queryManager = session.getWorkspace().getQueryManager ();
	Query query = queryManager.createQuery (statement, queryType);

	QueryResult result = query.execute ();
	NodeIterator nodeIter = result.getNodes ();
	return nodeIter;
}

%><%
%><sling:defineObjects /><%

String requestPath = getRequestPath(slingRequest);
String requestSelector = getRequestSelectorExtension(slingRequest);
String suffix = slingRequest.getRequestPathInfo().getSuffix();

%>

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
		NodeIterator children = null;
		String q = request.getParameter("q");

		if (q != null) children = searchNodes((SlingHttpServletRequest)request, q);
		else children = listNodes(currentNode);
		
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
					<div class="btn-group">
						<a class="btn btn-mini" href="<%=node.getPath()+".moveto.html/"%>"><i class="icon-arrow-right icon-white"></i></a>
						<a class="btn btn-mini" href="<%=node.getPath()+".copyto.html/"%>"><i class="icon-plus icon-white"></i></a>
						<a class="btn btn-mini" href="<%=node.getPath()+".remove.html"%>"><i class="icon-trash icon-white"></i></a>
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

