<%@ tag description="Reusable product card" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ attribute name="product" required="true" type="java.lang.Object" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="card product-card h-100">
  <c:choose>
    <c:when test="${not empty product.imagePath}">
      <img src="${ctx}/${product.imagePath}" class="card-img-top product-img" alt="<c:out value='${product.title}' />">
    </c:when>
    <c:otherwise>
      <img src="${ctx}/assets/img/placeholder.svg" class="card-img-top product-img" alt="No image">
    </c:otherwise>
  </c:choose>
  <div class="card-body d-flex flex-column">
    <span class="badge bg-light text-dark border align-self-start mb-2"><c:out value="${product.category}" /></span>
    <h6 class="card-title"><c:out value="${product.title}" /></h6>
    <p class="text-muted small mb-2">Seller: <c:out value="${product.sellerName}" /></p>
    <div class="mt-auto d-flex justify-content-between align-items-center">
      <strong class="text-au"><c:out value="${product.price}" /> AED</strong>
      <a class="btn btn-sm btn-au" href="${ctx}/product_details.jsp?id=${product.productId}">View</a>
    </div>
  </div>
</div>
