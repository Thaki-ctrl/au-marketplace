<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout title="Login">
  <div class="card auth-card"><div class="card-body p-4">
    <h3 class="mb-1">Welcome back</h3>
    <p class="text-muted">Sign in with your marketplace account.</p>

    <%-- Member 1: LoginServlet (POST). Fields: username, password. --%>
    <form method="post" action="${pageContext.request.contextPath}/LoginServlet" class="needs-validation" novalidate>
      <div class="mb-3">
        <label class="form-label" for="username">Username</label>
        <input class="form-control" id="username" name="username" required autofocus>
        <div class="invalid-feedback">Please enter your username.</div>
      </div>
      <div class="mb-3">
        <label class="form-label" for="password">Password</label>
        <input class="form-control" type="password" id="password" name="password" required>
        <div class="invalid-feedback">Please enter your password.</div>
      </div>
      <button class="btn btn-au w-100" type="submit">Login</button>
    </form>

    <p class="text-center small mt-3 mb-0">No account? <a href="${pageContext.request.contextPath}/register.jsp">Register</a></p>
  </div></div>
</t:layout>
