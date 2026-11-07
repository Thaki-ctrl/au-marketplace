<%@ tag description="Shared page layout" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ attribute name="title" required="true" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="user" value="${sessionScope.authenticatedUser}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><c:out value="${title}" /> | AU Marketplace</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
  <link href="${ctx}/assets/css/custom.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">

  <nav class="navbar navbar-expand-lg navbar-dark bg-au sticky-top">
    <div class="container">
      <a class="navbar-brand" href="${ctx}/index.jsp"><i class="bi bi-book-half me-2"></i>AU Marketplace</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="mainNav">
        <ul class="navbar-nav me-auto">
          <li class="nav-item"><a class="nav-link" href="${ctx}/products.jsp">Browse</a></li>

          <c:if test="${not empty user}">
            <c:choose>
              <c:when test="${user.role == 'ADMIN'}">
                <li class="nav-item"><a class="nav-link" href="${ctx}/admin_dashboard.jsp">Admin Dashboard</a></li>
              </c:when>
              <c:otherwise>
                <li class="nav-item"><a class="nav-link" href="${ctx}/student_dashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/my_listings.jsp">My Listings</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/offers.jsp">Offers</a></li>
                <li class="nav-item"><a class="nav-link" href="${ctx}/transactions.jsp">Transactions</a></li>
              </c:otherwise>
            </c:choose>
          </c:if>
        </ul>

        <form class="d-flex me-lg-3 my-2 my-lg-0" method="get" action="${ctx}/products.jsp" role="search">
          <input class="form-control form-control-sm me-2" type="search" name="q" placeholder="Search items" aria-label="Search">
          <button class="btn btn-sm btn-light" type="submit"><i class="bi bi-search"></i></button>
        </form>

        <ul class="navbar-nav align-items-lg-center">
          <c:choose>
            <c:when test="${not empty user}">
              <li class="nav-item"><span class="navbar-text me-3">
                <i class="bi bi-person-circle me-1"></i><c:out value="${user.fullName}" /></span></li>
              <li class="nav-item"><a class="btn btn-light btn-sm" href="${ctx}/logout.jsp">Logout</a></li>
            </c:when>
            <c:otherwise>
              <li class="nav-item me-2"><a class="btn btn-outline-light btn-sm" href="${ctx}/login.jsp">Login</a></li>
              <li class="nav-item"><a class="btn btn-light btn-sm" href="${ctx}/register.jsp">Register</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>

  <main class="container py-4 flex-grow-1">
    <c:if test="${not empty message}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <c:out value="${message}" />
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <c:out value="${errorMessage}" />
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>
    <jsp:doBody/>
  </main>

  <footer class="bg-white border-top text-center text-muted py-3 small">
    &copy; Ajman University &middot; INT322 Web Technologies &middot; Digital Academic Marketplace
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${ctx}/assets/js/app.js"></script>
</body>
</html>
