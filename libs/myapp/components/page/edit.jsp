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
    <title><%=(resource.adaptTo(ValueMap.class)).get("title","untitled")%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/libs/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <!-- script src="/libs/jquery/js/jquery.js"></script -->
    <!-- script src="/libs/bootstrap/js/bootstrap.js"></script -->
		<style>
		.over {
			border: solid 1px red;
		}
		</style>

  </head>
	<body>
	<a href="<%=resource.getPath()+".properties.html"%>">props</a>
	<sling:include resource="<%=resource%>" resourceType="myapp/components/container"/>
	<script>

function handleDragOver(e) {
  if (e.preventDefault) {
    e.preventDefault(); // Necessary. Allows us to drop.
  }

  e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.

  return false;
}

function handleDragEnter(e) {
  this.classList.add('over');
	return true;
}

function handleDragLeave(e) {
  this.classList.remove('over');
	return true;
}

function handleDrop(e) {
	var data = e.dataTransfer.getData('text/plain');
	var node = this.dataset["node"];
	alert (">>>" + data + "=>" + node);

	var containers = document.querySelectorAll('.container');
  [].forEach.call(containers, function (col) {
    col.classList.remove('over');
  });

	return true;
}

		var containers = document.querySelectorAll('.container');
		[].forEach.call(containers, function(con) {
			con.addEventListener('dragenter', handleDragEnter, false);
			con.addEventListener('dragover', handleDragOver, false);
			con.addEventListener('dragleave', handleDragLeave, false);
			con.addEventListener('drop', handleDrop, false);
		});
			
	</script>
	</body>
</html>
