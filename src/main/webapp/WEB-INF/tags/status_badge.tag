<%@ tag description="Coloured status badge for offers and transactions" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ attribute name="status" required="true" %>
<c:choose>
  <c:when test="${status == 'PENDING'}"><span class="status-badge status-pending">PENDING</span></c:when>
  <c:when test="${status == 'ACCEPTED'}"><span class="status-badge status-accepted">ACCEPTED</span></c:when>
  <c:when test="${status == 'REJECTED'}"><span class="status-badge status-rejected">REJECTED</span></c:when>
  <c:when test="${status == 'COMPLETED'}"><span class="status-badge status-completed">COMPLETED</span></c:when>
  <c:when test="${status == 'CANCELLED'}"><span class="status-badge status-cancelled">CANCELLED</span></c:when>
  <c:otherwise><span class="status-badge status-cancelled"><c:out value="${status}" /></span></c:otherwise>
</c:choose>
