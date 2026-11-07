<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout title="Something went wrong">
  <div class="text-center py-5">
    <h1 class="display-3 text-au">Oops</h1>
    <p class="lead">That page can't be found, or something went wrong on our side.</p>
    <a class="btn btn-au" href="${pageContext.request.contextPath}/index.jsp">Back to home</a>
  </div>
</t:layout>
