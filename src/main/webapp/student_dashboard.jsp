<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:layout title="Student Dashboard">

  <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
    <div>
      <h2 class="mb-0">Welcome, <c:out value="${sessionScope.authenticatedUser.fullName}" /></h2>
      <p class="text-muted mb-0">Your marketplace activity at a glance.</p>
    </div>
    <a class="btn btn-au mt-2 mt-md-0" href="${ctx}/add_product.jsp"><i class="bi bi-plus-lg me-1"></i>Sell an Item</a>
  </div>

  <%-- Request attributes expected (set by the servlet that forwards here):
       myListingCount, offersMadeCount, offersReceivedCount, completedCount (numbers)
       myListings    : list of products  (getProductId, getTitle, getPrice, getCategory, getImagePath, getSellerName)
       recentOffers  : list of offers    (getOfferId, getProductTitle, getAmount, getStatus)
       Missing numbers display as 0. --%>

  <div class="row g-3 mb-4">
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-box-seam me-1"></i>My listings</div>
      <div class="stat-value"><c:out value="${empty myListingCount ? 0 : myListingCount}" /></div>
    </div></div></div>
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-send me-1"></i>Offers made</div>
      <div class="stat-value"><c:out value="${empty offersMadeCount ? 0 : offersMadeCount}" /></div>
    </div></div></div>
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-inbox me-1"></i>Offers received</div>
      <div class="stat-value"><c:out value="${empty offersReceivedCount ? 0 : offersReceivedCount}" /></div>
    </div></div></div>
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-check-circle me-1"></i>Completed deals</div>
      <div class="stat-value"><c:out value="${empty completedCount ? 0 : completedCount}" /></div>
    </div></div></div>
  </div>

  <div class="row g-4">
    <div class="col-lg-7">
      <div class="card h-100"><div class="card-body">
        <div class="d-flex justify-content-between align-items-center mb-3">
          <h5 class="card-title mb-0">My recent listings</h5>
          <a href="${ctx}/my_listings.jsp" class="small">Manage all</a>
        </div>
        <div class="table-responsive">
          <table class="table align-middle mb-0">
            <thead><tr><th>Item</th><th>Category</th><th>Price</th><th></th></tr></thead>
            <tbody>
              <c:forEach var="p" items="${myListings}">
                <tr>
                  <td><c:out value="${p.title}" /></td>
                  <td><c:out value="${p.category}" /></td>
                  <td><c:out value="${p.price}" /> AED</td>
                  <td class="text-end">
                    <a class="btn btn-sm btn-outline-secondary" href="${ctx}/edit_product.jsp?id=${p.productId}">Edit</a>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${empty myListings}">
                <tr><td colspan="4" class="text-center text-muted py-4">
                  You have no listings yet. <a href="${ctx}/add_product.jsp">Create your first one</a>.
                </td></tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div></div>
    </div>

    <div class="col-lg-5">
      <div class="card h-100"><div class="card-body">
        <div class="d-flex justify-content-between align-items-center mb-3">
          <h5 class="card-title mb-0">Recent offers</h5>
          <a href="${ctx}/offers.jsp" class="small">View all</a>
        </div>
        <div class="table-responsive">
          <table class="table align-middle mb-0">
            <thead><tr><th>Item</th><th>Amount</th><th>Status</th></tr></thead>
            <tbody>
              <c:forEach var="o" items="${recentOffers}">
                <tr>
                  <td><c:out value="${o.productTitle}" /></td>
                  <td><c:out value="${o.amount}" /> AED</td>
                  <td><t:status_badge status="${o.status}" /></td>
                </tr>
              </c:forEach>
              <c:if test="${empty recentOffers}">
                <tr><td colspan="3" class="text-center text-muted py-4">No offers yet.</td></tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div></div>
    </div>
  </div>
</t:layout>
