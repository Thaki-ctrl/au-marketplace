<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:layout title="Admin Dashboard">

  <div class="mb-4">
    <h2 class="mb-0">Admin Dashboard</h2>
    <p class="text-muted mb-0">Manage students and listings across the marketplace.</p>
  </div>

  <%-- Request attributes expected (set by the servlet that forwards here):
       totalUsers, totalListings, totalOffers, totalTransactions (numbers; missing shows 0)
       users    : list of users    (getUserId, getUsername, getFullName, getEmail, getRole, isActive)
       products : list of products (getProductId, getTitle, getPrice, getCategory, getSellerName)
       Forms post to /AdminServlet with a hidden "action":
         deleteProduct (productId), toggleUser (userId), deleteUser (userId) --%>

  <div class="row g-3 mb-4">
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-people me-1"></i>Users</div>
      <div class="stat-value"><c:out value="${empty totalUsers ? 0 : totalUsers}" /></div>
    </div></div></div>
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-box-seam me-1"></i>Listings</div>
      <div class="stat-value"><c:out value="${empty totalListings ? 0 : totalListings}" /></div>
    </div></div></div>
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-chat-dots me-1"></i>Offers</div>
      <div class="stat-value"><c:out value="${empty totalOffers ? 0 : totalOffers}" /></div>
    </div></div></div>
    <div class="col-6 col-lg-3"><div class="card stat-tile h-100"><div class="card-body">
      <div class="text-muted small"><i class="bi bi-arrow-left-right me-1"></i>Transactions</div>
      <div class="stat-value"><c:out value="${empty totalTransactions ? 0 : totalTransactions}" /></div>
    </div></div></div>
  </div>

  <ul class="nav nav-tabs mb-3" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab-users" type="button" role="tab">Users</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-listings" type="button" role="tab">Listings</button>
    </li>
  </ul>

  <div class="tab-content">

    <%-- USERS --%>
    <div class="tab-pane fade show active" id="tab-users" role="tabpanel">
      <div class="card"><div class="card-body">
        <div class="table-responsive">
          <table class="table align-middle mb-0">
            <thead><tr><th>#</th><th>Name</th><th>Username</th><th>Email</th><th>Role</th><th>Status</th><th></th></tr></thead>
            <tbody>
              <c:forEach var="u" items="${users}">
                <tr>
                  <td><c:out value="${u.userId}" /></td>
                  <td><c:out value="${u.fullName}" /></td>
                  <td><c:out value="${u.username}" /></td>
                  <td><c:out value="${u.email}" /></td>
                  <td><span class="badge bg-light text-dark border"><c:out value="${u.role}" /></span></td>
                  <td>
                    <c:choose>
                      <c:when test="${u.active}"><span class="status-badge status-accepted">ACTIVE</span></c:when>
                      <c:otherwise><span class="status-badge status-rejected">SUSPENDED</span></c:otherwise>
                    </c:choose>
                  </td>
                  <td class="text-end">
                    <c:if test="${u.role != 'ADMIN'}">
                      <div class="d-inline-flex gap-1">
                        <form method="post" action="${ctx}/AdminServlet" class="m-0">
                          <input type="hidden" name="action" value="toggleUser">
                          <input type="hidden" name="userId" value="<c:out value='${u.userId}' />">
                          <button class="btn btn-sm btn-outline-secondary" type="submit">
                            <c:out value="${u.active ? 'Suspend' : 'Activate'}" />
                          </button>
                        </form>
                        <form method="post" action="${ctx}/AdminServlet" class="m-0"
                              data-confirm="Delete this user permanently?">
                          <input type="hidden" name="action" value="deleteUser">
                          <input type="hidden" name="userId" value="<c:out value='${u.userId}' />">
                          <button class="btn btn-sm btn-outline-danger" type="submit">Delete</button>
                        </form>
                      </div>
                    </c:if>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${empty users}">
                <tr><td colspan="7" class="text-center text-muted py-4">No users to show.</td></tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div></div>
    </div>

    <%-- LISTINGS --%>
    <div class="tab-pane fade" id="tab-listings" role="tabpanel">
      <div class="card"><div class="card-body">
        <div class="table-responsive">
          <table class="table align-middle mb-0">
            <thead><tr><th>#</th><th>Title</th><th>Category</th><th>Price</th><th>Seller</th><th></th></tr></thead>
            <tbody>
              <c:forEach var="p" items="${products}">
                <tr>
                  <td><c:out value="${p.productId}" /></td>
                  <td><a href="${ctx}/product_details.jsp?id=${p.productId}"><c:out value="${p.title}" /></a></td>
                  <td><c:out value="${p.category}" /></td>
                  <td><c:out value="${p.price}" /> AED</td>
                  <td><c:out value="${p.sellerName}" /></td>
                  <td class="text-end">
                    <form method="post" action="${ctx}/AdminServlet" class="m-0"
                          data-confirm="Remove this listing?">
                      <input type="hidden" name="action" value="deleteProduct">
                      <input type="hidden" name="productId" value="<c:out value='${p.productId}' />">
                      <button class="btn btn-sm btn-outline-danger" type="submit">Remove</button>
                    </form>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${empty products}">
                <tr><td colspan="6" class="text-center text-muted py-4">No listings to show.</td></tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div></div>
    </div>
  </div>
</t:layout>
