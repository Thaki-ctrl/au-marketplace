<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:layout title="Home">

  <section class="hero p-5 mb-5">
    <h1 class="display-5 fw-bold">Buy, sell and exchange academic items</h1>
    <p class="lead mb-4">Textbooks, calculators and course materials from fellow Ajman University students, at student prices.</p>
    <a class="btn btn-accent btn-lg me-2" href="${ctx}/products.jsp">Browse Items</a>
    <c:if test="${empty sessionScope.authenticatedUser}">
      <a class="btn btn-outline-light btn-lg" href="${ctx}/register.jsp">Join Now</a>
    </c:if>
    <c:if test="${not empty sessionScope.authenticatedUser and sessionScope.authenticatedUser.role != 'ADMIN'}">
      <a class="btn btn-outline-light btn-lg" href="${ctx}/add_product.jsp">Sell an Item</a>
    </c:if>
  </section>

  <h4 class="mb-3">Categories</h4>
  <div class="row g-3 mb-5">
    <div class="col-6 col-md-3"><a class="category-tile" href="${ctx}/products.jsp?category=Textbooks"><i class="bi bi-book"></i><div class="mt-2">Textbooks</div></a></div>
    <div class="col-6 col-md-3"><a class="category-tile" href="${ctx}/products.jsp?category=Calculators"><i class="bi bi-calculator"></i><div class="mt-2">Calculators</div></a></div>
    <div class="col-6 col-md-3"><a class="category-tile" href="${ctx}/products.jsp?category=Lab+Equipment"><i class="bi bi-eyedropper"></i><div class="mt-2">Lab Equipment</div></a></div>
    <div class="col-6 col-md-3"><a class="category-tile" href="${ctx}/products.jsp?category=Stationery"><i class="bi bi-pencil"></i><div class="mt-2">Stationery</div></a></div>
  </div>

  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4 class="mb-0">Latest listings</h4>
    <a href="${ctx}/products.jsp">See all</a>
  </div>

  <%-- Member 2: forward to index.jsp via a servlet that sets the request attribute "featuredProducts". --%>
  <div class="row g-4 mb-5">
    <c:forEach var="p" items="${featuredProducts}">
      <div class="col-6 col-md-3"><t:product_card product="${p}" /></div>
    </c:forEach>
    <c:if test="${empty featuredProducts}">
      <div class="col-12"><div class="card"><div class="card-body text-center text-muted py-4">
        No listings to show yet. <a href="${ctx}/products.jsp">Browse all items</a>
      </div></div></div>
    </c:if>
  </div>

  <h4 class="mb-3">How it works</h4>
  <div class="row g-4">
    <div class="col-md-4"><div class="card h-100"><div class="card-body text-center">
      <i class="bi bi-search fs-1 text-au"></i><h6 class="mt-2">1. Find</h6>
      <p class="text-muted small mb-0">Search and filter by category, price and keyword.</p></div></div></div>
    <div class="col-md-4"><div class="card h-100"><div class="card-body text-center">
      <i class="bi bi-chat-dots fs-1 text-au"></i><h6 class="mt-2">2. Offer</h6>
      <p class="text-muted small mb-0">Send a price offer. The seller accepts or rejects.</p></div></div></div>
    <div class="col-md-4"><div class="card h-100"><div class="card-body text-center">
      <i class="bi bi-geo-alt fs-1 text-au"></i><h6 class="mt-2">3. Meet</h6>
      <p class="text-muted small mb-0">Arrange a campus meet-up and complete the exchange.</p></div></div></div>
  </div>
</t:layout>
