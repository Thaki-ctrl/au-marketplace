<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout title="Register">
  <div class="card auth-card"><div class="card-body p-4">
    <h3 class="mb-1">Create account</h3>
    <p class="text-muted">Use your Ajman University details.</p>

    <%-- Member 1: RegisterServlet (POST). Fields: fullName, username, email, password. --%>
    <form method="post" action="${pageContext.request.contextPath}/RegisterServlet" class="needs-validation" novalidate>
      <div class="mb-3">
        <label class="form-label" for="fullName">Full name</label>
        <input class="form-control" id="fullName" name="fullName" required maxlength="100">
        <div class="invalid-feedback">Full name is required.</div>
      </div>
      <div class="mb-3">
        <label class="form-label" for="username">Username</label>
        <input class="form-control" id="username" name="username" required minlength="3" maxlength="30" pattern="[A-Za-z0-9_.]+">
        <div class="invalid-feedback">3 to 30 characters: letters, numbers, dot or underscore.</div>
      </div>
      <div class="mb-3">
        <label class="form-label" for="email">Email</label>
        <input class="form-control" type="email" id="email" name="email" required>
        <div class="invalid-feedback">Enter a valid email address.</div>
      </div>
      <div class="mb-3">
        <label class="form-label" for="password">Password</label>
        <input class="form-control" type="password" id="password" name="password" required minlength="8">
        <div class="invalid-feedback">At least 8 characters.</div>
      </div>
      <div class="mb-3">
        <label class="form-label" for="confirmPassword">Confirm password</label>
        <input class="form-control" type="password" id="confirmPassword" name="confirmPassword" required>
        <div class="invalid-feedback">Passwords must match.</div>
      </div>
      <button class="btn btn-au w-100" type="submit">Register</button>
    </form>

    <p class="text-center small mt-3 mb-0">Already registered? <a href="${pageContext.request.contextPath}/login.jsp">Login</a></p>
  </div></div>
</t:layout>
