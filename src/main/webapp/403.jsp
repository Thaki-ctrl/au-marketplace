<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout title="Access Denied">
  <div class="text-center py-5">
    <h1 class="display-3 text-au">403</h1>
    <p class="lead">You don't have permission to view this page.</p>
    <a class="btn btn-au" href="${pageContext.request.contextPath}/index.jsp">Back to home</a>
  </div>
</t:layout>
